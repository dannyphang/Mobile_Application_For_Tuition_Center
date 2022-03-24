using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Tuition_Center_Application.common
{
    public partial class OTP : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<class_file.Student> student_var = new List<class_file.Student>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
            if (!IsPostBack)
            {
                Response.Write("<script>alert('The OTP is sent to your email, please check your indox!')</script>");
                Session["OTP"] = (new Random().Next(100000, 999999)).ToString();

            }
            send_otp();
        }

        protected void confirm_btn_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("email_input: " + Request.Form["email_input"]);
            System.Diagnostics.Debug.WriteLine("otp: " + Session["OTP"].ToString());
            if (Request.Form["email_input"] == Session["OTP"].ToString())
            {

                Response.Redirect("~/common/reset_password.aspx", false);
            }
            else
            {
                Response.Write("<script>alert('Your Password is not match!')</script>");
                Response.Redirect("~/common/OTP.aspx", false);
            }
        }

        async void send_otp()
        {
            send_email(Session["Reset_Email"].ToString(), Session["OTP"].ToString());
            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");

            // clear all the elements from the list
            student_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                if (student.email == Session["Reset_Email"].ToString())
                {
                    DocumentReference doc = database.Collection("Student").Document(student.studentID);

                    Dictionary<string, object> update_otp = new Dictionary<string, object>
                    {
                        { "OTP", Session["OTP"].ToString() },
                        { "OTP_Send", Timestamp.FromDateTime(DateTime.UtcNow) },

                    };
                    await doc.UpdateAsync(update_otp);
                    break;
                }
            }

        }

        void send_email(string email, string otp)
        {
            string to = email; //To address    
            string from = "phangwh-wm19@student.tarc.edu.my"; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = "Here is the OTP: " + otp;
            message.Subject = "OTP From Tuition Center";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("danny64phang@gmail.com", "991002086195");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;

            client.Send(message);

        }
    }
}