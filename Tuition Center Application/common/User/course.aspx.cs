using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;
using Tuition_Center_Application.util;

namespace Tuition_Center_Application.common.User
{
    public partial class course : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<String> add_course_var = new List<String>();
        protected List<Course> course_var = new List<Course>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
            validation.check_user("Current_User");

            get_a_doc();
        }

        protected void view_btn_Click(object sender, EventArgs e)
        { 
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string course_id = ((HiddenField)item.FindControl("courseID_hf")).Value;

            System.Diagnostics.Debug.WriteLine("Course id: " + course_id);

            Session["Register_new_course"] += course_id + " ";
        }

        async void get_a_doc()
        {
            course_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
                for (int i = 0; i < ((class_file.Student)Session["Current_User"]).courseID.Count(); i++)
                {
                    if (((class_file.Student)Session["Current_User"]).courseID[i] == course.courseID)
                    {
                        course_var.Remove(course);
                    }
                }
            }

            course_repeater.DataSource = course_var;
            course_repeater.DataBind();
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Selected courseID string: " + Session["Register_new_course"].ToString());
        }
    }
}