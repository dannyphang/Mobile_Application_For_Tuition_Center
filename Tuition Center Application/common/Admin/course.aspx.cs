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
    public partial class course : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Course> course_var = new List<Course>();
        protected static string[] level_list = Course.level_list;
        protected static string[] day_list = Course.day_list;
        protected static string[] duration_list = Course.duration_list;

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            if (IsPostBack)
            {
                demo_modal.Attributes.Add("class", "modal_form expand");
            }

            get_a_doc();


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

        public void level_item()
        {
            level_ddl.Items.Clear();
            for (int i = 0; i < level_list.Length; i++)
            {
                level_ddl.Items.Add(level_list[i]);
            }
        }

        public void day_item()
        {
            day_ddl.Items.Clear();
            for (int i = 0; i < day_list.Length; i++)
            {
                day_ddl.Items.Add(day_list[i]);
            }
        }

        public void duration_item()
        {
            duration_ddl.Items.Clear();
            for (int i = 0; i < duration_list.Length; i++)
            {
                duration_ddl.Items.Add(duration_list[i]);
            }
        }

        protected void clear_btn_Click(object sender, EventArgs e)
        {
            clear_data();
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            DocumentReference doc = database.Collection("Course").Document("7");


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
            };

            doc.SetAsync(new_course);
            clear_data();
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

            return ((HiddenField)item.FindControl("courseID_hd")).Value;
        }

        protected void more_btn_Click(object sender, EventArgs e)
        {
            
            for (int i = 0; i < course_var.Count(); i++)
            {
                if (course_var[i].courseID == getID(sender))
                {
                    System.Diagnostics.Debug.WriteLine(course_var[i].courseID + ": " + course_var[i].language);
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

        protected void edit_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < course_var.Count(); i++)
            {
                if (course_var[i].courseID == getID(sender))
                {
                    System.Diagnostics.Debug.WriteLine(course_var[i].courseID + ": " + course_var[i].language);
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

        protected void delete_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < course_var.Count(); i++)
            {
                if (course_var[i].courseID == getID(sender))
                {

                }
            }
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
            string str = "why r u here?";

            str = time.Substring(0, 2);

            return str;
        }

        protected string min_convert(string time)
        {
            string str = "why r u here?";

            str = time.Substring(3, 2);

            return str;
        }

        protected void reset_btn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < course_var.Count(); i++)
            {
                if (course_var[i].courseID == getID(sender))
                {
                    //System.Diagnostics.Debug.WriteLine(course_var[i].courseID + ": " + course_var[i].language);
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
            DocumentReference doc = database.Collection("Course").Document(getID(sender));

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
            clear_data();
        }
    }
}