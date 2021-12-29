using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.class_file
{
    [FirestoreData]
    public class Cart
    {
        [FirestoreDocumentId]
        public string cartID { get; set; }
        [FirestoreDocumentId]
        public string[] courseID { get; set; }
    }
}