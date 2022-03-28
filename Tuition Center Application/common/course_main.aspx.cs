using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tuition_Center_Application.common
{
    public partial class course_main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void next_btn_s1_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Standard 1";
            Response.Redirect("~/common/course.aspx", false);
        }

        protected void next_btn_s2_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Standard 2";
            Response.Redirect("~/common/course.aspx", false);
        }

        protected void next_btn_s3_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Standard 3";
            Response.Redirect("~/common/course.aspx", false);
        }

        protected void next_btn_s4_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Standard 4";
            Response.Redirect("~/common/course.aspx", false);
        }

        protected void next_btn_s5_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Standard 5";
            Response.Redirect("~/common/course.aspx", false);
        }

        protected void next_btn_s6_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Standard 6";
            Response.Redirect("~/common/course.aspx", false);
        }

        protected void next_btn_f1_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Form 1";
            Response.Redirect("~/common/course.aspx", false);
        }

        protected void next_btn_f2_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Form 2";
            Response.Redirect("~/common/course.aspx", false);
        }

        protected void next_btn_f3_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Form 3";
            Response.Redirect("~/common/course.aspx", false);
        }

        protected void next_btn_f4_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Form 4";
            Response.Redirect("~/common/course.aspx", false);
        }

        protected void next_btn_f5_Click(object sender, EventArgs e)
        {
            Session["level_page2"] = "Form 5";
            Response.Redirect("~/common/course.aspx", false);
        }
    }
}