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

            get_a_doc();
        }

        protected void more_btn_Click(object sender, EventArgs e)
        {

        }

        protected void edit_btn_Click(object sender, EventArgs e)
        {

        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {

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

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }

            new_id = (int.Parse(tutor_var[tutor_var.Count() - 1].tutorID) + 1).ToString();

            tutor_repeater.DataSource = tutor_var;
            tutor_repeater.DataBind();

            //time_listbox.DataSource = course_var;
            //System.Diagnostics.Debug.WriteLine("Course_var size: " + course_var.Count());
            //time_listbox.DataBind();
            for (int i = 0; i < course_var.Count(); i++)
            {
                time_listbox.Items.Add(course_var[i].courseName);
            }
            
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
            string date_month = datehf.Value.Substring(0, 2);
            string date_day = datehf.Value.Substring(3, 2);
            string formatted_date = datehf.Value.Substring(3, 2) + "/" + datehf.Value.Substring(0, 2) + "/" + datehf.Value.Substring(6, 4);

            System.Diagnostics.Debug.WriteLine("Date HF: " + datehf.Value);
            System.Diagnostics.Debug.WriteLine("Formatted Date: " + formatted_date);

            string message = "";
            foreach (ListItem item in time_listbox.Items)
            {
                if (item.Selected)
                {
                    message += item.Text + " ";
                }
            }
            System.Diagnostics.Debug.WriteLine("Message: " + message);

            Tutor new_tutor = new Tutor
            {
                name = name_text.Text.Trim(),
                email = email_text.Text.Trim(),
                password = password_text.Text.Trim(),
                IC = IC_text.Text.Trim(),
                avatar = "",
                address = address_text.Text.Trim(),
                phoneNo = phone_text.Text.Trim(),
                onBoardingDate = datehf.Value,
                salary = float.Parse(salary_text.Text),
                courseID = message.Split(' ').ToList(),
            };
            doc.SetAsync(new_tutor);
            clear_data();
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
    }
}