using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.class_file
{
    [FirestoreData]
    public class Datetime
    {
        [FirestoreDocumentId]
        public string datetimeID { get; set; }
        [FirestoreProperty]
        public DateTime date { get; set; }
        [FirestoreProperty]
        public float duration { get; set; }
        [FirestoreProperty]
        public string time_start { get; set; }
        [FirestoreProperty]
        public string time_end { get; set; }
        [FirestoreProperty]
        public string day { get; set; }
    }
}