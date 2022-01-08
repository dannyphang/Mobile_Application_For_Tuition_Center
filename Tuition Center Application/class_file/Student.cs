using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.class_file
{
    [FirestoreData]
    public class Student
    {
        [FirestoreDocumentId]
        public string studentID { get; set; }
        [FirestoreProperty]
        public string name { get; set; }
        [FirestoreProperty]
        public string email { get; set; }
        [FirestoreProperty]
        public string password { get; set; }
        [FirestoreProperty]
        public string IC { get; set; }
        [FirestoreProperty]
        public string OTP { get; set; }
        [FirestoreProperty]
        public DateTime OTP_Send { get; set; }
        [FirestoreProperty]
        public string avatar { get; set; }
        [FirestoreProperty]
        public string address { get; set; }
        [FirestoreProperty]
        public string phoneNo { get; set; }
        [FirestoreProperty]
        public DateTime DOB { get; set; }
        [FirestoreProperty]
        public string educationLV { get; set; }
        [FirestoreProperty]
        public string school { get; set; }
        [FirestoreProperty]
        public List<string> courseID { get; set; }
    }
}