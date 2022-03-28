using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;
using Tuition_Center_Application.util;

namespace Tuition_Center_Application.common
{
    public partial class course : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<string> add_course_var = new List<String>();
        protected List<Course> course_var = new List<Course>();
        HttpCookie add_course_cookie = new HttpCookie("Course_Cookies");

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
            validation.check_home("level_page2");

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("Post Back AGAIN!!!!!");
            }
            else
            {
                added_course_list_hf.Value = ""; 
                add_course_cookie.Value = added_course_list_hf.Value;
                Response.Cookies.Add(add_course_cookie);
            }

            get_a_doc();
        }

        protected void view_btn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string course_id = ((HiddenField)item.FindControl("courseID_hf")).Value;

            System.Diagnostics.Debug.WriteLine("Course id: " + course_id);

            added_course_list_hf.Value += course_id + " ";

            add_course_cookie.Value = added_course_list_hf.Value;
            Response.Cookies.Add(add_course_cookie);
            Response.Cookies["Course_Cookies"].Expires = DateTime.Now.AddMinutes(30);
        }

        async void get_a_doc()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                if (course.level == Session["level_page2"].ToString())
                {
                    course_var.Add(course);
                }
            }

            course_repeater.DataSource = course_var;
            course_repeater.DataBind();
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Session['level_page2']: " + Session["level_page2"].ToString());
            Session["level_page2"] = null;
            Response.Redirect("~/common/order.aspx");
        }
    }
}