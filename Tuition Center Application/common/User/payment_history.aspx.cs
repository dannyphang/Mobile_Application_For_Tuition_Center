using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Stripe;
using Stripe.Checkout;
using Tuition_Center_Application.class_file;
using Tuition_Center_Application.util;

namespace Tuition_Center_Application.common.User
{
    public partial class payment_history : System.Web.UI.Page
    {
        FirestoreDb database;
        protected string current_email = "I'm no a good student :')";
        protected List<PaymentHistory> history_var = new List<PaymentHistory>();
        protected List<List<Course>> filtered = new List<List<Course>>();
        protected List<Course> course_var = new List<Course>();
        protected List<List<string>> cart_var = new List<List<string>>();
        protected class_file.Student current_student;
        protected Repeater course_desc_repeater;

        protected void Page_Load(object sender, EventArgs e)
        {
            database = firebase.get_database();
            validation.check_user("Current_User");
            current_student = (class_file.Student)Session["Current_User"];

            get_history();
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {

        }

        async void get_history()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("PaymentHistory");

            // clear all the elements from the list
            history_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                PaymentHistory history = docsnap.ConvertTo<PaymentHistory>();
                if (history.studentID == current_student.studentID)
                {
                    history_var.Add(history);
                    cart_var.Add(history.courseID);
                }
            }

            QuerySnapshot course_snap = await util.firebase.get_doc_snap("Course");

            // clear all the elements from the list
            course_var.Clear();

            foreach (DocumentSnapshot docsnap in course_snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }

            history_repeater.DataSource = history_var;
            history_repeater.DataBind();
        }

        protected void history_repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                course_desc_repeater = (Repeater)e.Item.FindControl("course_desc_repeater");

                HiddenField payID_hf = (HiddenField)e.Item.FindControl("payID_hf");
                Label paydate_label = (Label)e.Item.FindControl("paydate_label");
                List<string> temp_list = new List<string>();

                for (int i = 0; i < history_var.Count(); i++)
                {
                    if (payID_hf.Value == history_var[i].paymentHistoryID)
                    {
                        temp_list = history_var[i].courseID;
                        paydate_label.Text = history_var[i].payDate.ToDateTime().ToString();
                    }
                }

                course_desc_repeater.DataSource = get_course(temp_list);
                course_desc_repeater.DataBind();
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