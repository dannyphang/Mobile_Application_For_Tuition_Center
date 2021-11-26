using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.class_file
{
    [FirestoreData]
    public class Course
    {
        [FirestoreDocumentId]
        public string courseID { get; set; }
        [FirestoreProperty]
        public string courseName { get; set; }
        [FirestoreProperty]
        public string level { get; set; }
        [FirestoreProperty]
        public float price { get; set; }
        [FirestoreProperty]
        public string language { get; set; }
        [FirestoreProperty]
        public DateTime date { get; set; }
        [FirestoreProperty]
        public string time { get; set; }
    }
}