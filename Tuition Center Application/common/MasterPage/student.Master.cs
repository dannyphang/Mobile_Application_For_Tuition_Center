using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tuition_Center_Application.util;

namespace Tuition_Center_Application.common.MasterPage
{
    public partial class student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //validation.check_user("Current_User");

            class_file.Student current_staff = (class_file.Student)Session["Current_User"];
            string[] staff_name = current_staff.name.Split(' ');
            profile_img2.Src = current_staff.avatar;
            profile_name.Text = staff_name[0];
        }

        protected void logout_btn_Click(object sender, EventArgs e)
        {
            Session["Current_User"] = null;
            Response.Redirect("~/common/login.aspx", false);
        }
    }
}