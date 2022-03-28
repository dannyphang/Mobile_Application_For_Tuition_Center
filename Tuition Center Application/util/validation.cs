using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.util
{
    public class validation
    {
        public static void check_user(string current_user_session)
        {
            if (HttpContext.Current.Session[current_user_session] == null)
            {
                System.Diagnostics.Debug.WriteLine("Checked~~~~~~~~");
                HttpContext.Current.Response.Redirect("~/common/login.aspx", true);
            }
        }

        public static void check_report(string current_report_session)
        {
            if (HttpContext.Current.Session[current_report_session] == null)
            {
                HttpContext.Current.Response.Redirect("~/common/Admin/report.aspx", true);
            }
        }

        public static void check_home(string current_home_session)
        {
            if (HttpContext.Current.Session[current_home_session] == null)
            {
                HttpContext.Current.Response.Redirect("~/common/course_main.aspx", true);
            }
        }

        public static bool check_time(List<Course> list)
        {
            string msg = "";

            for (int i = 0; i < list.Count() - 1; i++)
            {
                for (int j = i + 1; j < list.Count(); j++)
                {

                    if (list[j].day == list[i].day
                        &&
                        (convert_time(list[j].time_start.Substring(0, 2), list[j].time_start.Substring(3))
                        >=
                        convert_time(list[i].time_start.Substring(0, 2), list[i].time_start.Substring(3))
                        &&
                        convert_time(list[j].time_start.Substring(0, 2), list[j].time_start.Substring(3))
                        <
                        convert_time(list[i].time_end.Substring(0, 2), list[i].time_end.Substring(3))))
                    {
                        msg = list[j].courseName + "(" + list[j].time_start + " - " + list[j].time_end + ")\\n";
                        //HttpContext.Current.Response.Write("<script>alert('" + msg + "')</script>");
                        HttpContext.Current.Session["Error_Msg"] = msg;
                        return false;
                    }
                }
            }

            return true;
        }

        public static bool check_time(List<Course> list, Course new_course)
        {
            string msg = "";

            for (int i = 0; i < list.Count() - 1; i++)
            {
                if (new_course.tutorID == list[i].tutorID
                    &&
                    new_course.day == list[i].day
                    &&
                    (convert_time(new_course.time_start.Substring(0, 2), new_course.time_start.Substring(3))
                    >=
                    convert_time(list[i].time_start.Substring(0, 2), list[i].time_start.Substring(3))
                    &&
                    convert_time(new_course.time_start.Substring(0, 2), new_course.time_start.Substring(3))
                    <
                    convert_time(list[i].time_end.Substring(0, 2), list[i].time_end.Substring(3))))
                {
                    msg = new_course.courseName + "(" + new_course.time_start + " - " + new_course.time_end + ")\\n";
                    //HttpContext.Current.Response.Write("<script>alert('" + msg + " is collapsed with other course')</script>");
                    HttpContext.Current.Session["Error_Msg"] = msg;

                    return false;
                }
            }

            return true;
        }

        public static int convert_time(string start, string end)
        {
            return int.Parse(start) * 100 + int.Parse(end);
        }
    }
}