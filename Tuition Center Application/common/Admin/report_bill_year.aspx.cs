using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.Admin
{
    public partial class report_bill : System.Web.UI.Page
    {
        protected List<Year> year_list = new List<Year>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("~~~~~POST BACK~~~~~~");
            }
            get_a_doc();

        }

        void get_a_doc()
        {
            year_list.Clear();
            for (int i = 2019; i <= DateTime.Now.Year; i++)
            {
                Year get_year = new Year
                {
                    year = i.ToString(),
                };
                year_list.Add(get_year);
            }

            year_repeater.DataSource = year_list;
            year_repeater.DataBind();
        }

        protected void year_btn_Click(object sender, EventArgs e)
        {
            Session["Current_Report_Year"] = getID(sender);
            Response.Redirect("~/common/Admin/report_bill_month.aspx", false);
        }

        string getID(object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string value = ((Label)item.FindControl("year_label")).Text;

            return value;
        }
    }
}