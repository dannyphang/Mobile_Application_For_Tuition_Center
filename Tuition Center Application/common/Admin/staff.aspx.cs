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
        protected List<Tutor> staff_var = new List<Tutor>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}