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
        string new_id = "why r u here??";
        protected List<String> add_course_var = new List<String>();
        List<String> course_cookie_list = new List<string>();
        protected List<Course> course_var = new List<Course>();
        HttpCookie add_course_cookie = new HttpCookie("Course_Cookies", "I don't want to see you ah!");

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            get_a_doc();

            if (Request.Cookies["Course_Cookies"] == null)
            {
                //course_cookie_list = Request.Cookies["Course_Cookies"].Value.Split(' ').ToList();
                notification_label.Text = course_cookie_list.Count().ToString();
            }

            if (notification_label.Text == "0")
            {
                
            }
        }

        protected void view_btn_Click(object sender, EventArgs e)
        {
            Label btn = (Label)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string course_id = ((Label)item.FindControl("courseID_label")).Text;

            System.Diagnostics.Debug.WriteLine("Course id: " + course_id);

            //for (int i = 0; i < course_var.Count(); i++)
            //{
            //    if (course_id == course_var[i].courseID)
            //    {
            //        add_course_var.Add(course_var[i]);
            //    }
            //}

            add_course_var.Add(course_id);

            // Stringify your list
            string new_string = String.Join(",", add_course_var);

            // Create a cookie
            add_course_cookie.Value += " " + course_id;

            // The cookie will exist for 7 days
            add_course_cookie.Expires = DateTime.Now.AddHours(1);

            // Write the Cookie to your Response
            Response.Cookies.Add(add_course_cookie);

        }

        async void get_a_doc()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }
            new_id = (int.Parse(course_var[course_var.Count() - 1].courseID) + 1).ToString();

            course_repeater.DataSource = course_var;
            course_repeater.DataBind();
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            
            System.Diagnostics.Debug.WriteLine("Course List: " + course_cookie_list.ToString());
        }
    }
}