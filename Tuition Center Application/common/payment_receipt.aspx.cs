using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common
{
    public partial class payment_receipt : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
            get_a_course();

            List<string> list = (List<string>)Session["current_courseID_list"];

            course_desc_repeater.DataSource = get_course(list);
            course_desc_repeater.DataBind();
        }

        async void get_a_course()
        {
            QuerySnapshot course_snap = await util.firebase.get_doc_snap("Course");

            // clear all the elements from the list
            course_var.Clear();

            foreach (DocumentSnapshot docsnap in course_snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
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