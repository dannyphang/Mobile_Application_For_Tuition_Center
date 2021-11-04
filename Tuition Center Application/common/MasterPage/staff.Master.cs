using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tuition_Center_Application.common.MasterPage
{
    public partial class staff : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            profile_img2.Src = "~/img/profile.png";

        }
    }
}