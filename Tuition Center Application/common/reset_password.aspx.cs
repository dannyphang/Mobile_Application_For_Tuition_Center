using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common
{
    public partial class reset_password : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<class_file.Student> student_var = new List<class_file.Student>();

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();
        }

        protected void confirm_btn_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("password_input: " + Request.Form["password_input"]);
            System.Diagnostics.Debug.WriteLine("passwordc_input: " + Request.Form["passwordc_input"]);

            if (Request.Form["password_input"] == Request.Form["passwordc_input"])
            {
                update_password(Request.Form["password_input"]);

                Response.Write("<script>alert('Your Password is changed!')</script>");
                Response.Redirect("~/common/login.aspx", false);
            }
            else
            {
                Response.Write("<script>alert('Your Password is not match!')</script>");
            }
        }

        async void update_password(string password)
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Student");

            // clear all the elements from the list
            student_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                if (student.email == Session["Reset_Email"].ToString())
                {
                    //System.Diagnostics.Debug.WriteLine(": " + Request.Form["password_input"]);
                    DocumentReference doc = database.Collection("Student").Document(student.studentID);

                    Dictionary<string, object> update_otp = new Dictionary<string, object>
                    {
                        { "password", password },

                    };
                    await doc.UpdateAsync(update_otp);
                    Session["Reset_Email"] = null;
                    break;
                }
            }
        }
    }
}