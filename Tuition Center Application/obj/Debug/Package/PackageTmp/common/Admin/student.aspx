﻿<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.student" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://designmodo.com/demo/calendarjquerycss3/css/calendar.css" media="screen">
    <link rel="stylesheet" href="../../css/calander.css" />
    <meta name="robots" content="noindex,follow" />
    <link rel="stylesheet" href="../../css/admin_student.css" />

    <%-- CONTENT --%>
    <section id="content">
        <!-- MAIN -->
        <main>
            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Students</h3>
                        <i class='bx bx-search'></i>
                        <%--<i class='bx bx-list-ul'></i>--%>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Education Level</th>
                                <th>IC/No</th>
                                <th>Phone Number</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="student_repeater" runat="server">
                                <ItemTemplate>
                                    <asp:HiddenField ID="studentID_hd" runat="server" Value='<%# Eval("studentID") %>' />
                                    <asp:HiddenField ID="name_hd" runat="server" Value='<%# Eval("name") %>' />
                                    <tr>
                                        <td class="name_column">
                                            <asp:Image ID="profile_image" runat="server" ImageUrl='<%# Eval("avatar") %>' />
                                            <asp:Label ID="name_label" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="educationLV_label" runat="server" CssClass="status level" Text='<%# Eval("educationLV") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="IC_label" runat="server" Text='<%# Eval("IC") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="phoneNo_label" runat="server" Text='<%# Eval("phoneNo") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <div class="wrapper">
                                                <asp:LinkButton ID="more_btn" runat="server" CssClass="icon more" OnClick="more_btn_Click" OnClientClick="detail_btn_func()">
                                                    <div class="tooltip">More</div>
                                                    <span><ion-icon name="information-circle-outline"></ion-icon></span>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="edit_btn" runat="server" CssClass="icon edit" OnClick="edit_btn_Click" OnClientClick="detail_btn_func()">
                                                    <div class="tooltip">Edit</div>
                                                    <span><ion-icon name="create-outline"></ion-icon></span>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="delete_btn" runat="server" CssClass="icon delete" OnClick="delete_btn_Click">
                                                    <div class="tooltip">Delete</div>
                                                    <span><ion-icon name="trash-outline"></ion-icon></span>
                                                </asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        <!-- MAIN -->

        <%-- Flow EDIT Modal --%>
        <div id="demo_modal" class="modal_form" runat="server">
            <div class="modal__content">
                <div class="top">
                    <div class="x-touch" onclick="document.querySelector('.modal_form').classList.remove('expand');event.stopPropagation();">
                        <div class="x">
                            <div class="line1"></div>
                            <div class="line2"></div>
                        </div>
                    </div>
                </div>
                <div class="to">
                    <div class="to-contents">
                        <div class="bottom">
                            <div class="row row2">
                                <div class="avatar-upload">
                                    <div class="avatar-preview">
                                        <asp:Image ID="imagePreview_asp" runat="server" CssClass="image_preview" />
                                        <asp:HiddenField ID="table_image_hf" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <%--Student Name Textbox--%>
                            <div class="row row2">
                                <h4 class="h4_text">Name</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="name_text" runat="server" CssClass="input" placeholder="Name"></asp:TextBox>
                                    <div class="input-icon">
                                        <p>
                                            <span class="info_icon">
                                                <ion-icon name="person-circle-outline"></ion-icon>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <%--IC Textbox--%>
                            <div class="row row2">
                                <h4 class="h4_text">IC NO</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="IC_text" runat="server" CssClass="input" placeholder="IC No"></asp:TextBox>
                                    <div class="input-icon">
                                        <p>
                                            <span class="info_icon">
                                                <ion-icon name="id-card-outline"></ion-icon>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <%--Email Textbox--%>
                            <div class="row row2">
                                <h4 class="h4_text">Email</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="email_text" runat="server" CssClass="input" placeholder="Email" TextMode="SingleLine"></asp:TextBox>
                                    <div class="input-icon">
                                        <p>
                                            <span class="info_icon">
                                                <ion-icon name="mail-outline"></ion-icon>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <%--Address Textbox--%>
                            <div class="row row2">
                                <h4 class="h4_text">Address</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="address_text" runat="server" CssClass="input" placeholder="Address"></asp:TextBox>
                                    <div class="input-icon">
                                        <p>
                                            <span class="info_icon">
                                                <ion-icon name="planet-outline"></ion-icon>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="row row2">
                                <%-- Phone Number Textbox --%>
                                <div class="col-half col-half2">
                                    <h4 class="h4_text">Phone Number</h4>
                                    <div class="input-group input-group-icon">
                                        <asp:TextBox ID="phone_text" runat="server" CssClass="input" placeholder="Phone Number"></asp:TextBox>
                                        <div class="input-icon">
                                            <p>
                                                <span class="info_icon">
                                                    <ion-icon name="call-outline"></ion-icon>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <%-- DOB DDL --%>
                                <div class="col-half col-half2">
                                    <h4 class="h4_text">Date of Birth</h4>
                                    <div class="input-group input-group-icon">
                                        <asp:TextBox ID="DOB_text" runat="server" CssClass="input" placeholder="Date of Birth"></asp:TextBox>
                                        <div class="input-icon">
                                            <p>
                                                <span class="info_icon">
                                                    <ion-icon name="calendar-clear-outline"></ion-icon>
                                                </span>
                                            </p>
                                        </div>
                                        <%--<div class="calendar_dob"></div>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="row row2">
                                <%-- Education Level DDL --%>
                                <div class="col-half col-half2">
                                    <h4 class="h4_text">Education Level</h4>
                                    <div class="input-group">
                                        <asp:DropDownList ID="level_ddl" runat="server">
                                            <asp:ListItem>Standard 1</asp:ListItem>
                                            <asp:ListItem>Standard 2</asp:ListItem>
                                            <asp:ListItem>Standard 3</asp:ListItem>
                                            <asp:ListItem>Standard 4</asp:ListItem>
                                            <asp:ListItem>Standard 5</asp:ListItem>
                                            <asp:ListItem>Standard 6</asp:ListItem>
                                            <asp:ListItem>Form 1</asp:ListItem>
                                            <asp:ListItem>Form 2</asp:ListItem>
                                            <asp:ListItem>Form 3</asp:ListItem>
                                            <asp:ListItem>Form 4</asp:ListItem>
                                            <asp:ListItem>Form 5</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%-- School Textbox --%>
                                <div class="col-half col-half2">
                                    <h4 class="h4_text">School</h4>
                                    <div class="input-group input-group-icon">
                                        <asp:TextBox ID="school_text" runat="server" CssClass="input" placeholder="School"></asp:TextBox>
                                        <div class="input-icon">
                                            <p>
                                                <span class="info_icon">
                                                    <ion-icon name="school-outline"></ion-icon>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row row2">
                                <div class="col-half col-half2">
                                    <div class="input-group"></div>
                                </div>
                                <div class="col-half col-half2">
                                    <asp:Button ID="reset_btn" runat="server" Text="Reset" CssClass="modal_btn" OnClick="reset_btn_Click" />
                                    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="modal_btn" OnClick="update_btn_Click" />
                                </div>
                                <asp:HiddenField ID="studentID_hd2" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- Flow EDIT Modal --%>

        <%-- Modal Box --%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <a href="#" class="btn-normal blue" id="move-thread">
                        <ion-icon name="add-outline"></ion-icon>
                    </a>

                    <div id="move-thread-modal" class="modal">
                        <a href="#" id="move-thread-close" class="btn-normal red">
                            <span>
                                <ion-icon name="close-outline"></ion-icon>
                            </span>
                        </a>
                        <div class="row row2">
                            <div class="avatar-upload">
                                <div class="avatar-edit">
                                    <input type='file' id="imageUpload2" class="file_input" accept=".png, .jpg, .jpeg" />
                                    <label for="imageUpload2"></label>
                                    <asp:HiddenField ID="image_hf2" runat="server" Value="Why are you here? I don't want to see you eh.." />
                                </div>
                                <div class="avatar-preview">
                                    <div id="imagePreview2" class="image_preview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--Student Name Textbox--%>
                        <div class="row row2">
                            <h4 class="h4_text">Name</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="name_text_e" runat="server" CssClass="input" placeholder="Name"></asp:TextBox>
                                <div class="input-icon">
                                    <p>
                                        <span class="info_icon">
                                            <ion-icon name="person-circle-outline"></ion-icon>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <%--IC Textbox--%>
                        <div class="row row2">
                            <h4 class="h4_text">IC NO</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="IC_text_e" runat="server" CssClass="input" placeholder="IC No"></asp:TextBox>
                                <div class="input-icon">
                                    <p>
                                        <span class="info_icon">
                                            <ion-icon name="id-card-outline"></ion-icon>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <%--Email Textbox--%>
                        <div class="row row2">
                            <h4 class="h4_text">Email</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="email_text_e" runat="server" CssClass="input" placeholder="Email" TextMode="SingleLine"></asp:TextBox>
                                <div class="input-icon">
                                    <p>
                                        <span class="info_icon">
                                            <ion-icon name="mail-outline"></ion-icon>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row row2">
                            <%--Password Textbox--%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">Password</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="password_text_e" runat="server" CssClass="input" placeholder="Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                                    <div class="input-icon">
                                        <p>
                                            <span class="info_icon">
                                                <ion-icon name="lock-closed-outline"></ion-icon>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <%--Confirm Password Textbox--%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">Confirm Password</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="confirm_password_text_e" runat="server" CssClass="input" placeholder="Confirm Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                                    <div class="input-icon">
                                        <p>
                                            <span class="info_icon">
                                                <ion-icon name="lock-closed-outline"></ion-icon>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--Address Textbox--%>
                        <div class="row row2">
                            <h4 class="h4_text">Address</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="address_text_e" runat="server" CssClass="input" placeholder="Address"></asp:TextBox>
                                <div class="input-icon">
                                    <p>
                                        <span class="info_icon">
                                            <ion-icon name="planet-outline"></ion-icon>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row row2">
                            <%-- Phone Number Textbox --%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">Phone Number</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="phone_text_e" runat="server" CssClass="input" placeholder="Phone Number"></asp:TextBox>
                                    <div class="input-icon">
                                        <asp:LinkButton ID="delete_btn" runat="server" CssClass="info_icon delete" OnClick="delete_btn_Click">
                                <p><span class="info_icon"><ion-icon name="call-outline"></ion-icon></span></p>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <%-- DOB DDL --%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">Date of Birth</h4>
                                <div id="calendar"></div>
                                <asp:HiddenField ID="datehf" runat="server" Value="0000" ClientIDMode="Static" />
                            </div>
                        </div>
                        <div class="row row2">
                            <%-- Education Level DDL --%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">Education Level</h4>
                                <div class="input-group">
                                    <asp:DropDownList ID="level_ddl_e" runat="server" onchange="get_level_drop()">
                                        <asp:ListItem>Standard 1</asp:ListItem>
                                        <asp:ListItem>Standard 2</asp:ListItem>
                                        <asp:ListItem>Standard 3</asp:ListItem>
                                        <asp:ListItem>Standard 4</asp:ListItem>
                                        <asp:ListItem>Standard 5</asp:ListItem>
                                        <asp:ListItem>Standard 6</asp:ListItem>
                                        <asp:ListItem>Form 1</asp:ListItem>
                                        <asp:ListItem>Form 2</asp:ListItem>
                                        <asp:ListItem>Form 3</asp:ListItem>
                                        <asp:ListItem>Form 4</asp:ListItem>
                                        <asp:ListItem>Form 5</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <%-- School Textbox --%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">School</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="school_text_e" runat="server" CssClass="input" placeholder="School"></asp:TextBox>
                                    <div class="input-icon">
                                        <p>
                                            <span class="info_icon">
                                                <ion-icon name="school-outline"></ion-icon>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- Course CheckList --%>
                        <div class="row">
                            <div class="input-group input-group-icon">
                                <%--<asp:CheckBoxList ID="course_check" runat="server" OnSelectedIndexChanged="course_check_SelectedIndexChanged" >

                                </asp:CheckBoxList>--%>
                                <asp:CheckBoxList ID="form1_check" runat="server" OnSelectedIndexChanged="form1_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>
                                <asp:CheckBoxList ID="form2_check" runat="server" OnSelectedIndexChanged="form2_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>
                                <asp:CheckBoxList ID="form3_check" runat="server" OnSelectedIndexChanged="form3_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>
                                <asp:CheckBoxList ID="form4_check" runat="server" OnSelectedIndexChanged="form4_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>
                                <asp:CheckBoxList ID="form5_check" runat="server" OnSelectedIndexChanged="form5_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>
                                <asp:CheckBoxList ID="standard1_check" runat="server" OnSelectedIndexChanged="standard1_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>
                                <asp:CheckBoxList ID="standard2_check" runat="server" OnSelectedIndexChanged="standard2_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>
                                <asp:CheckBoxList ID="standard3_check" runat="server" OnSelectedIndexChanged="standard3_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>
                                <asp:CheckBoxList ID="standard4_check" runat="server" OnSelectedIndexChanged="standard4_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>
                                <asp:CheckBoxList ID="standard5_check" runat="server" OnSelectedIndexChanged="standard5_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>
                                <asp:CheckBoxList ID="standard6_check" runat="server" OnSelectedIndexChanged="standard6_check_SelectedIndexChanged" CssClass="checkitem_none checklist">

                                </asp:CheckBoxList>

                            </div>
                        </div>
                        <div class="row row2">
                            <div class="col-half col-half2">
                                <div class="input-group"></div>
                            </div>
                            <div class="col-half col-half2">
                                <asp:Button ID="clear_btn" runat="server" Text="Clear" CssClass="modal_btn" OnClick="clear_btn_Click" />
                                <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="modal_btn" OnClick="submit_btn_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <%-- Modal Box --%>
    </section>
    <%-- CONTENT --%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://designmodo.com/demo/calendarjquerycss3/js/jquery-ui-datepicker.min.js"></script>
    <script src="../../js/admin_student.js"></script>
    <script src="../../js/calendar.js"></script>

    <script>
        function get_level_drop() {
            let droplist = document.getElementById("<%= level_ddl_e.ClientID %>");
            let get_index = droplist.options[droplist.selectedIndex].index;
            let get_text = droplist.options[droplist.selectedIndex].value;

            //alert('index: ' + get_index + '\ntext: ' + get_text);
            document.getElementById("<%= form1_check.ClientID %>").style.display = "none";
            document.getElementById("<%= form2_check.ClientID %>").style.display = "none";
            document.getElementById("<%= form3_check.ClientID %>").style.display = "none";
            document.getElementById("<%= form4_check.ClientID %>").style.display = "none";
            document.getElementById("<%= form5_check.ClientID %>").style.display = "none";
            document.getElementById("<%= standard1_check.ClientID %>").style.display = "none";
            document.getElementById("<%= standard2_check.ClientID %>").style.display = "none";
            document.getElementById("<%= standard3_check.ClientID %>").style.display = "none";
            document.getElementById("<%= standard4_check.ClientID %>").style.display = "none";
            document.getElementById("<%= standard5_check.ClientID %>").style.display = "none";
            document.getElementById("<%= standard6_check.ClientID %>").style.display = "none";

            if (get_text == 'Form 1') {
                document.getElementById("<%= form1_check.ClientID %>").style.display = "block";
            }
            else if (get_text == 'Form 2') {
                document.getElementById("<%= form2_check.ClientID %>").style.display = "block";
            }
            else if (get_text == 'Form 3') {
                document.getElementById("<%= form3_check.ClientID %>").style.display = "block";
            }
            else if (get_text == 'Form 4') {
                document.getElementById("<%= form4_check.ClientID %>").style.display = "block";
            }
            else if (get_text == 'Form 5') {
                document.getElementById("<%= form5_check.ClientID %>").style.display = "block";
            }
            else if (get_text == 'Standard 1') {
                document.getElementById("<%= standard1_check.ClientID %>").style.display = "block";
            }
            else if (get_text == 'Standard 2') {
                document.getElementById("<%= standard2_check.ClientID %>").style.display = "block";
            }
            else if (get_text == 'Standard 3') {
                document.getElementById("<%= standard3_check.ClientID %>").style.display = "block";
            }
            else if (get_text == 'Standard 4') {
                document.getElementById("<%= standard4_check.ClientID %>").style.display = "block";
            }
            else if (get_text == 'Standard 5') {
                document.getElementById("<%= standard5_check.ClientID %>").style.display = "block";
            }
            else if (get_text == 'Standard 6') {
                document.getElementById("<%= standard6_check.ClientID %>").style.display = "block";
            }
        }
    </script>

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imagePreview2').css('background-image', 'url(' + e.target.result + ')');
                    $('#imagePreview2').hide();
                    $('#imagePreview2').fadeIn(650);
                    document.getElementById("<%= image_hf2.ClientID %>").value = String(e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#imageUpload2").change(function () {
            readURL(this);
        });
    </script>
    <script>
        window.addEventListener('load',
            function load() {
                window.removeEventListener('load', load, false);
                document.body.classList.remove('preload');
            }
            , false);
        $(function () {
            $("#move-thread").click(function (event) {
                event.preventDefault();
                $("#modal-overlay").addClass("active");
                $("#move-thread-modal").addClass("active");
            });
            $("#move-thread-close").click(function (event) {
                event.preventDefault();
                $("#modal-overlay").removeClass("active");
                $("#move-thread-modal").removeClass("active");
            });
        });
        $(document).ready(function () {
            $(document.body).append("<div id='modal-overlay'></div>");
        });
    </script>
</asp:Content>