using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.Admin
{
    public partial class course : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();
        protected List<Tutor> tutor_var = new List<Tutor>();
        List<string> tutorID_list = new List<string>();
        string new_id = "why r u here???";
        int selected_tutor;

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            if (IsPostBack)
            {
                demo_modal.Attributes.Add("class", "modal_form expand");
                System.Diagnostics.Debug.WriteLine("Post Back AGAIN!!!!!");
                selected_tutor = tutor_ddl.SelectedIndex;
            }

            get_a_doc();
        }

        async void get_a_doc()
        {
            course_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }
            new_id = (int.Parse(course_var[course_var.Count() - 1].courseID) + 1).ToString();

            course_repeater.DataSource = course_var;
            course_repeater.DataBind();

            get_tutor_list();
        }

        async void get_tutor_list()
        {
            tutor_ddl.Items.Clear();
            tutor_ddl2.Items.Clear();
            tutorID_list.Clear();
            tutor_var.Clear();

            QuerySnapshot tutor_snap = await util.firebase.get_doc_snap("Staff");

            foreach (DocumentSnapshot docsnap in tutor_snap.Documents)
            {
                Tutor tutor = docsnap.ConvertTo<Tutor>();

                tutor_var.Add(tutor);
                tutor_ddl.Items.Add(tutor.name);
                tutor_ddl2.Items.Add(tutor.name);
                tutorID_list.Add(tutor.tutorID);
            }
        }

        protected void clear_btn_Click(object sender, EventArgs e)
        {
            clear_data();
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Trace.WriteLine(selected_tutor);

            DocumentReference doc = database.Collection("Course").Document(new_id);

            Course new_course = new Course
            {
                courseName = name_text.Text,
                level = level_ddl.SelectedValue,
                price = int.Parse(price_text.Text),
                language = language_ddl.SelectedValue,
                day = day_ddl.SelectedValue,
                time_start = hour_text.Text + ":" + min_text.Text,
                time_end = time_end_count(duration_str_to_float(duration_ddl.SelectedIndex), hour_text.Text, min_text.Text),
                duration = duration_str_to_float(duration_ddl.SelectedIndex),
                tutorID = tutorID_list[selected_tutor],
            };

            doc.SetAsync(new_course);

            add_tutor_course(new_id);

            clear_data();

            Response.Redirect("~/common/Admin/course.aspx", false);
        }

        async void add_tutor_course(string newID)
        {

            DocumentReference staff_doc = database.Collection("Staff").Document(tutorID_list[selected_tutor]);

            await staff_doc.UpdateAsync("courseID", FieldValue.ArrayUnion(newID));
        }

        async void delete_tutor_course(string id)
        {
            string tutor_contain_courseID = "";
            for (int i = 0; i < tutor_var.Count(); i++)
            {
                for (int j = 0; j < tutor_var[i].courseID.Count(); j++)
                {
                    if (tutor_var[i].courseID[j] == id)
                    {
                        tutor_contain_courseID = tutor_var[i].tutorID;
                    }
                }
            }

            DocumentReference staff_doc = database.Collection("Staff").Document(tutor_contain_courseID);

            await staff_doc.UpdateAsync("courseID", FieldValue.ArrayRemove(id));
        }

        float duration_str_to_float(int index)
        {
            switch (index)
            {
                case 0:
                    return (float)1.0;
                case 1:
                    return (float)1.5;
                case 2:
                    return (float)2.0;
                case 3:
                    return (float)2.5;
            }

            return (float)0.0;
        }

        string time_end_count(float duration, string hour, string min)
        {
            string time = hour + "." + min; // 9.45
            float time_start = float.Parse(time); // 9.45
            float time_end = -1;

            int temp = (int)Math.Ceiling((time_start - Math.Floor(time_start)) * 100); // 10.45 - 10.00 = 0.45 * 100 = 45
            
            if (duration == 1.0)
            {
                time_end = (float)(time_start + 1);
            }
            else if (duration == 1.5)
            {
                time_end = (float)(time_start + 1.3);

                if (temp >= 30) 
                {
                    time_end = (float)(time_end - 0.6) + 1; // 9.75 - 0.60 + 1 = 10.15
                }
            }
            else if (duration == 2.0)
            {
                time_end = (float)(time_start + 2);
            }
            else if (duration == 2.5)
            {
                time_end = (float)(time_start + 2.3);

                if (temp >= 30)
                {
                    time_end = (float)(time_end - 0.6) + 1; // 9.75 - 0.60 + 2 = 11.15
                }
            }

            return time_end.ToString("00.00").Replace(".", ":");
        }

        void clear_data()
        {
            name_text.Text = "";
            level_ddl.SelectedIndex = 0;
            tutor_ddl.SelectedIndex = 0;
            language_ddl.SelectedIndex = 0;
            price_text.Text = "";
            day_ddl.SelectedIndex = 0;
            duration_ddl.SelectedIndex = 0;
            hour_text.Text = "";
            min_text.Text = "";
        }

        string getID(object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string value = ((HiddenField)item.FindControl("courseID_hd")).Value;

            return value;
        }

        protected void more_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < course_var.Count(); i++)
            {
                if (course_var[i].courseID == getID(sender))
                {
                    courseID_hd2.Value = getID(sender);

                    name_text2.Text = course_var[i].courseName;
                    level_ddl2.SelectedValue = course_var[i].level;
                    language_ddl2.SelectedValue = course_var[i].language;
                    price_text2.Text = course_var[i].price.ToString();
                    day_ddl2.SelectedValue = course_var[i].day;
                    duration_ddl2.SelectedIndex = duration_int(course_var[i].duration);
                    hour_text2.Text = hour_convert(course_var[i].time_start);
                    min_text2.Text = min_convert(course_var[i].time_start);

                    for (int j = 0; j < tutor_var.Count(); j++)
                    {
                        if (course_var[i].tutorID == tutor_var[j].tutorID)
                        {
                            tutor_ddl2.SelectedValue = tutor_var[j].name;
                            break;
                        }
                    }

                    name_text2.Enabled = false;
                    level_ddl2.Enabled = false;
                    language_ddl2.Enabled = false;
                    price_text2.Enabled = false;
                    day_ddl2.Enabled = false;
                    duration_ddl2.Enabled = false;
                    hour_text2.Enabled = false;
                    min_text2.Enabled = false;
                    reset_btn.Visible = false;
                    update_btn.Visible = false;
                }
            }
        }

        protected void edit_btn_Click(object sender, EventArgs e)
        { 
            for (int i = 0; i < course_var.Count(); i++)
            {
                if (course_var[i].courseID == getID(sender))
                {
                    courseID_hd2.Value = getID(sender);

                    name_text2.Text = course_var[i].courseName;
                    level_ddl2.SelectedValue = course_var[i].level;
                    language_ddl2.SelectedValue = course_var[i].language;
                    price_text2.Text = course_var[i].price.ToString();
                    day_ddl2.SelectedValue = course_var[i].day;
                    duration_ddl2.SelectedIndex = duration_int(course_var[i].duration);
                    hour_text2.Text = hour_convert(course_var[i].time_start);
                    min_text2.Text = min_convert(course_var[i].time_start);
                    for (int j = 0; j < tutor_var.Count(); j++)
                    {
                        if (tutor_var[j].tutorID == course_var[i].tutorID)
                        {
                            tutor_ddl2.SelectedValue = tutor_var[j].name;
                            break;
                        }
                    }

                    name_text2.Enabled = true;
                    level_ddl2.Enabled = true;
                    language_ddl2.Enabled = true;
                    price_text2.Enabled = true;
                    day_ddl2.Enabled = true;
                    duration_ddl2.Enabled = true;
                    hour_text2.Enabled = true;
                    min_text2.Enabled = true;
                    reset_btn.Visible = true;
                    update_btn.Visible = true;
                }
            }
        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {
            delete_tutor_course(getID(sender));

            DocumentReference doc = database.Collection("Course").Document(getID(sender));

            doc.DeleteAsync();

            Response.Redirect("~/common/Admin/course.aspx", false);
        }

        protected int duration_int(float duration)
        {
            int index = -1;

            if (duration == 1.0)
            {
                return 0;
            }
            else if (duration == 1.5)
            {
                return 1;
            }
            else if (duration == 2.0)
            {
                return 2;
            }
            else if (duration == 2.5)
            {
                return 3;
            }

            return index;
        }

        protected string hour_convert(string time)
        {
            return time.Substring(0, 2);
        }

        protected string min_convert(string time)
        {
            return time.Substring(3, 2);
        }

        protected void reset_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < course_var.Count(); i++)
            {
                if (course_var[i].courseID == courseID_hd2.Value)
                {
                    name_text2.Text = course_var[i].courseName;
                    level_ddl2.SelectedValue = course_var[i].level;
                    language_ddl2.SelectedValue = course_var[i].language;
                    price_text2.Text = course_var[i].price.ToString();
                    day_ddl2.SelectedValue = course_var[i].day;
                    duration_ddl2.SelectedIndex = duration_int(course_var[i].duration);
                    hour_text2.Text = hour_convert(course_var[i].time_start);
                    min_text2.Text = min_convert(course_var[i].time_start);
                }
            }
        }

        protected void update_btn_Click(object sender, EventArgs e)
        {
            DocumentReference doc = database.Collection("Course").Document(courseID_hd2.Value);

            Course new_course = new Course
            {
                courseName = name_text2.Text,
                level = level_ddl2.SelectedValue,
                price = int.Parse(price_text2.Text),
                language = language_ddl2.SelectedValue,
                day = day_ddl2.SelectedValue,
                time_start = hour_text2.Text + ":" + min_text2.Text,
                time_end = time_end_count(duration_str_to_float(duration_ddl2.SelectedIndex), hour_text2.Text, min_text2.Text),
                duration = duration_str_to_float(duration_ddl2.SelectedIndex),
            };

            doc.SetAsync(new_course);

            Response.Redirect("~/common/Admin/course.aspx", false);
        }
    }
}