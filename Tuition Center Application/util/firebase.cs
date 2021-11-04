using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Google.Cloud.Firestore;

namespace Tuition_Center_Application.util
{
    public class firebase
    {
        public static FirestoreDb get_database()
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + @"cloud_fire.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);

            return FirestoreDb.Create("tuition-centre-application");
        }

        public static async Task<QuerySnapshot> get_doc_snap(string collection)
        {
            CollectionReference doc = get_database().Collection(collection);

            return await doc.GetSnapshotAsync();
        }

        public static async Task<DocumentSnapshot> get_a_doc_snap(string collection, string id)
        {
            DocumentReference doc = get_database().Collection(collection).Document(id);
            DocumentSnapshot snap = await doc.GetSnapshotAsync();
            if (snap.Exists)
            {
                return snap;
            }
            return null;
        }

    }
}