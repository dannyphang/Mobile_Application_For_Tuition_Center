using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;
using Tuition_Center_Application.util;

namespace Tuition_Center_Application.common.Admin
{
    public partial class report_bill_month : System.Web.UI.Page
    {
        List<Month> month_list = new List<Month>();

        protected void Page_Load(object sender, EventArgs e)
        {
            validation.check_report("Current_Report_Year");

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("~~~~~POST BACK~~~~~~");
            }
            get_a_doc();
        }

        void get_a_doc()
        {
            month_list.Clear();

            if (Session["Current_Report_Year"].ToString() == DateTime.Now.Year.ToString())
            {
                for (int i = 1; i <= DateTime.Now.Month; i++)
                {
                    Month get_year = new Month
                    {
                        month = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(i),
                    };
                    month_list.Add(get_year);
                }
            }
            else
            {
                for (int i = 1; i <= 12; i++)
                {
                    Month get_year = new Month
                    {
                        month = i.ToString(),
                    };
                    month_list.Add(get_year);
                }
            }

            month_repeater.DataSource = month_list;
            month_repeater.DataBind();
        }

        protected void month_btn_Click(object sender, EventArgs e)
        {
            Session["Current_Report_Month"] = getID(sender);
            Response.Redirect("~/common/Admin/report_bill_history.aspx", false);
        }

        string getID(object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string value = ((Label)item.FindControl("month_label")).Text;

            return value;
        }
    }
}