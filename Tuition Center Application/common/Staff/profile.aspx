<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/staff.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Tuition_Center_Application.common.Staff.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="../../css/student_profile.css" type="text/css" />

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container margin_top">
                <div class="main-body">
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <div class="avatar-upload">
                                            <div class="avatar-edit">
                                                <button style="border: 0px; border-radius: 100%; background-color: transparent; height: 34px;" onclick="return upload_btn_clicked()">
                                                    <input type='file' id="imageUpload2" class="file_input" accept=".png, .jpg, .jpeg" />
                                                    <label for="imageUpload2">
                                                </button>
                                                </label>
                                            </div>
                                            <div class="avatar-preview">
                                                <div id="imagePreview2" class="image_preview" style="background-image: url(<%= current_tutor.avatar %>)"></div>
                                                <%--<asp:Image ID="profile_image" runat="server" CssClass="image_preview profile_img" />--%>
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="image_hf" runat="server" />
                                        <div class="mt-3">
                                            <h4>
                                                <asp:Label ID="name_label" runat="server" Text="NameName"></asp:Label>
                                            </h4>
                                            <p class="text-secondary mb-1">
                                                <asp:Label ID="date_label" runat="server" Text="18/02/1999"></asp:Label>
                                            </p>
                                            <p class="text-muted font-size-sm">
                                                <asp:Label ID="IC_label" runat="server" Text="19191911919919111"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- Media Social --%>
                            <div class="card mt-3">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe mr-2 icon-inline">
                                                <circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>Website</h6>
                                        <span class="text-secondary">
                                            <asp:Label ID="website_label" runat="server" Text="website.com"></asp:Label>
                                            <asp:TextBox ID="website_text" runat="server"></asp:TextBox>
                                        </span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github mr-2 icon-inline">
                                                <path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>Github</h6>
                                        <span class="text-secondary">
                                            <asp:Label ID="github_label" runat="server" Text="github.git"></asp:Label>
                                            <asp:TextBox ID="github_text" runat="server"></asp:TextBox>
                                        </span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter mr-2 icon-inline text-info">
                                                <path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>Twitter</h6>
                                        <span class="text-secondary">
                                            <asp:Label ID="twitter_label" runat="server" Text="twitter.com"></asp:Label>
                                            <asp:TextBox ID="twitter_text" runat="server"></asp:TextBox>
                                        </span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram mr-2 icon-inline text-danger">
                                                <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>Instagram</h6>
                                        <span class="text-secondary">
                                            <asp:Label ID="instagram_label" runat="server" Text="twitter.com"></asp:Label>
                                            <asp:TextBox ID="instagram_text" runat="server"></asp:TextBox>
                                        </span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook mr-2 icon-inline text-primary">
                                                <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>Facebook</h6>
                                        <span class="text-secondary">
                                            <asp:Label ID="facebook_label" runat="server" Text="facebook.com"></asp:Label>
                                            <asp:TextBox ID="facebook_text" runat="server"></asp:TextBox>
                                        </span>
                                    </li>
                                </ul>
                            </div>
                            <%-- Media Social --%>
                        </div>
                        <div class="col-md-8" id="table_1" runat="server">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <asp:Label ID="email_label" runat="server" Text="email@email.com"></asp:Label>
                                            <asp:TextBox ID="email_text" runat="server" CssClass="hidden_text"></asp:TextBox>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <asp:Label ID="phone_label" runat="server" Text="0123456789"></asp:Label>
                                            <asp:TextBox ID="phone_text" runat="server" CssClass="hidden_text"></asp:TextBox>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <asp:Label ID="address_label" runat="server" Text="Bay Area, San Francisco, CA"></asp:Label>
                                            <asp:TextBox ID="address_text" runat="server" CssClass="hidden_text"></asp:TextBox>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Salary</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <asp:Label ID="salary_label" runat="server" Text="5000"></asp:Label>
                                            <asp:TextBox ID="salary_text" runat="server" CssClass="hidden_text"></asp:TextBox>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <a id="a1" class="btn btn-info" style="z-index: -1; padding: 0px;">
                                                <asp:Button ID="edit_btn" runat="server" CssClass="btn btn-info edit_btn" Text="EDIT" OnClick="edit_btn_Click" OnClientClick="edit_btn_clicked()" />
                                            </a>
                                            <a id="a2" class="btn btn-info" style="z-index: -1; padding: 0px; visibility: hidden">
                                                <asp:Button ID="cancel_btn" runat="server" CssClass="btn btn-info cancel_btn" Text="CANCEL" OnClick="cancel_btn_Click" OnClientClick="save_btn_clicked()" />
                                            </a>
                                            <a id="a3" class="btn btn-info" style="z-index: -1; padding: 0px; visibility: hidden">
                                                <asp:Button ID="save_btn" runat="server" CssClass="btn btn-info save_btn" Text="SAVE" OnClick="save_btn_Click" OnClientClick="save_btn_clicked()" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row gutters-sm">
                                <div class="col-sm-6 mb-3">
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>Project Status</h6>
                                            <asp:Repeater ID="Repeater1" runat="server">
                                                <ItemTemplate>
                                                    <small>
                                                        <asp:Label ID="course_label" runat="server" Text='<%# Eval("courseName") %>'></asp:Label></small>
                                                    <div class="progress mb-3" style="height: 5px">
                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <small>Web Design</small>
                                            <div class="progress mb-3" style="height: 5px">
                                                <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 mb-3">
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>Project Status</h6>
                                            <small>Web Design</small>
                                            <div class="progress mb-3" style="height: 5px">
                                                <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <small>Website Markup</small>
                                            <div class="progress mb-3" style="height: 5px">
                                                <div class="progress-bar bg-primary" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <small>One Page</small>
                                            <div class="progress mb-3" style="height: 5px">
                                                <div class="progress-bar bg-primary" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <small>Mobile Template</small>
                                            <div class="progress mb-3" style="height: 5px">
                                                <div class="progress-bar bg-primary" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <small>Backend API</small>
                                            <div class="progress mb-3" style="height: 5px">
                                                <div class="progress-bar bg-primary" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="save_btn" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <script>

        function edit_btn_clicked() {
            document.getElementById('a1').style.visibility = 'hidden';

            document.getElementById('a2').style.visibility = 'visible';
            document.getElementById('a3').style.visibility = 'visible';

        }

        function save_btn_clicked() {

        }

        function upload_btn_clicked() {
            //return false;
        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imagePreview2').css('background-image', 'url(' + e.target.result + ')');
                    $('#imagePreview2').hide();
                    $('#imagePreview2').fadeIn(650);
                    //$('.profile_img').attr("src", e.target.result);
                    document.getElementById("<%= image_hf.ClientID %>").value = String(e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#imageUpload2").change(function () {
            readURL(this);
        });
    </script>
</asp:Content>
