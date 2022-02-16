using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.User
{
    public partial class timetable : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<string> time_list = new List<string>();
        protected List<Course> day_mon_list = new List<Course>();
        protected List<Course> day_tue_list = new List<Course>();
        protected List<Course> day_wed_list = new List<Course>();
        protected List<Course> day_thu_list = new List<Course>();
        protected List<Course> day_fri_list = new List<Course>();
        protected List<Course> day_sat_list = new List<Course>();
        protected List<Course> day_sun_list = new List<Course>();
        protected List<Course> course_var = new List<Course>();
        protected List<Course> filtered = new List<Course>();
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected string current_email = "";
        protected class_file.Student current_user;

        protected void Page_Load(object sender, EventArgs e)
        {
            current_email = Session["Current_User"].ToString();
            //current_email = "dannyphang64@gmail.com";
            System.Diagnostics.Debug.WriteLine("Current Email: " + current_email);

            database = util.firebase.get_database();

            timetable_list();
            get_a_doc();
        }

        protected void timetable_list()
        {
            double time_start = 8.0;
            double time_end = 20.0;

            for (double i = time_start; i < time_end; i += 0.3)
            {
                int temp = (int)(i * 100);

                if (temp - (Math.Floor(i) * 100) == 60)
                {
                    i = Math.Ceiling(i);
                }

                time_list.Add(i.ToString("00.00").Replace(".", ":"));
            }
        }

        async void get_a_doc()
        {
            QuerySnapshot student_snap = await util.firebase.get_doc_snap("Student");

            foreach (DocumentSnapshot docsnap in student_snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                student_var.Add(student);
            }

            List<string> student_time_list = new List<string>();

            // get the student's info
            for (int i = 0; i < student_var.Count(); i++)
            {
                if (student_var[i].email == current_email)
                {
                    current_user = student_var[i];
                }
            }

            System.Diagnostics.Debug.WriteLine("Current Course ID Count: " + current_user.courseID.Count());
            for (int i = 0; i < current_user.courseID.Count(); i++)
            {
                student_time_list.Add(current_user.courseID[i]);
            }

            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }

            filtered = course_var.Where(course => student_time_list.Contains(course.courseID)).ToList();
            System.Diagnostics.Debug.WriteLine("filtered count: " + filtered.Count());

            for (int i = 0; i < filtered.Count; i++)
            {
                if (filtered[i].day.ToString() == "Monday")
                {
                    day_mon_list.Add(filtered[i]);
                }
                else if (filtered[i].day.ToString() == "Tuesday")
                {
                    day_tue_list.Add(filtered[i]);
                }
                else if (filtered[i].day.ToString() == "Wednesday")
                {
                    day_wed_list.Add(filtered[i]);
                }
                else if (filtered[i].day.ToString() == "Thursday")
                {
                    day_thu_list.Add(filtered[i]);
                }
                else if (filtered[i].day.ToString() == "Friday")
                {
                    day_fri_list.Add(filtered[i]);
                }
                else if (filtered[i].day.ToString() == "Saturday")
                {
                    day_sat_list.Add(filtered[i]);
                }
                else if (filtered[i].day.ToString() == "Sunday")
                {
                    day_sun_list.Add(filtered[i]);
                }
            }

            monday_repeater.DataSource = day_mon_list;
            monday_repeater.DataBind();
            tuesday_repeater.DataSource = day_tue_list;
            tuesday_repeater.DataBind();
            wednesday_repeater.DataSource = day_wed_list;
            wednesday_repeater.DataBind();
            thursday_repeater.DataSource = day_thu_list;
            thursday_repeater.DataBind();
            friday_repeater.DataSource = day_fri_list;
            friday_repeater.DataBind();
            saturday_repeater.DataSource = day_sat_list;
            saturday_repeater.DataBind();
            sunday_repeater.DataSource = day_sun_list;
            sunday_repeater.DataBind();
        }
    }
}