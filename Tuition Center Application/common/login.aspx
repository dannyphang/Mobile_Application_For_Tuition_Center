<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Tuition_Center_Application.login" %>

<!DOCTYPE html>
<%@ Register Src="~/common/cursor.ascx" TagPrefix="CURSOR" TagName="POINTER"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet' />
    <link rel="stylesheet" href="~/css/login.css" type="text/css" />
</head>
<body>
    <CURSOR:POINTER ID="cursorcontrol" runat="server" />
    <form id="form1" runat="server">
        <div class="l-form">
            <div class="form">
                <span class="back-icon"><a href="home.aspx"><ion-icon name="arrow-back-outline"></ion-icon></a></span>
                <h1 class="form__title">Sign In</h1>
                <div class="btn-box">
                    <div runat="server" id="role_btn"></div>
                    <asp:Button ID="login_student_btn" runat="server" Text="Student" CssClass="toggle-btn" OnClick="login_student_btn_Click" style="color: white" OnClientClick="return student_btn();"/>
                    <asp:Button ID="login_staff_btn" runat="server" Text="Staff" CssClass="toggle-btn" OnClick="login_staff_btn_Click" OnClientClick="return staff_btn();"/>
                </div>
                <div class="form__div">
                    <input type="text" class="form__input" name="email_input" placeholder=" "/>
                    <label for="" class="form__label">Email</label>
                </div>
                <div class="form__div">
                    <span class="password-icon" onclick="show_password()">
                        <ion-icon name="eye-off-outline" id="pw_close"></ion-icon>
                        <ion-icon name="eye-outline" id="pw_open"></ion-icon>
                    </span>
                    <input type="password" class="form__input form__input2" placeholder=" " id="password_input"/>
                    <label for="" class="form__label">Password</label>
                </div>
                <asp:Button ID="forgotBtn" runat="server" Text="FORGOT Password" CssClass="log-forgotBtn" />
                <asp:Button ID="login_submit_btn" runat="server" Text="Login" CssClass="form__button" OnClick="Button1_Click"/>
            </div>
        </div>
    </form>
    <!--Javascript-->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <script>
        // show password
        function show_password() {
            var password_input = document.getElementById("password_input");
            var pw_close = document.getElementById("pw_close");
            var pw_open = document.getElementById("pw_open");

            if (password_input.type === 'password') {
                password_input.type = "text";
                pw_open.style.display = "block";
                pw_close.style.display = "none";
            } else {
                password_input.type = "password";
                pw_open.style.display = "none";
                pw_close.style.display = "block";
            }
        }

        // button transition
        function swap_btn() {
            var btn = document.getElementById("role_btn");
            
        }

        // student button
        function student_btn() {
            var btn = document.getElementById("role_btn");
            var student = document.getElementById("login_student_btn");
            var staff = document.getElementById("login_staff_btn");
            btn.style.left = "0%";
            student.style.color = "white";
            staff.style.color = "black";
            return false;
        }

        // staff button
        function staff_btn() {
            var btn = document.getElementById("role_btn");
            var student = document.getElementById("login_student_btn");
            var staff = document.getElementById("login_staff_btn");
            btn.style.left = "51%";
            staff.style.color = "white";
            student.style.color = "black";
            return false;
        }
    </script>
</body>
</html>
