using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tuition_Center_Application.class_file;
using Tuition_Center_Application.util;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.common.Admin
{
    public partial class report_bill_invoice : System.Web.UI.Page
    {
        FirestoreDb database;
        protected string current_email = "I'm no a good student :')";
        protected List<PaymentHistory> history_var = new List<PaymentHistory>();
        protected List<List<Course>> filtered = new List<List<Course>>();
        protected List<Course> course_var = new List<Course>();
        protected List<List<string>> cart_var = new List<List<string>>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = firebase.get_database();
            validation.check_report("Current_Report_Month");
            validation.check_report("Current_Report_Student");
            validation.check_report("Current_Report_Year");
            get_history();
        }

        async void get_history()
        {
            QuerySnapshot course_snap = await util.firebase.get_doc_snap("Course");

            // clear all the elements from the list
            course_var.Clear();

            foreach (DocumentSnapshot docsnap in course_snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }

            QuerySnapshot snap = await util.firebase.get_doc_snap("PaymentHistory");

            // clear all the elements from the list
            history_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                PaymentHistory history = docsnap.ConvertTo<PaymentHistory>();
                if (history.studentID == Session["Current_Report_Student"].ToString() && history.payMonth == Session["Current_Report_Month"].ToString() && history.payDate.ToDateTime().Year.ToString() == Session["Current_Report_Year"].ToString())
                {
                    paydate_label.Text = history.payDate.ToDateTime().ToString();
                    invoice_label.Text = "Invoice #" + history.paymentHistoryID;
                    total_label.Text = "RM" + history.amount;

                    course_desc_repeater.DataSource = get_course(history.courseID);
                    course_desc_repeater.DataBind();
                }
            }
        }

        List<Course> get_course(List<string> list)
        {
            List<Course> temp_var = new List<Course>();

            for (int k = 0; k < list.Count(); k++)
            {
                for (int i = 0; i < course_var.Count(); i++)
                {
                    if (course_var[i].courseID == list[k])
                    {
                        temp_var.Add(course_var[i]);
                    }
                }
            }

            return temp_var;
        }

        protected void course_desc_repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label course_label = (Label)e.Item.FindControl("course_label");
            HiddenField name_hf = (HiddenField)e.Item.FindControl("name_hf");
            HiddenField day_hf = (HiddenField)e.Item.FindControl("day_hf");
            HiddenField start_hf = (HiddenField)e.Item.FindControl("start_hf");
            HiddenField end_hf = (HiddenField)e.Item.FindControl("end_hf");

            course_label.Text = name_hf.Value + " (" + day_hf.Value + " " + start_hf.Value + "-" + end_hf.Value + ")";
        }
    }
}