<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/student.Master" AutoEventWireup="true" CodeBehind="classroom.aspx.cs" Inherits="Tuition_Center_Application.common.User.classroom" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../css/classroom.css" type="text/css" />

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <div class="container bootstrap snippets bootdey">
        <div class="row">
            <div class="panel">
                <div class="cover-photo">
                    <div class="fb-timeline-img">
                        <img src="https://bootdey.com/img/Content/bg1.jpg" alt="">
                    </div>
                    <div class="fb-name">
                        <h2>
                            <asp:Label ID="course_name_label" runat="server" Text="course name"></asp:Label>
                        </h2>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="profile-thumb">
                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                    </div>
                    <asp:Label ID="time_label" runat="server" CssClass="fb-user-mail" Text="Time:Time am"></asp:Label>
                </div>
            </div>

            <%--<div class="panel profile-info">
                <asp:TextBox ID="post_box_text" runat="server" placeholder="Announce something to your class..." CssClass="form-control input-lg p-text-area"></asp:TextBox>
                <div>
                    <a>
                        <asp:LinkButton ID="post_btn" runat="server" class="btn btn-info pull-right post_btn" OnClick="post_btn_Click">
                                <span><ion-icon name="paper-plane-outline"></ion-icon></span>
                        </asp:LinkButton>
                    </a>
                </div>
            </div>--%>
            <%-- POST SECTION / BOX --%>
            <asp:Repeater ID="post_repeater" runat="server" OnItemDataBound="post_repeater_ItemBound">
                <ItemTemplate>
                    <div class="panel">
                        <div class="panel-body panel-body2">
                            <div class="fb-user-thumb">
                                <asp:Image ID="post_creator_img" runat="server" ImageUrl="https://bootdey.com/img/Content/avatar/avatar2.png" />
                            </div>
                            <div class="fb-user-details">
                                <h3>
                                    <a>
                                        <asp:Label ID="tutor_name_label" runat="server" Text='<%# Eval("creatorName") %>'></asp:Label>
                                    </a>
                                    <asp:HiddenField ID="postID_hf" runat="server" Value='<%# Eval("postID") %>' />
                                </h3>
                                <asp:Label ID="post_time_label" runat="server" Text='<%# Eval("postTime") %>'></asp:Label>
                            </div>
                            <div class="clearfix"></div>
                            <asp:Label ID="post_content_label" runat="server" CssClass="fb-user-status">
                                <%# Eval("postContent") %>
                            </asp:Label>

                            <%-- comment section --%>
                            <div class="fb-status-container fb-border fb-gray-bg">
                                <ul class="fb-comments">
                                    <asp:Repeater ID="comment_repeater" runat="server" OnItemDataBound="comment_repeater_ItemDataBound">
                                        <ItemTemplate>
                                            <li>
                                                <asp:Image ID="comment_user_img" runat="server" CssClass="cmt-thumb" ImageUrl="https://bootdey.com/img/Content/avatar/avatar3.png" />
                                                <div class="cmt-details">
                                                    <a class="comment_user">
                                                        <asp:Label ID="comment_username_label" runat="server" Text='<%# Eval("commentUser") %>'></asp:Label>
                                                    </a>
                                                    <asp:Label ID="comment_time_label" runat="server" CssClass="comment_time"><%# Eval("commentTime") %></asp:Label>
                                                    <asp:Label ID="comment_label" runat="server" CssClass="comment_label">
                                                        <%# Eval("commentContent") %>
                                                    </asp:Label>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <li>
                                        <asp:Image ID="comment_user_img3" runat="server" CssClass="cmt-thumb" ImageUrl="https://bootdey.com/img/Content/avatar/avatar8.png" />
                                        <div class="cmt-form">
                                            <asp:TextBox ID="current_user_comment_text" runat="server" placeholder="Comment something..." CssClass="form-control input-lg p-text-area text_padding" OnTextChanged="current_user_comment_text_TextChanged"></asp:TextBox>
                                            <div>
                                                <a>
                                                    <asp:LinkButton ID="comment_btn" runat="server" class="btn btn-info pull-right post_btn2" OnClick="comment_btn_Click" OnClientClick="comment_btn()">
                                                        <span><ion-icon name="return-down-forward-outline"></ion-icon></span>
                                                    </asp:LinkButton>
                                                </a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <%-- comment section --%>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
    <%-- POST SECTION / BOX --%>

    <%-- IONICONS --%>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script>
        function comment_btn() {
            //alert(document.getElementById("current_user_comment_text").value);
        }
    </script>
</asp:Content>