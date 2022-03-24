using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tuition_Center_Application.util
{
    public class validation
    {
        public static void check_user(string current_user_session)
        {
            if (HttpContext.Current.Session[current_user_session] == null)
            {
                System.Diagnostics.Debug.WriteLine("Checked~~~~~~~~");
                HttpContext.Current.Response.Redirect("~/common/login.aspx", true);
            }
        }

        public static void check_report(string current_report_session)
        {
            if (HttpContext.Current.Session[current_report_session] == null)
            {
                HttpContext.Current.Response.Redirect("~/common/Admin/report.aspx", true);
            }
        }
    }
}