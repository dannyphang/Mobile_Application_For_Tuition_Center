using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common
{
    public partial class course : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();
        protected void Page_Load(object sender, EventArgs e)
        {
            //AsyncMode = true;
            database = util.firebase.get_database();
            //Dictionary<string, object> item = util.firebase.get_a_doc_snapAsync("Course", "1");
            //course_name.InnerText = 
            get_a_doc();
            

        }

        protected void view_btn_Click(object sender, EventArgs e)
        {
            
        }

        async void get_a_doc()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }
        }
    }
}