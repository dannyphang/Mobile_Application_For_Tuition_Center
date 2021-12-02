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
            level_item();
            day_item();
            duration_item();
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

            string language_value = Request.Form["language_value"];
            //name_text.Text = language_value;
            Response.Write("<script>alert('" + level_ddl.SelectedValue + "')</script>");
            //Course new_course = new Course
            //{
            //    courseName = name_text.Text,
            //    level = level_ddl.SelectedValue, // *
            //    price = int.Parse(price_text.Text),
            //    language = language_value, // *
            //    day = day_ddl.SelectedValue, // *
            //    time_start = hour_text.Text + ":" + min_text.Text,
            //    time_end = time_end_count(duration_str_to_float(duration_ddl.SelectedIndex), hour_text.Text, min_text.Text),
            //    duration = duration_str_to_float(duration_ddl.SelectedIndex), // *
            //};

            //doc.SetAsync(new_course);
            //clear_data();
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

            int temp = (int)(time_start * 100) - (int)(Math.Floor(time_start) * 100);

            if (duration == 0)
            {
                time_end += 1;
            }
            else if (duration == 1)
            {
                time_end = (float)(time_start + 0.3);

                if (temp > 59) 
                {
                    time_end = (float)(time_end - 0.6) + 1; // 9.75 - 0.60 + 1 = 10.15
                }
            }
            else if (duration == 2)
            {
                time_end += 2;
            }
            else if (duration == 3)
            {
                time_end = (float)(time_start + 0.3);

                if (temp > 59)
                {
                    time_end = (float)(time_end - 0.6) + 2; // 9.75 - 0.60 + 2 = 11.15
                }
            }

            return time_end.ToString("00.00").Replace(".", ":");
        }

        void clear_data()
        {
            name_text.Text = "";
            level_ddl.SelectedIndex = 0;
            tutor_ddl.SelectedIndex = 0;
            price_text.Text = "";
            day_ddl.SelectedIndex = 0;
            duration_ddl.SelectedIndex = 0;
            hour_text.Text = "";
            min_text.Text = "";
        }
    }
}