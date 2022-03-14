using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.Staff
{
    public partial class classroom_main : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();


        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("Post Back AGAIN!!!!!");
                Console.WriteLine("Post Back AGAIN?!?!?!?!");
            }

            get_a_doc();
        }

        async void get_a_doc()
        {
            course_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                if (((Tutor)Session["Current_User"]).courseID.Contains(course.courseID))
                {
                    course_var.Add(course);
                }                
            }

            classroom_repeater.DataSource = course_var;
            classroom_repeater.DataBind();
        }

        protected void classroom_btn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string course_id = ((HiddenField)item.FindControl("courseID_hf")).Value;

            for (int i = 0; i < course_var.Count(); i++)
            {
                if (course_var[i].courseID == course_id)
                {
                    Session["current_classroom"] = course_var[i];
                }
            }

            Response.Redirect("~/common/Staff/classroom.aspx", false);
        }
    }
}