using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;
using Tuition_Center_Application.util;

namespace Tuition_Center_Application.common.Admin
{
    public partial class report_bill_history : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected List<Course> course_var = new List<Course>();
        protected List<PaymentHistory> history_var = new List<PaymentHistory>();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["Current_Report_Month"]

            database = util.firebase.get_database();
            validation.check_report("Current_Report_Month");

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("Post Back AGAIN!!!!!");
            }

            get_a_doc();
        }

        async void get_a_doc()
        {
            title_label.Text = Session["Current_Report_Month"].ToString();

            QuerySnapshot course_snap = await util.firebase.get_doc_snap("PaymentHistory");

            // clear all the elements from the list
            history_var.Clear();

            // level_ddl_e.Items.Clear();

            foreach (DocumentSnapshot docsnap in course_snap.Documents)
            {
                PaymentHistory history = docsnap.ConvertTo<PaymentHistory>();
                if (history.payMonth == Session["Current_Report_Month"].ToString())
                {
                    history_var.Add(history);
                }
            }

            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");

            // clear all the elements from the list
            student_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                for (int i = 0; i < history_var.Count(); i++)
                {
                    if (!student_var.Contains(student))
                    {
                        student_var.Add(student);
                    }
                }
            }

            student_repeater.DataSource = student_var.OrderBy(o => o.name).ToList();
            student_repeater.DataBind();
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            Session["Current_Report_Student"] = getID(sender);
            Response.Redirect("~/common/Admin/report_bill_invoice.aspx", false);
        }

        string getID(object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string value = ((HiddenField)item.FindControl("studentID_hd")).Value;

            return value;
        }
    }
}