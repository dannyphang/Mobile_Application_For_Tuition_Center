using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;
using Tuition_Center_Application.util;

namespace Tuition_Center_Application.common.Staff
{
    public partial class student : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected List<Course> course_var = new List<Course>();
        HttpCookie show_course_cookie = new HttpCookie("Display_Course_Cookies");

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            validation.check_user("Current_User");

            get_a_doc();

            if (IsPostBack)
            {
                //demo_modal.Attributes.Add("class", "modal_form expand");
                System.Diagnostics.Debug.WriteLine("Post Back AGAIN!!!!!");

            }
        }

        protected void more_btn_Click(object sender, EventArgs e)
        {

        }

        protected void course_btn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string course_id = ((HiddenField)item.FindControl("courseID_hf")).Value;

            //show_course_cookie.Value = course_id;
            //Response.Cookies.Add(show_course_cookie);

            Session["display_student_from_course"] = course_id;
            Response.Redirect("~/common/Staff/student.aspx", false);
        }

        async void get_a_doc()
        {
            QuerySnapshot course_snap = await util.firebase.get_doc_snap("Course");

            // clear all the elements from the list
            course_var.Clear();

            foreach (DocumentSnapshot docsnap in course_snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                for (int i = 0; i < ((Tutor)Session["Current_User"]).courseID.Count(); i++)
                {
                    if (((Tutor)Session["Current_User"]).courseID[i] == course.courseID)
                    {
                        course_var.Add(course);
                    }
                }
            }

            course_repeater.DataSource = course_var;
            course_repeater.DataBind();

            QuerySnapshot snap = await firebase.get_doc_snap("Student");

            // clear all the elements from the list
            student_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                if (Session["display_student_from_course"].ToString() == "")
                {
                    for (int i = 0; i < course_var.Count(); i++)
                    {
                        for (int j = 0; j < student.courseID.Count(); j++)
                        {
                            if (student.courseID[j] == course_var[i].courseID)
                            {
                                student_var.Add(student);
                            }
                        }
                    }
                }
                else
                {
                    for (int j = 0; j < student.courseID.Count(); j++)
                    {
                        if (student.courseID[j] == Session["display_student_from_course"].ToString())
                        {
                            student_var.Add(student);
                        }
                    }
                }
            }
            
            // remove the duplicated student
            List<class_file.Student> sorted = student_var.OrderBy(o => o.studentID).ToList();
            
            for (int i = 1; i < sorted.Count(); i++)
            {
                if (sorted[i].studentID == sorted[i - 1].studentID)
                {
                    student_var.Remove(sorted[i]);
                }
            }
            student_repeater.DataSource = student_var;
            student_repeater.DataBind();
        }

        protected void all_btn_Click(object sender, EventArgs e)
        {
            Session["display_student_from_course"] = "";
            Response.Redirect("~/common/Staff/student.aspx", false);
        }
    }
}