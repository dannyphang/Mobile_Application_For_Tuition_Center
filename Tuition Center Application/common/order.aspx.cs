using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common
{
    public partial class order : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();
        protected List<Course> course_display_var = new List<Course>();
        protected List<string> cart_var = new List<string>();
        string new_id = "why r u here???";

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            get_a_doc();
        }

        protected void more_btn_Click(object sender, EventArgs e)
        {

        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {

        }

        async void get_a_doc()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");



            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }
            new_id = (int.Parse(course_var[course_var.Count() - 1].courseID) + 1).ToString();

            
            get_cart();
        }

        async void get_cart()
        {
            DocumentReference doc = database.Collection("Cart").Document("1");

            DocumentSnapshot snap = await doc.GetSnapshotAsync();

            Dictionary<string, object> key = snap.ToDictionary();
            if (snap.Exists)
            {
                foreach (var item in key)
                {
                    if (item.Key == "startTime")
                    {
                        DateTime startTime = ((Timestamp)item.Value).ToDateTime();
                        DateTime current_time = Timestamp.GetCurrentTimestamp().ToDateTime();

                        //DateTime endTime = startTime.AddHours(1);

                        TimeSpan span = current_time.Subtract(startTime);

                        System.Diagnostics.Debug.WriteLine("Start Time: " + startTime);
                        System.Diagnostics.Debug.WriteLine("Current Time: " + current_time);
                        System.Diagnostics.Debug.WriteLine("Span(days): " + span.Days);
                        System.Diagnostics.Debug.WriteLine("Span(hours): " + span.Hours);
                        System.Diagnostics.Debug.WriteLine("Span(minutes): " + span.Minutes);
                        System.Diagnostics.Debug.WriteLine("Span(seconds): " + span.Seconds);

                        //System.Diagnostics.Debug.WriteLine("End Time: " + endTime);

                        //await doc.UpdateAsync("currentTime", current_time);

                        if (int.Parse(span.Days.ToString()) > 0 || int.Parse(span.Hours.ToString()) > 1)
                        {
                            await doc.DeleteAsync();
                            System.Diagnostics.Debug.WriteLine("--DOCUMENT DELETED--");
                        }
                    }

                    if (item.Key == "courseID")
                    {
                        foreach (var array_item in (List<object>)item.Value)
                        {
                            System.Diagnostics.Debug.WriteLine("array_item: " + array_item);
                            cart_var.Add(array_item.ToString());
                        }
                    }
                }
            }

            get_course();
            System.Diagnostics.Debug.WriteLine("------------------------------------------------------");
        }

        void get_course()
        {
            var filtered = course_var.Where(course => cart_var.Contains(course.courseID));
            System.Diagnostics.Debug.WriteLine("filtered count: " + filtered.Count());
            //for (int i = 0; i < filtered.Count(); i++)
            //{
            //    System.Diagnostics.Debug.WriteLine("filtered: " + filtered.ToList()[i]);
            //}
            //for (int i = 0; i < course_var.Count(); i++)
            //{

            //    System.Diagnostics.Debug.WriteLine("course_var: " + course_var[i]);
            //}
            //for (int i = 0; i < cart_var.Count(); i++)
            //{

            //    System.Diagnostics.Debug.WriteLine("cart_var: " + cart_var[i]);
            //}

            order_repeater.DataSource = filtered.ToList();
            order_repeater.DataBind();
            
        }
    }
}