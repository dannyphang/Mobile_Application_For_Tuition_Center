using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.Staff
{
    public partial class timetable : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Datetime> datetime_mon_list = new List<Datetime>();
        protected List<Datetime> datetime_tue_list = new List<Datetime>();
        protected List<Datetime> datetime_wed_list = new List<Datetime>();
        protected List<Datetime> datetime_thu_list = new List<Datetime>();
        protected List<Datetime> datetime_fri_list = new List<Datetime>();
        protected List<Datetime> datetime_sat_list = new List<Datetime>();
        protected List<Datetime> datetime_sun_list = new List<Datetime>();
        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            get_a_doc();
        }

        async void get_a_doc()
        {
            QuerySnapshot snap = await util.firebase.get_doc_snap("Datetime");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Datetime datetime = docsnap.ConvertTo<Datetime>();
                List<Datetime> datetime_list = new List<Datetime>();
                datetime_list.Add(datetime);

                for (int i = 0; i < datetime_list.Count; i++)
                {
                    if (datetime_list[i].day.ToString() == "Monday")
                    {
                        datetime_mon_list.Add(datetime);
                    }
                    else if (datetime_list[i].day.ToString() == "Tuesday")
                    {
                        datetime_tue_list.Add(datetime);
                    }
                    else if (datetime_list[i].day.ToString() == "Wednesday")
                    {
                        datetime_wed_list.Add(datetime);
                    }
                    else if (datetime_list[i].day.ToString() == "Thursday")
                    {
                        datetime_thu_list.Add(datetime);
                    }
                    else if (datetime_list[i].day.ToString() == "Friday")
                    {
                        datetime_fri_list.Add(datetime);
                    }
                    else if (datetime_list[i].day.ToString() == "Saturday")
                    {
                        datetime_sat_list.Add(datetime);
                    }
                    else if (datetime_list[i].day.ToString() == "Sunday")
                    {
                        datetime_sun_list.Add(datetime);
                    }
                }
            }
        }
    }
}