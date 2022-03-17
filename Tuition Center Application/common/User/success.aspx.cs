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
    public partial class success : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<PaymentHistory> history_var = new List<PaymentHistory>();
        protected List<Course> course_var = new List<Course>();
        protected List<int> selected_var = new List<int>();
        protected List<string> added_selected_var = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            System.Diagnostics.Debug.WriteLine(((PaymentHistory)Session["new_monthly_payment"]).paymentHistoryID);
            
            add_new_payment();

        }

        async void add_new_payment()
        {
            await database.Collection("PaymentHistory").AddAsync((PaymentHistory)Session["new_monthly_payment"]);

            DocumentReference doc = database.Collection("Student").Document(((class_file.Student)Session["Current_User"]).studentID);

            Dictionary<string, object> new_payment = new Dictionary<string, object>
            {
                { "lastPayment", Timestamp.FromDateTime(DateTime.UtcNow) },
            };
            await doc.UpdateAsync(new_payment);

            Session["new_monthly_payment"] = null;

            Response.Redirect("~/common/User/payment.aspx");
        }
    }
}