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
    public partial class staff : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Tutor> tutor_var = new List<Tutor>();
        protected List<Course> course_var = new List<Course>();
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

        protected void more_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < tutor_var.Count(); i++)
            {
                if (tutor_var[i].tutorID == getID(sender))
                {
                    table_image_hf.Value = tutor_var[i].avatar;
                    imagePreview_asp.ImageUrl = table_image_hf.Value;

                    name_text_e.Text = tutor_var[i].name;
                    IC_text_e.Text = tutor_var[i].IC;
                    email_text_e.Text = tutor_var[i].email;
                    phone_text_e.Text = tutor_var[i].phoneNo;
                    salary_text_e.Text = tutor_var[i].salary.ToString();
                    address_text_e.Text = tutor_var[i].address;

                    name_text_e.Enabled = false;
                    IC_text_e.Enabled = false;
                    email_text_e.Enabled = false;
                    phone_text_e.Enabled = false;
                    salary_text_e.Enabled = false;
                    address_text_e.Enabled = false;

                    reset_btn.Visible = false;
                    update_btn.Visible = false;
                }
            }
        }

        protected void edit_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < tutor_var.Count(); i++)
            {
                if (tutor_var[i].tutorID == getID(sender))
                {
                    tutorID_hd2.Value = getID(sender);

                    table_image_hf.Value = tutor_var[i].avatar;
                    imagePreview_asp.ImageUrl = table_image_hf.Value;
                    datehf2.Value = tutor_var[i].onBoardingDate;

                    name_text_e.Text = tutor_var[i].name;
                    IC_text_e.Text = tutor_var[i].IC;
                    email_text_e.Text = tutor_var[i].email;
                    phone_text_e.Text = tutor_var[i].phoneNo;
                    salary_text_e.Text = tutor_var[i].salary.ToString();
                    address_text_e.Text = tutor_var[i].address;

                    name_text_e.Enabled = true;
                    IC_text_e.Enabled = true;
                    email_text_e.Enabled = true;
                    phone_text_e.Enabled = true;
                    salary_text_e.Enabled = true;
                    address_text_e.Enabled = true;

                    reset_btn.Visible = true;
                    update_btn.Visible = true;
                }
            }
        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {
            DocumentReference doc = database.Collection("Staff").Document(getID(sender));

            doc.DeleteAsync();

            Response.Redirect("~/common/Admin/satff.aspx", false);
        }

        async void get_a_doc()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Staff");

            // clear all the elements from the list
            tutor_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Tutor tutor = docsnap.ConvertTo<Tutor>();
                tutor_var.Add(tutor);
            }

            QuerySnapshot course_snap = await util.firebase.get_doc_snap("Course");

            // clear all the elements from the list
            course_var.Clear();

            foreach (DocumentSnapshot docsnap in course_snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }

            new_id = (int.Parse(tutor_var[tutor_var.Count() - 1].tutorID) + 1).ToString();

            tutor_repeater.DataSource = tutor_var;
            tutor_repeater.DataBind();
        }

        string getID(object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            return ((HiddenField)item.FindControl("tutorID_hd")).Value;
        }

        protected void clear_btn_Click(object sender, EventArgs e)
        {
            clear_data();
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            DocumentReference doc = database.Collection("Staff").Document(new_id);

            string formatted_date = datehf.Value.Substring(3, 2) + "/" + datehf.Value.Substring(0, 2) + "/" + datehf.Value.Substring(6, 4);

            Tutor new_tutor = new Tutor
            {
                name = name_text.Text.Trim(),
                email = email_text.Text.Trim(),
                password = password_text.Text.Trim(),
                IC = IC_text.Text.Trim(),
                avatar = image_hf2.Value,
                address = address_text.Text.Trim(),
                phoneNo = phone_text.Text.Trim(),
                onBoardingDate = formatted_date,
                salary = float.Parse(salary_text.Text),
                courseID = new List<string>(),
            };
            doc.SetAsync(new_tutor);
            clear_data();

            Response.Redirect("~/common/Admin/satff.aspx", false);
        }

        void clear_data()
        {
            name_text.Text = "";
            email_text.Text = "";
            password_text.Text = "";
            IC_text.Text = "";
            address_text.Text = "";
            phone_text.Text = "";
            salary_text.Text = "";
        }

        protected void reset_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < tutor_var.Count(); i++)
            {
                if (tutor_var[i].tutorID == getID(sender))
                {
                    table_image_hf.Value = tutor_var[i].avatar;
                    imagePreview_asp.ImageUrl = table_image_hf.Value;

                    name_text_e.Text = tutor_var[i].name;
                    IC_text_e.Text = tutor_var[i].IC;
                    email_text_e.Text = tutor_var[i].email;
                    phone_text_e.Text = tutor_var[i].phoneNo;
                    salary_text_e.Text = tutor_var[i].salary.ToString();
                    address_text_e.Text = tutor_var[i].address;
                }
            }
        }

        protected void update_btn_Click(object sender, EventArgs e)
        {
            DocumentReference doc = database.Collection("Staff").Document(tutorID_hd2.Value);

            string formatted_date = datehf2.Value.Substring(3, 2) + "/" + datehf2.Value.Substring(0, 2) + "/" + datehf2.Value.Substring(6, 4);

            Dictionary<string, object> new_tutor = new Dictionary<string, object>
            {
                { "name", name_text_e.Text.Trim() },
                { "email", email_text_e.Text.Trim() },
                { "IC", IC_text_e.Text.Trim() },
                { "address", address_text_e.Text.Trim() },
                { "phoneNo", phone_text_e.Text.Trim() },
                { "obBoardingDate", formatted_date },
                { "salary", float.Parse(salary_text_e.Text) }
            };
            doc.UpdateAsync(new_tutor);
            clear_data();

            Response.Redirect("~/common/Admin/satff.aspx", false);
        }
    }
}