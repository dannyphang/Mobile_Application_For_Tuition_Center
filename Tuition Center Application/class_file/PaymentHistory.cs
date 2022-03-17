using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.class_file
{
    [FirestoreData]
    public class PaymentHistory
    {
        [FirestoreDocumentId]
        public string paymentHistoryID { get; set; }
        [FirestoreProperty]
        public string studentID { get; set; }
        [FirestoreProperty]
        public Timestamp payDate { get; set; }
        [FirestoreProperty]
        public float amount { get; set; }
        [FirestoreProperty]
        public List<string> courseID { get; set; }
        [FirestoreProperty]
        public string payMonth { get; set; }
    }
}