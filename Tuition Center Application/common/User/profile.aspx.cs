using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.Student
{
    public partial class profile : System.Web.UI.Page
    {
        FirestoreDb database;
        string current_user = "I'm no a good student :')";
        protected List<class_file.Student> student_var = new List<class_file.Student>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            //get_a_student();

        }

        async void get_a_student()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                student_var.Add(student);
            }

            try
            {
                current_user = Session["Current_User"].ToString();

            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine("Current User: " + current_user);
            }
        }
    }
}