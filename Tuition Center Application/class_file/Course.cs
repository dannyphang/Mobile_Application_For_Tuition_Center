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
        public string day { get; set; }
        [FirestoreProperty]
        public string time_start { get; set; }
        [FirestoreProperty]
        public string time_end { get; set; }
        [FirestoreProperty]
        public float duration { get; set; }
        [FirestoreProperty]
        public string tutorID { get; set; }

        public static string[] level_list = { "Standard 1", "Standard 2", "Standard 3", "Standard 4", "Standard 5", "Standard 6", "Form 1", "Form 2", "Form 3", "Form 4", "Form 5" };
        public static string[] day_list = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" };
        public static string[] duration_list = { "1 hour", "1.5 hour", "2 hours", "2.5 hours" };
        


    }
}