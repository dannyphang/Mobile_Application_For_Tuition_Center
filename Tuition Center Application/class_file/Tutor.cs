using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.class_file
{
    [FirestoreData]
    public class Tutor
    {
        [FirestoreDocumentId]
        public string tutorID { get; set; }
        [FirestoreProperty]
        public string name { get; set; }
        [FirestoreProperty]
        public string email { get; set; }
        [FirestoreProperty]
        public string password { get; set; }
        [FirestoreProperty]
        public string IC { get; set; }
        [FirestoreProperty]
        public string avatar { get; set; }
        [FirestoreProperty]
        public string address { get; set; }
        [FirestoreProperty]
        public string phoneNo { get; set; }
        [FirestoreProperty]
        public string onBoardingDate { get; set; }
        [FirestoreProperty]
        public float salary { get; set; }
        [FirestoreProperty]
        public List<string> courseID { get; set; }
        [FirestoreProperty]
        public string website { get; set; }
        [FirestoreProperty]
        public string twitter { get; set; }
        [FirestoreProperty]
        public string github { get; set; }
        [FirestoreProperty]
        public string facebook { get; set; }
        [FirestoreProperty]
        public string instagram { get; set; }
    }
}