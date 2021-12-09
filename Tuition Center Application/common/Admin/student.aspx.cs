using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.Admin
{
    public partial class student : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Student> student_var = new List<Student>();
        string new_id = "why r u here???";

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            educationLV_ddl.Items.Insert(0, new ListItem("Eduaction Level", "0"));

            get_a_doc();
            get_a_doc();
        }

        async void get_a_doc()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");
            
            // clear all the elements from the list
            student_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Student student = docsnap.ConvertTo<Student>();
                student_var.Add(student);
            }
            new_id = (int.Parse(student_var[student_var.Count() - 1].studentID) + 1).ToString();

            student_repeater.DataSource = student_var;
            student_repeater.DataBind();
        }

        string getID(object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            return ((HiddenField)item.FindControl("courseID_hd")).Value;
        }

        void change_level_css(object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

        }

        protected void more_btn_Click(object sender, EventArgs e)
        {

        }

        protected void edit_btn_Click(object sender, EventArgs e)
        {

        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}