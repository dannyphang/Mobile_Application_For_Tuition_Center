using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.Admin
{
    public partial class report : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<PaymentHistory> history_var = new List<PaymentHistory>();
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected List<Course> course_var = new List<Course>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
            Session["Current_Report_Year"] = null;
            Session["Current_Report_Month"] = null;
            Session["Current_Report_Student"] = null;
            Session["level_page"] = null;
            Session["Current_Course_Student"] = null;

            //get_a_history();

            get_a_student();
        }

        Timestamp get_date(int startMonth, int endMonth, int no)
        {
            DateTime start = new DateTime(2022, startMonth, 1);
            Timestamp time = Timestamp.FromDateTime(start.AddDays(new Random().Next((new DateTime(2022, endMonth, 1) - start).Days)).ToUniversalTime());

            return time;
        }

        async void generate_history()
        {
            System.Diagnostics.Debug.WriteLine("student count: " + student_var.Count());
            // loop within number of student
            for (int i = 0; i < student_var.Count(); i++)
            {
                int no = int.Parse(student_var[i].lastPayment.ToDateTime().Month.ToString());

                System.Diagnostics.Debug.WriteLine("studentID: " + student_var[i].studentID);
                System.Diagnostics.Debug.WriteLine("lastPayment: " + student_var[i].lastPayment);
                System.Diagnostics.Debug.WriteLine("no: " + no);

                //int date_count = 0;
                for (int j = 1; j <= no; j++)
                {
                    PaymentHistory new_his = new PaymentHistory
                    {
                        studentID = (i + 1).ToString(),
                        courseID = student_var[i].courseID,
                        payDate = get_date(j, j + 1, no),
                        payMonth = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(j),
                        amount = get_amount(course_var.Where(course => student_var[i].courseID.Contains(course.courseID)).ToList()),
                    };
                    await database.Collection("PaymentHistory").AddAsync(new_his);

                    System.Diagnostics.Debug.WriteLine("");
                    //System.Diagnostics.Debug.WriteLine("studentID: " + student_var[i].studentID);
                    System.Diagnostics.Debug.WriteLine("i: " + i + ", j: " + j);
                }

                System.Diagnostics.Debug.WriteLine("-------------------------");
            }
        }

        float get_amount(List<Course> filtered_list)
        {
            float amount = 0;
            for (int i = 0; i < filtered_list.Count(); i++)
            {
                amount += filtered_list[i].price;
            }
            return amount;
        }

        async void get_a_course()
        {
            course_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Course");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Course course = docsnap.ConvertTo<Course>();
                course_var.Add(course);
            }

            //generate_history();
        }

        async void get_a_student()
        {
            student_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                student_var.Add(student);
            }
            get_a_course();
        }
    }
}