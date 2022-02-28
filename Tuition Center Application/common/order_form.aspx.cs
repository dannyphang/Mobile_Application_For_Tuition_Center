using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Stripe;
using Stripe.Checkout;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common
{
    public partial class order_form : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected List<string> cart_var = new List<string>();
        protected List<Course> filtered = new List<Course>();
        string new_student_id = "student: why am i here???";
        public string sessionId = "";

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
            course_var.Clear();

            Query student_query = database.Collection("Student");
            QuerySnapshot snap = await student_query.GetSnapshotAsync();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                student_var.Add(student);
            }

            QuerySnapshot course_snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in course_snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }

            new_student_id = (int.Parse(student_var[student_var.Count() - 1].studentID) + 1).ToString();

            System.Diagnostics.Debug.WriteLine("Student_Var count (from get_a_doc): " + student_var.Count());
        }

        protected void stripe_checkout(object sender, EventArgs e)
        {
            StripeConfiguration.ApiKey = "sk_test_51KLfunFk6dh40g5t1gLqZvN5hOpYVBqp4LK6YJorr0v20oUw05YOuKbs56vxdMa3mQFWE68w5os9Bl6MqTJvcLjl00kUpS4ld0";

            var options = new SessionCreateOptions
            {
                SuccessUrl = "https://www.google.com",
                CancelUrl = "https://www.youtube.com",
                LineItems = new List<SessionLineItemOptions>
                {
                    new SessionLineItemOptions
                    {
                        Name = "Course", 
                        Description = desc(Request.Cookies["Course_Cookies"].Value),
                        Currency = "myr", 
                        Amount = long.Parse(Request.Cookies["amount_cookie"].Value) * 100,
                        Quantity = 1,
                    },
                },
                Mode = "payment",
            };
            var service = new SessionService();
            Session session = service.Create(options);
            System.Diagnostics.Trace.WriteLine(session.Url);
            Response.Redirect(session.Url, false);
        }

        string desc(string cookie_course)
        {
            string msg = "";

            if (cookie_course != null)
            {
                cart_var = cookie_course.Split(' ').ToList();

                filtered = course_var.Where(course => cart_var.Contains(course.courseID)).ToList();

                for (int i = 0; i < filtered.Count(); i++)
                {
                    msg += (i + 1) + ". " + filtered[i].courseName + " (" + filtered[i].day + " " + filtered[i].time_start + "-" + filtered[i].time_end + ")\n";
                }
            }

            return msg;
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
    }
}