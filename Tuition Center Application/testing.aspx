<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="Tuition_Center_Application.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href=".././css/admin_student.css" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300" rel="stylesheet">

    <%-- Flow ADD Buttom --%>
	<div class="email" onclick="this.classList.add('expand')">
		<div class="from">
            <div class="from-contents">
                <div class="name">+</div>
            </div>
        </div>
		<div class="to">
            <div class="to-contents">
                <div class="top">
                    <div class="x-touch" onclick="document.querySelector('.email').classList.remove('expand');event.stopPropagation();">
                        <div class="x">
                            <div class="line1"></div>
                            <div class="line2"></div>
                        </div>
                    </div>
                </div>
                <div class="bottom">
					<div class="row row2">
                        <div class="avatar-upload">
                            <div class="avatar-edit">
                                <input type='file' id="imageUpload" class="file_input" accept=".png, .jpg, .jpeg"/>
                                <label for="imageUpload"></label>
                            </div>
                            <div class="avatar-preview">
                                <div id="imagePreview" class="image_preview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--Student Name Textbox--%>
                    <div class="row row2">
                        <h4 class="h4_text">Name</h4>
                        <div class="input-group input-group-icon">
                            <asp:TextBox ID="name_text" runat="server" CssClass="input" placeholder="Name"></asp:TextBox>
                            <div class="input-icon">
                                    <div class="tooltip">Delete</div>
                                    <span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
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
                                    <div class="tooltip">Delete</div>
                                    <span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <%--Email Textbox--%>
                    <div class="row row2">
                        <h4 class="h4_text">Email</h4>
                        <div class="input-group input-group-icon">
                            <asp:TextBox ID="email_text" runat="server" CssClass="input" placeholder="Email"></asp:TextBox>
                            <div class="input-icon">
                                <p>
                                    <div class="tooltip">Delete</div>
                                    <span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row row2">
                        <%--Password Textbox--%>
                        <div class="col-half col-half2">
                            <h4 class="h4_text">Password</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="password_text" runat="server" CssClass="input" placeholder="Password"></asp:TextBox>
                                <div class="input-icon"><p><span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span></p></div>
                            </div>
                        </div>
                        <%--Confirm Password Textbox--%>
                        <div class="col-half col-half2">
                            <h4 class="h4_text">Confirm Password</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="confirm_password_text" runat="server" CssClass="input" placeholder="Confirm Password"></asp:TextBox>
                                <div class="input-icon" onmouseover="icon_hover()">
                                    <div class="tooltip">Delete</div>
                                    <p>
                                        <span id="info_icon" class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--Address Textbox--%>
                    <div class="row row2">
                        <h4 class="h4_text">Address</h4>
                        <div class="input-group input-group-icon">
                            <asp:TextBox ID="address_text" runat="server" CssClass="input" placeholder="Address"></asp:TextBox>
                            <div class="input-icon"><p></p></div>
                        </div>
                    </div>
                    <div class="row row2">
                        <%-- Phone Number Textbox --%>
                        <div class="col-half col-half2">
                            <h4 class="h4_text">Phone Number</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="phone_text" runat="server" CssClass="input" placeholder="Phone Number"></asp:TextBox>
                                <div class="input-icon">
                                    <asp:LinkButton ID="delete_btn" runat="server" CssClass="info_icon delete" OnClick="delete_btn_Click">
                                        <div class="tooltip">Delete</div>
                                        <span><ion-icon name="trash-outline"></ion-icon></span>
                                    </asp:LinkButton>
                                    <%--<p>
                                        <div class="tooltip">Delete</div>
                                        <span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
                                    </p>--%>
                                </div>
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="info_icon delete" OnClick="delete_btn_Click">
                                    <div class="tooltip">Delete</div>
                                    <span><ion-icon name="trash-outline"></ion-icon></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <%-- DOB DDL --%>
                        <div class="col-half col-half2">
                            <h4 class="h4_text">Date of Birth</h4>
                
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
                                        <div class="tooltip">Delete</div>
                                        <span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
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
                            <asp:Button ID="clear_btn" runat="server" Text="Clear" CssClass="modal_btn" OnClick="clear_btn_Click"/>
                            <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="modal_btn" OnClick="submit_btn_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<%-- Flow ADD Buttom --%>

    <script>
        const input = document.getElementById("search-input");
        const searchBtn = document.getElementById("search-btn");

        const expand = () => {
            searchBtn.classList.toggle("close");
            input.classList.toggle("square");
        };

        searchBtn.addEventListener("click", expand);
    </script>

</asp:Content>
