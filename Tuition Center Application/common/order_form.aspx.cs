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
    public partial class order_form : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected List<string> cart_var = new List<string>();
        string new_student_id = "student: why am i here???";

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            get_a_doc();

        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {

        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            DocumentReference doc = database.Collection("Student").Document(new_student_id);

            class_file.Student new_student = new class_file.Student
            {
                name = name_text.Text.Trim(),
                IC = IC_text.Text.Trim(),
                email = email_text.Text.Trim(),
                password = password_text.Text.Trim(),
                address = address_text.Text.Trim(),
                phoneNo = phone_text.Text.Trim(),
                educationLV = level_ddl.SelectedValue.Trim(),
                school = school_text.Text.Trim(),
                DOB = Timestamp.GetCurrentTimestamp().ToDateTime(),
                OTP = new string(Enumerable.Repeat("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", 6).Select(s => s[new Random().Next(s.Length)]).ToArray()),
                OTP_Send = Timestamp.GetCurrentTimestamp().ToDateTime(),
                avatar = image_hf.Value,
                courseID = cart_var, 
            };

            doc.SetAsync(new_student);
            clear_data();
        }

        async void get_a_doc()
        {
            student_var.Clear();

            Query student_query = database.Collection("Student");
            QuerySnapshot snap = await student_query.GetSnapshotAsync();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                student_var.Add(student);
            }

            new_student_id = (int.Parse(student_var[student_var.Count() - 1].studentID) + 1).ToString();

            System.Diagnostics.Debug.WriteLine("Student_Var count (from get_a_doc): " + student_var.Count());

            get_cart();
        }

        protected void clear_btn_Click(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine("image_hf: " + image_hf.Value);
            clear_data();
        }

        void clear_data()
        {
            name_text.Text = "";
            IC_text.Text = "";
            email_text.Text = "";
            password_text.Text = "";
            confirm_password_text.Text = "";
            address_text.Text = "";
            phone_text.Text = "";
            level_ddl.SelectedIndex = 0;
            school_text.Text = "";
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

            System.Diagnostics.Debug.WriteLine("------------------------------------------------------");
        }
    }
}