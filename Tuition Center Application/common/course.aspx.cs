﻿using System;
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
        protected List<String> add_course_var = new List<String>();
        protected List<Course> course_var = new List<Course>();
        HttpCookie add_course_cookie = new HttpCookie("Course_Cookies");

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            get_a_doc();

            //notification_label.CssClass = "badge badge_hide";
            //notification_label.Text = get_cart_num;

            //get_cart();

            //if (IsPostBack)
            //{
            //    System.Diagnostics.Debug.WriteLine("~~~~ POST BACK AGAIN ~~~~");
            //}

            //if (notification_label.Text == "0")
            //{
            //    System.Diagnostics.Debug.WriteLine("notification up: " + notification_label.Text);
            //    notification_label.CssClass = "badge badge_hide";
            //}
            //else
            //{
            //    notification_label.CssClass = "badge";
            //    System.Diagnostics.Debug.WriteLine("notification down: " + notification_label.Text);
            //}
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
                course_var.Add(course);
            }

            course_repeater.DataSource = course_var;
            course_repeater.DataBind();
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine("Course List: " + course_cookie_list.ToString());
            Response.Redirect("~/common/order.aspx");
        }
    }
}