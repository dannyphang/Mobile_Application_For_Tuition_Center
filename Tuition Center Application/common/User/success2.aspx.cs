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
    public partial class WebForm1 : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<PaymentHistory> history_var = new List<PaymentHistory>();
        protected List<Course> course_var = new List<Course>();
        protected List<int> selected_var = new List<int>();
        protected List<string> added_selected_var = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            update_payment();
            update_course();
        }

        async void update_payment()
        {
            //vadd new history to PaymentHistory
            await database.Collection("PaymentHistory").AddAsync((PaymentHistory)Session["new_monthly_payment"]);

            // update last payment to Student
            DocumentReference doc = database.Collection("Student").Document(((class_file.Student)Session["Current_User"]).studentID);

            Dictionary<string, object> new_payment = new Dictionary<string, object>
            {
                { "lastPayment", Timestamp.FromDateTime(DateTime.UtcNow) },
            };
            await doc.UpdateAsync(new_payment);

            Session["new_monthly_payment"] = null;
        }

        async void update_course()
        {
            DocumentReference staff_doc = database.Collection("Student").Document(((class_file.Student)Session["Current_User"]).studentID);

            List<string> list = Session["Register_new_course"].ToString().Split(' ').ToList();

            for (int i = 0; i < list.Count(); i++)
            {
                await staff_doc.UpdateAsync("courseID", FieldValue.ArrayUnion(list[i]));
            }

            Response.Redirect("~/common/User/payment.aspx");
        }
    }
}