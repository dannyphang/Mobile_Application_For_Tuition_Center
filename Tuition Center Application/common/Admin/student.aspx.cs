﻿using System;
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
        protected List<Course> course_var = new List<Course>();
        protected List<int> selected_var = new List<int>();
        protected List<string> added_selected_var = new List<string>();
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
            QuerySnapshot course_snap = await util.firebase.get_doc_snap("Course");

            // clear all the elements from the list
            course_var.Clear();

            // level_ddl_e.Items.Clear();

            foreach (DocumentSnapshot docsnap in course_snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);

                if (course.level == "Form 5")
                {
                    form5_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
                else if (course.level == "Form 4")
                {
                    form4_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
                else if (course.level == "Form 3")
                {
                    form3_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
                else if (course.level == "Form 2")
                {
                    form2_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
                else if (course.level == "Form 1")
                {
                    form1_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
                else if (course.level == "Standard 1")
                {
                    standard1_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
                else if (course.level == "Standard 2")
                {
                    standard2_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
                else if (course.level == "Standard 3")
                {
                    standard3_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
                else if (course.level == "Standard 4")
                {
                    standard4_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
                else if (course.level == "Standard 5")
                {
                    standard5_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
                else if (course.level == "Standard 6")
                {
                    standard6_check.Items.Add("  " + (course.courseName + " (" + course.time_start + " - " + course.time_end + ") - " + course.day));
                }
            }

            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");

            // clear all the elements from the list
            student_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                student_var.Add(student);
            }

            int biggestNum = int.Parse(student_var[0].studentID);

            for (int i = 0; i < student_var.Count(); i++)
            {
                if (int.Parse(student_var[i].studentID) > biggestNum)
                {
                    biggestNum = int.Parse(student_var[i].studentID);
                }
            }
            new_id = (biggestNum + 1).ToString();

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

                    DOB_text.Text = student_var[i].DOB;
                    name_text.Text = student_var[i].name;
                    IC_text.Text = student_var[i].IC;
                    email_text.Text = student_var[i].email;
                    address_text.Text = student_var[i].address;
                    phone_text.Text = student_var[i].phoneNo;
                    school_text.Text = student_var[i].school;
                    level_ddl.SelectedValue = student_var[i].educationLV;

                    name_text.Enabled = false;
                    IC_text.Enabled = false;
                    email_text.Enabled = false;
                    phone_text.Enabled = false;
                    DOB_text.Enabled = false;
                    address_text.Enabled = false;
                    level_ddl.Enabled = false;
                    school_text.Enabled = false;

                    reset_btn.Visible = false;
                    update_btn.Visible = false;
                }
            }
        }

        protected void edit_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < student_var.Count(); i++)
            {
                if (student_var[i].studentID == getID(sender))
                {
                    studentID_hd2.Value = getID(sender);

                    table_image_hf.Value = student_var[i].avatar;
                    imagePreview_asp.ImageUrl = table_image_hf.Value;

                    DOB_text.Text = student_var[i].DOB;
                    name_text.Text = student_var[i].name;
                    IC_text.Text = student_var[i].IC;
                    email_text.Text = student_var[i].email;
                    address_text.Text = student_var[i].address;
                    phone_text.Text = student_var[i].phoneNo;
                    school_text.Text = student_var[i].school;
                    level_ddl.SelectedValue = student_var[i].educationLV;

                    name_text.Enabled = true;
                    IC_text.Enabled = true;
                    email_text.Enabled = true;
                    phone_text.Enabled = true;
                    DOB_text.Enabled = true;
                    address_text.Enabled = true;
                    level_ddl.Enabled = true;
                    school_text.Enabled = true;

                    reset_btn.Visible = true;
                    update_btn.Visible = true;
                }
            }
        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {
            DocumentReference doc = database.Collection("Student").Document(getID(sender));

            doc.DeleteAsync();

            // TODO: delete post and comment of this student

            Response.Redirect("~/common/Admin/student.aspx", false);
        }

        protected void clear_btn_Click(object sender, EventArgs e)
        {
            clear_data();
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            // selected course 
            for (int j = 0; j < selected_var.Count(); j++)
            {
                for (int i = 0; i < course_var.Count(); i++)
                {
                    if (i == selected_var[j])
                    {
                        added_selected_var.Add(course_var[i].courseID);
                    }
                }
                System.Diagnostics.Debug.WriteLine("added_selected_var item: " + added_selected_var[j]);
            }

            // add new student
            DocumentReference doc = database.Collection("Student").Document(new_id);

            string formatted_date = datehf.Value.Substring(3, 2) + "/" + datehf.Value.Substring(0, 2) + "/" + datehf.Value.Substring(6, 4);

            class_file.Student new_student = new class_file.Student
            {
                name = name_text_e.Text.Trim(),
                email = email_text_e.Text.Trim(),
                password = password_text_e.Text.Trim(),
                IC = IC_text_e.Text.Trim(),
                avatar = image_hf2.Value,
                address = address_text_e.Text.Trim(),
                phoneNo = phone_text_e.Text.Trim(),
                DOB = formatted_date,
                educationLV = level_ddl_e.SelectedValue,
                school = school_text_e.Text.Trim(),

                OTP = new string(Enumerable.Repeat("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", 6).Select(s => s[new Random().Next(s.Length)]).ToArray()),
                OTP_Send = Timestamp.FromDateTime(DateTime.UtcNow),

                github = "",
                website = "",
                twitter = "",
                facebook = "",
                instagram = "",

                courseID = added_selected_var,
                lastPayment = Timestamp.FromDateTime(DateTime.UtcNow),
                registeredDate = Timestamp.FromDateTime(DateTime.UtcNow),
            };
            doc.SetAsync(new_student);

            clear_data();
            Response.Redirect("~/common/Admin/student.aspx", false);
        }

        protected void reset_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < student_var.Count(); i++)
            {
                if (student_var[i].studentID == getID(sender))
                {
                    table_image_hf.Value = student_var[i].avatar;
                    imagePreview_asp.ImageUrl = table_image_hf.Value;

                    DOB_text.Text = student_var[i].DOB;
                    name_text.Text = student_var[i].name;
                    IC_text.Text = student_var[i].IC;
                    email_text.Text = student_var[i].email;
                    address_text.Text = student_var[i].address;
                    phone_text.Text = student_var[i].phoneNo;
                    school_text.Text = student_var[i].school;

                    name_text.Enabled = true;
                    IC_text.Enabled = true;
                    email_text.Enabled = true;
                    phone_text.Enabled = true;
                    DOB_text.Enabled = true;
                    address_text.Enabled = true;
                    level_ddl.Enabled = true;
                    school_text.Enabled = true;

                    reset_btn.Visible = true;
                    update_btn.Visible = true;
                }
            }
        }

        protected void update_btn_Click(object sender, EventArgs e)
        {
            DocumentReference doc = database.Collection("Student").Document(studentID_hd2.Value);

            Dictionary<string, object> new_tutor = new Dictionary<string, object>
            {
                { "name", name_text.Text.Trim() },
                { "email", email_text.Text.Trim() },
                { "IC", IC_text.Text.Trim() },
                { "address", address_text.Text.Trim() },
                { "phoneNo", phone_text.Text.Trim() },
                { "DOB", DOB_text.Text.Trim() },
                { "educationLV", level_ddl.SelectedValue },
                { "school", school_text.Text.Trim() },
            };
            doc.UpdateAsync(new_tutor);
            clear_data();

            Response.Redirect("~/common/Admin/staff.aspx", false);
        }

        void clear_data()
        {
            name_text.Text = "";
            IC_text.Text = "";
            email_text.Text = "";
            address_text.Text = "";
            phone_text.Text = "";
            DOB_text.Text = "";

            foreach (ListItem item in form1_check.Items)
            {
                item.Selected = false;
            }
            foreach (ListItem item in form2_check.Items)
            {
                item.Selected = false;
            }
            foreach (ListItem item in form3_check.Items)
            {
                item.Selected = false;
            }
            foreach (ListItem item in form4_check.Items)
            {
                item.Selected = false;
            }
            foreach (ListItem item in form5_check.Items)
            {
                item.Selected = false;
            }
        }

        protected void form1_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in form1_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(form1_check.Items.IndexOf(item));
                }
            }
        }

        protected void form2_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in form2_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(form2_check.Items.IndexOf(item));
                }
            }
        }

        protected void form3_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in form3_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(form3_check.Items.IndexOf(item));
                }
            }
        }

        protected void form4_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in form4_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(form4_check.Items.IndexOf(item));
                }
            }
        }

        protected void form5_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in form5_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(form5_check.Items.IndexOf(item));
                }
            }
        }

        protected void standard1_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in standard1_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(standard1_check.Items.IndexOf(item));
                }
            }
        }

        protected void standard2_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in standard2_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(standard2_check.Items.IndexOf(item));
                }
            }
        }

        protected void standard3_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in standard3_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(standard3_check.Items.IndexOf(item));
                }
            }
        }

        protected void standard4_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in standard4_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(standard4_check.Items.IndexOf(item));
                }
            }
        }

        protected void standard5_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in standard5_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(standard5_check.Items.IndexOf(item));
                }
            }
        }

        protected void standard6_check_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in standard6_check.Items)
            {
                if (item.Selected)
                {
                    selected_var.Add(standard6_check.Items.IndexOf(item));
                }
            }
        }
    }
}