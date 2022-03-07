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
        protected string current_email = "I'm no a good student :')";
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected class_file.Student current_student;

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            current_student = (class_file.Student)Session["Current_User"];

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("POST AGAIN!!!!!!!!!!!");
                //get_a_student();
            }

            display_info();

            website_text.Style.Add("display", "none");
            github_text.Style.Add("display", "none");
            twitter_text.Style.Add("display", "none");
            instagram_text.Style.Add("display", "none");
            facebook_text.Style.Add("display", "none");
        }

       async void get_a_student()
       {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                if (student.studentID == current_student.studentID)
                {
                    Session["Current_User"] = student;
                    current_student = student;
                }
            }
        }

        void display_info()
        {
            name_label.Text = current_student.name;
            IC_label.Text = current_student.IC;
            age_label.Text = "";
            email_label.Text = current_student.email;
            phone_label.Text = current_student.phoneNo;
            address_label.Text = current_student.address;
            level_label.Text = current_student.educationLV;
            school_label.Text = current_student.school;

            //email_text.Text = email_label.Text;
            //phone_text.Text = phone_label.Text;
            //address_text.Text = address_label.Text;
            //level_text.Text = level_label.Text;
            //school_text.Text = school_label.Text;

            website_label.Text = current_student.website;
            twitter_label.Text = current_student.twitter;
            github_label.Text = current_student.github;
            facebook_label.Text = current_student.facebook;
            instagram_label.Text = current_student.instagram;
        }
        
        string cal_age(DateTime DOB)
        {
            string year = ((int)((DateTime.Now - DOB).TotalDays / 365)).ToString();
            return year;
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

            school_label.Style.Add("display", "none");
            school_text.Style.Add("visibility", "visible");

            level_label.Style.Add("display", "none");
            level_text.Style.Add("visibility", "visible");

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

            email_text.Text = current_student.email;
            phone_text.Text = current_student.phoneNo;
            address_text.Text = current_student.address;
            level_text.Text = current_student.educationLV;
            school_text.Text = current_student.school;
        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            close_textbox();
        }

        protected void save_btn_Click(object sender, EventArgs e)
        {
            DocumentReference doc = database.Collection("Student").Document(current_student.studentID);

            class_file.Student new_student = new class_file.Student
            {
                studentID = current_student.studentID, 
                name = current_student.name, 
                IC = current_student.IC, 
                DOB = current_student.DOB, 
                OTP = current_student.OTP, 
                OTP_Send = current_student.OTP_Send, 
                avatar = current_student.avatar,
                courseID = current_student.courseID,
                password = current_student.password, 

                email = email_text.Text,
                phoneNo = phone_text.Text,
                address = address_text.Text,
                school = school_text.Text,
                educationLV = level_text.Text,

                website = website_text.Text, 
                github = github_text.Text, 
                twitter = twitter_text.Text, 
                facebook = facebook_text.Text, 
                instagram = instagram_text.Text
            };

            // update to firebase
            doc.SetAsync(new_student);

            // update to session
            Session["Current_User"] = new_student;
            current_student = new_student;

            //System.Diagnostics.Debug.WriteLine("address: " + current_student.address);

            close_textbox();
            display_info();
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

            school_label.Style.Remove("display");
            school_text.Style.Add("visibility", "hidden");

            level_label.Style.Remove("display");
            level_text.Style.Add("visibility", "hidden");

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