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
using Tuition_Center_Application.util;

namespace Tuition_Center_Application.common.User
{
    public partial class payment : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected List<Course> course_var = new List<Course>();
        protected List<Course> filtered = new List<Course>();
        protected List<string> cart_var = new List<string>();
        protected class_file.Student current_student;

        protected void Page_Load(object sender, EventArgs e)
        {
            database = firebase.get_database();
            validation.check_user("Current_User");

            get_a_student();

            
        }

        async void get_a_student()
        {
            QuerySnapshot snap = await firebase.get_doc_snap("Student");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();

                if (student.studentID == ((class_file.Student)Session["Current_User"]).studentID)
                {
                    System.Diagnostics.Debug.WriteLine("Student Last Payment: " + student.lastPayment);
                    Session["Current_User"] = student;
                    System.Diagnostics.Debug.WriteLine("Student Last Payment (bottom): " + student.lastPayment);
                }
            }

            // if user monthly tuition fee is paid, then promtp the user to other page
            if (isPaid(((class_file.Student)Session["Current_User"]).lastPayment))
            {
                Response.Redirect("~/common/User/payment_history.aspx", false);
            }

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("POST AGAIN!!!!!!!!!!!");
            }

            get_a_doc();
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            Session["new_monthly_payment"] = new PaymentHistory
            {
                payDate = Timestamp.FromDateTime(DateTime.UtcNow), 
                amount = long.Parse(get_amount(filtered)), 
                courseID = ((class_file.Student)Session["Current_User"]).courseID, 
                payMonth = DateTime.Now.ToString("MMMM"), 
                studentID = ((class_file.Student)Session["Current_User"]).studentID,
            };

            StripeConfiguration.ApiKey = "sk_test_51KLfunFk6dh40g5t1gLqZvN5hOpYVBqp4LK6YJorr0v20oUw05YOuKbs56vxdMa3mQFWE68w5os9Bl6MqTJvcLjl00kUpS4ld0";

            var options = new SessionCreateOptions
            {
                SuccessUrl = "https://localhost:44378/" + "common/User/success.aspx",
                CancelUrl = "https://localhost:44378/" + "common/User/payment.aspx",
                LineItems = new List<SessionLineItemOptions>
                {
                    new SessionLineItemOptions
                    {
                        Name = "Tuition Fee",
                        Description = desc(),
                        Currency = "myr",
                        Amount = long.Parse(get_amount(filtered)) * 100,
                        Quantity = 1,
                    },
                },
                Mode = "payment",
            };

            Session session = new SessionService().Create(options);
            //System.Diagnostics.Trace.WriteLine(session.Url);

            Response.Redirect(session.Url, false);
        }

        bool isPaid(Timestamp lastPaymentDate)
        {
            System.Diagnostics.Trace.WriteLine("Payment Date: " + lastPaymentDate);
            if (lastPaymentDate.ToDateTime().Month < DateTime.Now.Month)
            {
                System.Diagnostics.Trace.WriteLine("Haven't pay");
                return false;
            }

            return true;
        }

        string desc()
        {
            string msg = "";

            if (cart_var.Count() != 0)
            {
                filtered = course_var.Where(course => cart_var.Contains(course.courseID)).ToList();

                for (int i = 0; i < filtered.Count(); i++)
                {
                    msg += (i + 1) + ". " + filtered[i].courseName + " (" + filtered[i].day + " " + filtered[i].time_start + "-" + filtered[i].time_end + ")\n";
                }
            }

            return msg;
        }

        async void get_a_doc()
        {
            title_label.Text = DateTime.UtcNow.ToString("MMMM");

            course_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }

            cart_var = ((class_file.Student)Session["Current_User"]).courseID;

            filtered = course_var.Where(course => cart_var.Contains(course.courseID)).ToList();

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
    }
}