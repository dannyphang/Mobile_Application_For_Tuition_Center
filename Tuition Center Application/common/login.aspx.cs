using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tuition_Center_Application
{
    public partial class login : System.Web.UI.Page
    {
        protected string email_input = "";
        protected string role = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            email_input = Request.Form["email_input"];
            //if(email_input == "hi")
            //{
            //    Response.Write("<script>alert('hihi')</script>");
            //}
            //else
            //{
            //    Response.Write("<script>alert('no hi')</script>");
            //}
            if (role == "staff")
            {

            }
            else if (role == "student") 
            {

            }
        }

        protected void login_staff_btn_Click(object sender, EventArgs e)
        {
            role = "staff";
        }

        protected void login_student_btn_Click(object sender, EventArgs e)
        {
            role = "student";
        }
    }
}