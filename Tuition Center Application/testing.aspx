<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="Tuition_Center_Application.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href=".././css/testing.css" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"/>

    <div class="container">
        <div class="row">
            <%--<h1>jQuery Image Upload</h1>--%>
            <div class="avatar-upload">
                <div class="avatar-edit">
                    <asp:FileUpload ID="imageUpload" runat="server" CssClass="file_input"/>
                    <label for="imageUpload"></label>
                </div>
                <div class="avatar-preview">
                    <div class="image_preview" id="imagePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <h4>Course</h4>
            <%--Course Name Textbox--%>
            <div class="input-group input-group-icon">
                <asp:TextBox ID="name_text" runat="server" CssClass="input" placeholder="Course name"></asp:TextBox>
                <div class="input-icon"><i class="fa fa-user"></i></div>
            </div>
            <div class="col-half">
                <%--Level DDL--%>
                <div class="input-group input-group-icon">
                    <h4>Level</h4>
                    <div class="input-group">
                        <asp:DropDownList ID="level_ddl" runat="server"></asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-half">
                <%--Tutor ddl--%>
                <div class="input-group input-group-icon">
                    <h4>Tutor</h4>
                    <div class="input-group">
                        <asp:DropDownList ID="tutor_ddl" runat="server"></asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-half">
                <%--Language radio button--%>
                <div class="input-group input-group-icon">
                    <h4>Language</h4>
                    <div class="input-group">
                        <input id="bm" type="radio" name="language" value="bm" />
                        <label for="bm">Malay</label>
                        <input id="bc" type="radio" name="language" value="bc" />
                        <label for="bc">Chinese</label>
                        <input id="bi" type="radio" name="language" value="bi" />
                        <label for="bi">English</label>
                    </div>
                </div>
            </div>
            <div class="col-half">
                <%--Price Textbox--%>
                <div class="input-group input-group-icon">
                    <h4>Price</h4>
                    <div class="input-group">
                        <asp:TextBox ID="price_text" runat="server" CssClass="input input2" placeholder="0.00"></asp:TextBox>
                        <div class="input-icon input-icon2"><i>RM</i></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            
        </div>
    </div>

    <script>
        var input_file = document.getElementByClassName("file_input");

        function readURL(input_file) {
            if (input_file.files && input_file.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                    $('#imagePreview').hide();
                    $('#imagePreview').fadeIn(650);
                }
                reader.readAsDataURL(input_file.files[0]);
            }
        }
        $("#imageUpload").change(function () {
            readURL(this);
        });

        var label = document.getElementById("label_text");
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</asp:Content>
