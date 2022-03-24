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
    public partial class report_course : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
            validation.check_report("level_page");

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("Post Back AGAIN!!!!!");
            }

            get_a_doc();
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < course_var.Count(); i++)
            {
                if (course_var[i].courseID == getID(sender))
                {
                    Session["Current_Course_Student"] = course_var[i];
                }
            }
            Response.Redirect("~/common/Admin/report_course_student.aspx", false);
        }

        string getID(object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string value = ((HiddenField)item.FindControl("courseID_hd")).Value;

            return value;
        }

        async void get_a_doc()
        {
            title_label.Text = Session["level_page"].ToString();

            course_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                if (course.level == Session["level_page"].ToString())
                {
                    course_var.Add(course);
                }
            }

            List<Course> sorted = course_var.OrderBy(o => o.level).ToList();

            course_repeater.DataSource = sorted;
            course_repeater.DataBind();
        }
    }
}