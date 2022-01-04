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
        protected List<Course> filtered = new List<Course>();
        protected List<string> cart_var = new List<string>();
        string new_id = "why r u here???";

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
            
            get_a_doc();
            if (IsPostBack)
            {
                get_cart();
            }
        }

        protected async void delete_btn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string course_id = ((HiddenField)item.FindControl("courseID_hd")).Value;

            DocumentReference cart_doc = database.Collection("Cart").Document("1");

            System.Diagnostics.Debug.WriteLine("Removed course ID: " + course_id);
            await cart_doc.UpdateAsync("courseID", FieldValue.ArrayRemove(course_id));

            get_a_doc();
        }

        async void get_a_doc()
        {
            course_var.Clear();

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
            cart_var.Clear();

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
            filtered = course_var.Where(course => cart_var.Contains(course.courseID)).ToList();
            System.Diagnostics.Debug.WriteLine("filtered count: " + filtered.Count());

            order_repeater.DataSource = filtered;
            order_repeater.DataBind();

            amount_text.Text = get_amount(filtered);
        }

        string get_amount(List<Course> filtered_list)
        {
            float amount = 0;
            for (int i = 0; i < filtered_list.Count(); i++)
            {
                amount += filtered_list[i].price;
            }
            return amount.ToString();
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            //Session["Total_Amount"] = amount_text.Text;
            //Session["Cart_List"] = cart_var;
            Response.Redirect("~/common/order_form.aspx", false);
        }
    }
}