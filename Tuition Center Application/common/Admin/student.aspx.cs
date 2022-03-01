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
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        string new_id = "why r u here???";

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            if (IsPostBack)
            {
                demo_modal.Attributes.Add("class", "modal_form expand");

                System.Diagnostics.Debug.WriteLine("Post Back AGAIN!!!!!");
            }

            get_a_doc();
        }

        async void get_a_doc()
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

            student_repeater.DataSource = student_var;
            student_repeater.DataBind();
        }

        string getID(object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            return ((HiddenField)item.FindControl("studentID_hd")).Value;
        }

        protected void more_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < student_var.Count(); i++)
            {
                if (student_var[i].studentID == getID(sender))
                {
                    table_image_hf.Value = student_var[i].avatar;
                    imagePreview_asp.ImageUrl = table_image_hf.Value;

                    name_text.Text = student_var[i].name;
                    IC_text.Text = student_var[i].IC;
                    email_text.Text = student_var[i].email;
                    address_text.Text = student_var[i].address;
                    phone_text.Text = student_var[i].phoneNo;
                }
            }
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

        protected void clear_btn_Click(object sender, EventArgs e)
        {

        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {

        }

        protected void reset_btn_Click(object sender, EventArgs e)
        {

        }

        protected void update_btn_Click(object sender, EventArgs e)
        {

        }
    }
}