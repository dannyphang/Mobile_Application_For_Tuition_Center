using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application
{
    public partial class login : System.Web.UI.Page
    {
        FirestoreDb database;
        protected string email_input = "";
        protected string password_input = "";
        protected string role = "student";
        protected List<Tutor> tutor_var = new List<Tutor>();
        protected List<Student> student_var = new List<Student>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            email_input = Request.Form["email_input"];
            password_input = Request.Form["password_input"];
            role = Request.Form["role_hf"];
            string[] admin_info = { "admin", "admin123" };
            if (email_input == admin_info[0] && password_input == admin_info[1])
            {
                Response.Redirect("~/common/Admin/home.aspx", false);
            }
            else
            {
                if (role == "staff")
                {
                    get_staff(email_input, password_input);
                    Response.Write("<script>alert('staff here')</script>");
                }
                else if (role == "student")
                {
                    get_student(email_input, password_input);
                    Response.Write("<script>alert('student here')</script>");
                }
            }            
        }

        async void get_staff(string email, string password)
        {
            tutor_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Staff");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Tutor tutor = docsnap.ConvertTo<Tutor>();
                tutor_var.Add(tutor);
            }

            for (int i = 0; i < tutor_var.Count(); i++)
            {
                if (email == tutor_var[i].email)
                {
                    if (password == tutor_var[i].password)
                    {
                        Session["Current_User"] = tutor_var[i];
                        Response.Redirect("~/common/Staff/profile.aspx", false);
                    }
                    else
                    {
                        // display error message (Password is incorrect)
                        Response.Write("<script>alert('Your Password is incorrect!')</script>");
                    }
                }
                else
                {
                    // display error message (Email is incorrect)
                    Response.Write("<script>alert('Your Email is incorrect!')</script>");
                }
            }
        }

        async void get_student(string email, string password)
        {
            student_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Student student = docsnap.ConvertTo<Student>();
                student_var.Add(student);
            } 

            for (int i = 0; i < student_var.Count(); i++)
            {
                if (email == student_var[i].email)
                {
                    if (password == student_var[i].password)
                    {
                        Session["Current_User"] = student_var[i];
                        System.Diagnostics.Debug.WriteLine("Session[current user]: " + Session["Current_User"].ToString());

                        Response.Redirect("~/common/User/profile.aspx", false);
                    }
                    else
                    {
                        // display error message (Password is incorrect)
                        Response.Write("<script>alert('Your Password is incorrect!')</script>");
                    }
                }
                else
                {
                    // display error message (Email is incorrect)
                    Response.Write("<script>alert('Your Email is incorrect!')</script>");
                }
            }
        }
    }
}