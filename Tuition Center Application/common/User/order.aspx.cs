using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;
using Tuition_Center_Application.util;

namespace Tuition_Center_Application.common.User
{
    public partial class order : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();
        protected List<Course> filtered = new List<Course>();
        protected List<string> cart_var = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
            validation.check_user("Current_User");

            get_a_doc();
            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("~~~~ POST BACK AGAIN ~~~~");
            }
        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string course_id = ((HiddenField)item.FindControl("courseID_hd")).Value;

            cart_var.Remove(course_id);

            Request.Cookies["Course_Cookies"].Value = "";

            for (int i = 0; i < cart_var.Count(); i++)
            {
                Request.Cookies["Course_Cookies"].Value += cart_var[i] + " ";
            }

            Response.Cookies.Add(Request.Cookies["Course_Cookies"]);
            get_a_doc();
        }

        async void get_a_doc()
        {
            course_var.Clear();
            cart_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }

            //get_cart();
            try
            {
                cart_var = Session["Register_new_course"].ToString().Split(' ').ToList();
                //System.Diagnostics.Debug.WriteLine("Course_Cookies: " + Request.Cookies["Course_Cookies"].Value);
            }
            catch
            {
                Response.Redirect("~/common/User/course.aspx", false);
            }

            get_course();
        }

        void get_course()
        {
            filtered = course_var.Where(course => cart_var.Contains(course.courseID)).ToList();

            order_repeater.DataSource = filtered;
            order_repeater.DataBind();

            amount_text.Text = get_amount(filtered);
        }

        string get_amount(List<Course> filtered_list)
        {
            float amount = 0;
            for (int i = 0; i < filtered_list.Count(); i++)
            {
                amount += filtered_list[i].price;
            }
            return amount.ToString();
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            //HttpCookie amount_cookie = new HttpCookie("amount_cookie");
            //amount_cookie.Value = amount_text.Text;
            //Response.Cookies.Add(amount_cookie);
            //Response.Cookies["amount_cookie"].Expires = DateTime.Now.AddMinutes(30);

            //Response.Redirect("~/common/User/order_form.aspx", false);

        }
    }
}