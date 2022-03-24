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
    public partial class order : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();
        protected List<Course> filtered = new List<Course>();
        protected List<string> cart_var = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
            validation.check_user("Current_User");

            get_a_doc();
            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("~~~~ POST BACK AGAIN ~~~~");
            }
        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string course_id = ((HiddenField)item.FindControl("courseID_hd")).Value;

            cart_var.Remove(course_id);

            Request.Cookies["Course_Cookies"].Value = "";

            for (int i = 0; i < cart_var.Count(); i++)
            {
                Request.Cookies["Course_Cookies"].Value += cart_var[i] + " ";
            }

            Response.Cookies.Add(Request.Cookies["Course_Cookies"]);
            get_a_doc();
        }

        async void get_a_doc()
        {
            course_var.Clear();
            cart_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }

            //get_cart();
            try
            {
                cart_var = Session["Register_new_course"].ToString().Split(' ').ToList();
            }
            catch
            {
                Response.Redirect("~/common/User/course.aspx", false);
            }

            get_course();
        }

        void get_course()
        {
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
                SuccessUrl = "https://localhost:44378/" + "common/User/success2.aspx",
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
    }
}