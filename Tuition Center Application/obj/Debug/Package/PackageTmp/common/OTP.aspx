<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OTP.aspx.cs" Inherits="Tuition_Center_Application.common.OTP" Async="true"%>

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
                <h1 class="form__title">OTP Request</h1>
                
                <div class="form__div">
                    <input type="text" class="form__input" name="email_input" placeholder=" " autocomplete="off"/>
                    <label for="" class="form__label">OTP</label>
                </div>
                
                <asp:Button ID="confirm_btn" runat="server" Text="Confirm" CssClass="form__button" OnClick="confirm_btn_Click" />
            </div>
        </div>
    </form>
    <!--Javascript-->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>