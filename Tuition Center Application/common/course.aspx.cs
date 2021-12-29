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
        string get_cart_num = "no cart item~";
        protected List<String> add_course_var = new List<String>();
        List<String> course_cookie_list = new List<String>();
        protected List<Course> course_var = new List<Course>();
        protected List<string> cart_var = new List<string>();
        HttpCookie add_course_cookie = new HttpCookie("Course_Cookies", "I don't want to see you ah!");

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            get_a_doc();
            get_cart();

            notification_label.CssClass = "badge badge_hide";
            notification_label.Text = get_cart_num;

            if (notification_label.Text == "0")
            {
                System.Diagnostics.Debug.WriteLine("notification up: " + notification_label.Text);
                notification_label.CssClass = "badge badge_hide";
            }
            else
            {
                notification_label.CssClass = "badge";
                System.Diagnostics.Debug.WriteLine("notification down: " + notification_label.Text);
            }
        }

        protected void view_btn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string course_id = ((HiddenField)item.FindControl("courseID_hf")).Value;

            System.Diagnostics.Debug.WriteLine("Course id: " + course_id);

            DocumentReference cart_doc = database.Collection("Cart").Document("1");

            cart_doc.UpdateAsync("courseID", FieldValue.ArrayUnion(course_id));

            get_cart();
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

        async void get_cart()
        {
            cart_var.Clear();

            DocumentReference doc = database.Collection("Cart").Document("1");

            DocumentSnapshot snap = await doc.GetSnapshotAsync();

            Dictionary<string, object> key = snap.ToDictionary();

            foreach (var item in key)
            {
                if (item.Key == "courseID")
                {
                    foreach (var array_item in (List<object>)item.Value)
                    {
                        System.Diagnostics.Debug.WriteLine("array_item: " + array_item);
                        cart_var.Add(array_item.ToString());
                    }
                }
            }

            get_cart_num =  cart_var.Count().ToString();
            notification_label.Text = get_cart_num;

            System.Diagnostics.Debug.WriteLine("Cart Num: " + get_cart_num);
            System.Diagnostics.Debug.WriteLine("notification (get cart): " + notification_label.Text);
            System.Diagnostics.Debug.WriteLine("------------------------------------------------------");
        }

        protected void next_btn_Click(object sender, EventArgs e)
        {
            
            System.Diagnostics.Debug.WriteLine("Course List: " + course_cookie_list.ToString());
        }
    }
}