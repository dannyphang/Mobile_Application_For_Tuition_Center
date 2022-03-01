using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.Staff
{
    public partial class profile : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Tutor> tutor_var = new List<Tutor>();
        protected Tutor current_tutor;

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            current_tutor = (Tutor)Session["Current_User"];

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("POST AGAIN!!!!!!!!!!!");
                return;
            }

            display_info();

            website_text.Style.Add("display", "none");
            github_text.Style.Add("display", "none");
            twitter_text.Style.Add("display", "none");
            instagram_text.Style.Add("display", "none");
            facebook_text.Style.Add("display", "none");
        }

        protected void edit_btn_Click(object sender, EventArgs e)
        {
            edit_btn.Style.Add("display", "none");
            cancel_btn.Style.Add("visibility", "visible");
            save_btn.Style.Add("visibility", "visible");

            email_label.Style.Add("display", "none");
            email_text.Style.Add("visibility", "visible");

            phone_label.Style.Add("display", "none");
            phone_text.Style.Add("visibility", "visible");

            address_label.Style.Add("display", "none");
            address_text.Style.Add("visibility", "visible");

            salary_label.Style.Add("display", "none");
            salary_text.Style.Add("visibility", "visible");

            website_label.Style.Add("display", "none");
            website_text.Style.Add("display", "block");

            github_label.Style.Add("display", "none");
            github_text.Style.Add("display", "block");

            twitter_label.Style.Add("display", "none");
            twitter_text.Style.Add("display", "block");

            instagram_label.Style.Add("display", "none");
            instagram_text.Style.Add("display", "block");

            facebook_label.Style.Add("display", "none");
            facebook_text.Style.Add("display", "block");

            email_text.Text = current_tutor.email;
            phone_text.Text = current_tutor.phoneNo;
            address_text.Text = current_tutor.address;
            salary_text.Text = current_tutor.salary.ToString();
        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            close_textbox();
            Response.Redirect("~/common/Staff/profile.aspx", false);
        }

        protected void save_btn_Click(object sender, EventArgs e)
        {
            //DocumentReference doc = database.Collection("Staff").Document(current_tutor.tutorID);

            Tutor new_tutor = new Tutor
            {
                tutorID = current_tutor.tutorID,
                name = current_tutor.name,
                IC = current_tutor.IC,
                avatar = image_hf.Value,
                courseID = current_tutor.courseID,
                password = current_tutor.password,

                email = email_text.Text.Trim(),
                phoneNo = phone_text.Text.Trim(),
                address = address_text.Text.Trim(),
                salary = float.Parse(salary_text.Text),

                website = website_text.Text.Trim(),
                github = github_text.Text.Trim(),
                twitter = twitter_text.Text.Trim(),
                facebook = facebook_text.Text.Trim(),
                instagram = instagram_text.Text.Trim()
            };

            //// update to firebase
            //doc.SetAsync(new_tutor);

            DocumentReference staff_doc = database.Collection("Staff").Document(current_tutor.tutorID);

            Dictionary<string, object> new_tutor2 = new Dictionary<string, object>
            {
                { "avatar", image_hf.Value }, 

                { "email", email_text.Text.Trim() },
                { "address", address_text.Text.Trim() },
                { "phoneNo", phone_text.Text.Trim() },

                { "website", website_text.Text.Trim() }, 
                { "github", github_text.Text.Trim() }, 
                { "twitter", twitter_text.Text.Trim() }, 
                { "facebook", facebook_text.Text.Trim() }, 
                { "instagram", instagram_text.Text.Trim() }, 
            };
            staff_doc.UpdateAsync(new_tutor2);

            // update to session
            Session["Current_User"] = new_tutor;
            current_tutor = new_tutor;

            close_textbox();

            Response.Redirect("~/common/Staff/profile.aspx", false);
        }

        void display_info()
        {
            //imagePreview_asp.ImageUrl = current_tutor.avatar;
            //profile_image.ImageUrl = current_tutor.avatar;
            image_hf.Value = current_tutor.avatar;

            name_label.Text = current_tutor.name;
            date_label.Text = current_tutor.onBoardingDate;
            IC_label.Text = current_tutor.IC;

            email_label.Text = current_tutor.email;
            phone_label.Text = current_tutor.phoneNo;
            address_label.Text = current_tutor.address;
            salary_label.Text = current_tutor.salary.ToString();

            website_label.Text = current_tutor.website;
            twitter_label.Text = current_tutor.twitter;
            github_label.Text = current_tutor.github;
            facebook_label.Text = current_tutor.facebook;
            instagram_label.Text = current_tutor.instagram;
        }

        void close_textbox()
        {
            edit_btn.Style.Remove("display");
            cancel_btn.Style.Add("visibility", "hidden");
            save_btn.Style.Add("visibility", "hidden");

            email_label.Style.Remove("display");
            email_text.Style.Add("visibility", "hidden");

            phone_label.Style.Remove("display");
            phone_text.Style.Add("visibility", "hidden");

            address_label.Style.Remove("display");
            address_text.Style.Add("visibility", "hidden");

            salary_label.Style.Remove("display");
            salary_text.Style.Add("visibility", "hidden");

            website_label.Style.Remove("display");
            website_text.Style.Add("display", "none");

            github_label.Style.Remove("display");
            github_text.Style.Add("display", "none");

            twitter_label.Style.Remove("display");
            twitter_text.Style.Add("display", "none");

            instagram_label.Style.Remove("display");
            instagram_text.Style.Add("display", "none");

            facebook_label.Style.Remove("display");
            facebook_text.Style.Add("display", "none");
        }
    }
}