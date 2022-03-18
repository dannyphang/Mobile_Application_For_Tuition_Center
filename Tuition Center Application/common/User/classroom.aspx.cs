using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using Tuition_Center_Application.class_file;

namespace Tuition_Center_Application.common.User
{
    public partial class classroom : System.Web.UI.Page
    {
        FirestoreDb database;
        protected List<Post> post_var = new List<Post>();
        protected List<Comment> comment_var = new List<Comment>();
        protected List<Tutor> tutor_var = new List<Tutor>();
        protected List<class_file.Student> student_var = new List<class_file.Student>();
        protected Repeater comment_repeater;
        protected TextBox comment_textbox;
        protected string comment_text;

        protected void Page_Load(object sender, EventArgs e)
        {
            database = util.firebase.get_database();

            course_name_label.Text = ((Course)Session["current_classroom"]).courseName;
            time_label.Text = ((Course)Session["current_classroom"]).time_start + " - " + ((Course)Session["current_classroom"]).time_end;

            if (IsPostBack)
            {

            }

            get_a_post();
        }

        async void get_a_post()
        {
            post_var.Clear();

            QuerySnapshot snap = await util.firebase.get_doc_snap("Post");

            foreach (DocumentSnapshot docsnap in snap.Documents)
            {
                Post post = docsnap.ConvertTo<Post>();
                if (post.courseID == ((Course)Session["current_classroom"]).courseID)
                {
                    post_var.Add(post);
                }

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
                comment_user_img2.ImageUrl = ((class_file.Student)Session["Current_User"]).avatar;
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

        protected void comment_btn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string post_id = ((HiddenField)item.FindControl("postID_hf")).Value;

            for (int i = 0; i < post_var.Count(); i++)
            {
                if (post_var[i].postID == post_id)
                {
                    TextBox comment_textbox = ((TextBox)item.FindControl("current_user_comment_text"));

                    System.Diagnostics.Debug.WriteLine("comment_textbox.text: " + comment_textbox.Text);
                    add_comment(post_id, sender);
                }
            }

            Response.Redirect("~/common/Staff/classroom.aspx", false);
        }

        async void add_comment(string post_id, object sender)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            TextBox comment_textbox = ((TextBox)item.FindControl("current_user_comment_text"));

            System.Diagnostics.Debug.WriteLine("comment_text: " + comment_text);

            //Comment new_comment = new Comment
            //{
            //    commentContent = comment_text,
            //    commentTime = Timestamp.FromDateTime(DateTime.UtcNow),
            //    commentUser = ((Tutor)Session["Current_User"]).name,
            //    commentUserRole = "Staff",
            //    postID = post_id, 
            //};

            //await database.Collection("Comment").AddAsync(new_comment);

            //Response.Redirect("~/common/Staff/classroom.aspx", false);
        }

        protected void current_user_comment_text_TextChanged(object sender, EventArgs e)
        {
            Repeater item = (Repeater)((TextBox)sender).NamingContainer;

            comment_text = ((TextBox)item.FindControl("current_user_comment_text")).Text;
            System.Diagnostics.Debug.WriteLine("comment_text1: " + comment_text);
        }
    }
}