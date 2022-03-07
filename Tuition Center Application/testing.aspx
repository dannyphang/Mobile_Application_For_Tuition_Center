<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/staff.Master" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="Tuition_Center_Application.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href=".././css/testing.css" type="text/css" />


    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <div class="container bootstrap snippets bootdey">
        <div class="row">
            <div class="panel">
                <div class="cover-photo">
                    <div class="fb-timeline-img">
                        <img src="https://bootdey.com/img/Content/bg1.jpg" alt="">
                    </div>
                    <div class="fb-name">
                        <h2><asp:Label ID="course_name_label" runat="server" Text="course name"></asp:Label></h2>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="profile-thumb">
                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                    </div>
                    <asp:Label ID="time_label" runat="server" CssClass="fb-user-mail" Text="Time:Time am"></asp:Label>
                </div>
            </div>

            <div class="panel profile-info">
                <asp:TextBox ID="post_box_text" runat="server" placeholder="Announce something to your class..." CssClass="form-control input-lg p-text-area"></asp:TextBox>
                <footer class="panel-footer">
                    <a><asp:LinkButton ID="post_btn" runat="server" class="btn btn-info pull-right post_btn"><span><ion-icon name="paper-plane-outline"></ion-icon></span></asp:LinkButton></a>
                    <ul class="nav nav-pills">
                        <li><a href="#"><i class="fa fa-map-marker"></i></a></li>
                        <li><a href="#"><i class="fa fa-camera"></i></a></li>
                        <li><a href="#"><i class=" fa fa-film"></i></a></li>
                        <li><a href="#"><i class="fa fa-microphone"></i></a></li>
                    </ul>
                </footer>
            </div>
            <%-- POST SECTION / BOX --%>
            <div class="panel">
                <div class="panel-body">
                    <div class="fb-user-thumb">
                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="">
                    </div>
                    <div class="fb-user-details">
                        <h3><a href="#" class="#">Margarita Elina</a></h3>
                        <p>7 minutes ago near Alaska, USA</p>
                    </div>
                    <div class="clearfix"></div>
                    <p class="fb-user-status">
                        John is world famous professional photographer.  with forward thinking clients to create beautiful, honest and amazing things that bring positive results. John is world famous professional photographer.  with forward thinking clients to create beautiful, honest and amazing things that bring positive results.
                    </p>


                    <div class="fb-status-container fb-border fb-gray-bg">

                        <ul class="fb-comments">
                            <li>
                                <a href="#" class="cmt-thumb">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                                </a>
                                <div class="cmt-details">
                                    <a href="#">Jhone due</a>
                                    <span>is world famous professional photographer.  with forward thinking clients to create beautiful, </span>
                                    <p>40 minutes ago</p>
                                </div>
                            </li>
                            <li class="comment_box">
                                <a href="#" class="cmt-thumb">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar8.png" alt="">
                                </a>
                                <div class="cmt-form">
                                    <textarea class="form-control" placeholder="Write a comment..." name=""></textarea>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- IONICONS --%>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</asp:Content>
