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
    public partial class staff : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Tutor> tutor_var = new List<Tutor>();
        string new_id = "why r u here???";

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            get_a_doc();
        }

        protected void more_btn_Click(object sender, EventArgs e)
        {

        }

        protected void edit_btn_Click(object sender, EventArgs e)
        {

        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {

        }

        async void get_a_doc()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Staff");
            
            // clear all the elements from the list
            tutor_var.Clear();

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Tutor tutor = docsnap.ConvertTo<Tutor>();
                tutor_var.Add(tutor);
            }
            //new_id = (int.Parse(tutor_var[tutor_var.Count() - 1].tutorID) + 1).ToString();

            tutor_repeater.DataSource = tutor_var;
            tutor_repeater.DataBind();
        }

        string getID(object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            return ((HiddenField)item.FindControl("tutorID_hd")).Value;
        }
    }
}