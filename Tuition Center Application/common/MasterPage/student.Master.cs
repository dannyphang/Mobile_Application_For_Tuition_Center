using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tuition_Center_Application.common.MasterPage
{
    public partial class student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logout_btn_Click(object sender, EventArgs e)
        {
            Session["Current_User"] = null;
            Response.Redirect("~/common/login.aspx", false);
        }
    }
}