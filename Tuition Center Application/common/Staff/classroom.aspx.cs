using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.Staff
{
    public partial class classroom : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Post> post_var = new List<Post>();
        protected List<Comment> comment_var = new List<Comment>();
        protected List<Tutor> tutor_var = new List<Tutor>();
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected Repeater comment_repeater;

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();



            get_a_post();
        }

        async void get_a_post()
        {
            post_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Post");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Post post = docsnap.ConvertTo<Post>();
                post_var.Add(post);
                //get_comment(post.postID);
            }

            QuerySnapshot student_snap = await util.firebase.get_doc_snap("Student");

            foreach (DocumentSnapshot docsnap in student_snap.Documents)
            {
                class_file.Student student = docsnap.ConvertTo<class_file.Student>();
                student_var.Add(student);
            }

            QuerySnapshot tutor_snap = await util.firebase.get_doc_snap("Staff");

            foreach (DocumentSnapshot docsnap in tutor_snap.Documents)
            {
                Tutor tutor = docsnap.ConvertTo<Tutor>();
                tutor_var.Add(tutor);
            }

            QuerySnapshot comment_snap = await util.firebase.get_doc_snap("Comment");

            foreach (DocumentSnapshot docsnap in comment_snap.Documents)
            {
                Comment comment = docsnap.ConvertTo<Comment>();
                comment_var.Add(comment);
            }

            post_repeater.DataSource = post_var;
            post_repeater.DataBind();
        }

        protected void post_repeater_ItemBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                comment_repeater = (Repeater)e.Item.FindControl("comment_repeater");

                Label post_username = (Label)e.Item.FindControl("tutor_name_label");
                Image post_user_img = (Image)e.Item.FindControl("post_creator_img");

                for (int i = 0; i < post_var.Count(); i++)
                {
                    if (post_username.Text == post_var[i].creatorName)
                    {
                        for (int j = 0; j < tutor_var.Count(); j++)
                        {
                            if (post_var[i].creatorName == tutor_var[j].name)
                            {
                                post_user_img.ImageUrl = tutor_var[j].avatar;
                            }
                        }
                    }
                }


                Image comment_user_img2 = (Image)e.Item.FindControl("comment_user_img3");
                //System.Diagnostics.Debug.WriteLine("Session['Current_User']: " + ((Tutor)Session["Current_User"]).name);
                comment_user_img2.ImageUrl = ((Tutor)Session["Current_User"]).avatar;
                comment_repeater.DataSource = get_comment((e.Item.FindControl("postID_hf") as HiddenField).Value);
                comment_repeater.DataBind();
            }
        }

        List<Comment> get_comment(string postID)
        {
            List<Comment> temp_var = new List<Comment>();
            for (int i = 0; i < comment_var.Count(); i++)
            {
                if (comment_var[i].postID == postID)
                {
                    temp_var.Add(comment_var[i]);
                }
            }

            return temp_var;
        }

        protected void comment_repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label comment_username = (Label)e.Item.FindControl("comment_username_label");
            Image comment_user_img = (Image)e.Item.FindControl("comment_user_img");

            for (int i = 0; i < comment_var.Count(); i++)
            {
                if (comment_username.Text == comment_var[i].commentUser)
                {
                    if (comment_var[i].commentUserRole == "Student")
                    {
                        for (int j = 0; j < student_var.Count(); j++)
                        {
                            if (comment_var[i].commentUser == student_var[j].name)
                            {
                                comment_user_img.ImageUrl = student_var[j].avatar;
                            }
                        }
                    }
                    else
                    {
                        for (int j = 0; j < tutor_var.Count(); j++)
                        {
                            if (comment_var[i].commentUser == tutor_var[j].name)
                            {
                                comment_user_img.ImageUrl = tutor_var[j].avatar;
                            }
                        }
                    }
                }
            }
        }
    }
}