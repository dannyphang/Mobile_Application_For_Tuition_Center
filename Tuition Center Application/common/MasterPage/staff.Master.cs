using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.MasterPage
{
    public partial class staff : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Tutor current_staff = (Tutor)Session["Current_User"];
            string[] staff_name = current_staff.name.Split(' ');
            profile_img2.Src = current_staff.avatar;
            profile_name.Text = staff_name[0];
        }
    }
}