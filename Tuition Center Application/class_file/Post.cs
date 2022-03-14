using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.class_file
{
    [FirestoreData]
    public class Post
    {
        [FirestoreDocumentId]
        public string postID { get; set; }
        [FirestoreProperty]
        public Timestamp postTime { get; set; }
        [FirestoreProperty]
        public string courseID { get; set; }
        [FirestoreProperty]
        public string postContent { get; set; }
        [FirestoreProperty]
        public string creatorName { get; set; }
    }
}