using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.class_file
{
    [FirestoreData]
    public class Comment
    {
        [FirestoreDocumentId]
        public string commentID { get; set; }
        [FirestoreProperty]
        public string postID { get; set; }
        [FirestoreProperty]
        public string commentUser { get; set; }
        [FirestoreProperty]
        public string commentUserRole { get; set; }
        [FirestoreProperty]
        public string commentContent { get; set; }
        [FirestoreProperty]
        public Timestamp commentTime { get; set; }
    }
}