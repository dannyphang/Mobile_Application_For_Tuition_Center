<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reset_password.aspx.cs" Inherits="Tuition_Center_Application.common.reset_password" Async="true"%>

<!DOCTYPE html>
<%@ Register Src="~/common/cursor.ascx" TagPrefix="CURSOR" TagName="POINTER" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet' />
    <link rel="stylesheet" href="~/css/login.css" type="text/css" />
    <script>  
        function funfordefautenterkey1(btn, event) {
            if (document.all) {
                if (event.keyCode == 13) {
                    event.returnValue = false;
                    event.cancel = true;
                    btn.click();
                }
            }
        }
    </script>
    <script src="https://cdn.blobity.dev/by.js?noAutoStart"></script>
    <script>
            new Blobity({
                zIndex: 10000,
                opacity: 0.5,
                dotColor: 'rgb(59, 89, 153)',
                color: 'rgb(59, 89, 153)',
                radius: 10,
                fontSize: 14,
                fontColor: 'rgb(255, 255, 255)',
                mode: 'bouncy',

            });
    </script>
</head>
<body>
    <CURSOR:POINTER ID="cursorcontrol" runat="server" />
    <form id="form1" runat="server">
        <div class="l-form">
            <div class="form">
                <span class="back-icon"><a href="login.aspx">
                    <ion-icon name="arrow-back-outline"></ion-icon>
                </a></span>
                <h1 class="form__title">Reset Password</h1>

                <div class="form__div">
                    <span class="password-icon" onclick="show_password()">
                        <ion-icon name="eye-off-outline" id="pw_close"></ion-icon>
                        <ion-icon name="eye-outline" id="pw_open"></ion-icon>
                    </span>
                    <input type="password" class="form__input form__input2" placeholder=" " name="password_input" id="password_input" maxlength="20" runat="server" />
                    <label for="" class="form__label">Password</label>
                </div>
                <div class="form__div">
                    <span class="password-icon" onclick="show_password2()">
                        <ion-icon name="eye-off-outline" id="pw_close2"></ion-icon>
                        <ion-icon name="eye-outline" id="pw_open2"></ion-icon>
                    </span>
                    <input type="password" class="form__input form__input2" placeholder=" " name="passwordc_input" id="passwordc_input" maxlength="20" runat="server" />
                    <label for="" class="form__label">Confirm Password</label>
                </div>

                <asp:Button ID="confirm_btn" runat="server" Text="Confirm" CssClass="form__button" OnClick="confirm_btn_Click" />
            </div>
        </div>
    </form>
    <!--Javascript-->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <script>
            // show password
            function show_password() {
                let password_input = document.getElementById("password_input");
                let pw_close = document.getElementById("pw_close");
                let pw_open = document.getElementById("pw_open");

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
            function show_password2() {
                let password_input = document.getElementById("passwordc_input");
                let pw_close = document.getElementById("pw_close2");
                let pw_open = document.getElementById("pw_open2");

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
    </script>
</body>
</html>