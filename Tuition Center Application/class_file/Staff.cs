﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.class_file
{
    [FirestoreData]
    public class Staff
    {
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
        public DateTime onBoardingDate { get; set; }
        [FirestoreProperty]
        public int salary{ get; set; }
    }
}