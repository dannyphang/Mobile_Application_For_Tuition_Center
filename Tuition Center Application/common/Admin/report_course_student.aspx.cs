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
    public partial class report_course_student : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<class_file.Student> student_var = new List<class_file.Student>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
            validation.check_report("Current_Course_Student");

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("Post Back AGAIN!!!!!");
            }

            get_a_doc();
        }

        async void get_a_doc()
        {
            title_label1.Text = ((Course)Session["Current_Course_Student"]).level;
            title_label.Text = ((Course)Session["Current_Course_Student"]).day + " (" +((Course)Session["Current_Course_Student"]).time_start + " - " + ((Course)Session["Current_Course_Student"]).time_end + ")";

            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");

            // clear all the elements from the list
            student_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                for (int i = 0; i < student.courseID.Count(); i++)
                {
                    if (((Course)Session["Current_Course_Student"]).courseID == student.courseID[i])
                    {
                        student_var.Add(student);
                    }
                }
            }

            List<class_file.Student> sorted = student_var.OrderBy(o => o.name).ToList();

            student_repeater.DataSource = sorted;
            student_repeater.DataBind();
        }

        protected void more_btn_Click(object sender, EventArgs e)
        {

        }
    }
}