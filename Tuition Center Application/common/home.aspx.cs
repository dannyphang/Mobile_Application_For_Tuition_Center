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
    public partial class home : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected List<Course> course_var = new List<Course>();
        protected List<int> selected_var = new List<int>();
        protected List<string> added_selected_var = new List<string>();
        string new_id = "why r u here???";

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            if (Session["create_new_student"] != null)
            {
                System.Diagnostics.Debug.WriteLine("new student (page load): " + ((class_file.Student)Session["create_new_student"]).name);

                Response.Write("<script>alert('Your payment is successful and you may login to your new account')</script>");

                add_new_student();
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("new student: null");
            }
        }

        async void add_new_student()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");

            // clear all the elements from the list
            student_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                student_var.Add(student);
            }

            new_id = (int.Parse(student_var[student_var.Count() - 1].studentID) + 1).ToString();

            class_file.Student new_student = (class_file.Student)Session["create_new_student"];

            DocumentReference doc = database.Collection("Student").Document(new_id);

            doc.SetAsync(new_student);

            Session["create_new_student"] = null;

            Response.Write("<script>confirm('Your payment is successful and you may login to your new account')</script>");

            Response.Redirect("~/common/home.aspx");
        }
    }
}