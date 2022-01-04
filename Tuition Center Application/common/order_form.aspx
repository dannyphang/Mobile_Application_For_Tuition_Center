<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/guess.Master" AutoEventWireup="true" CodeBehind="order_form.aspx.cs" Inherits="Tuition_Center_Application.common.order_form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<link rel="stylesheet" href="../../css/order_form.css" />

    <div class="reg_form_content">
        <div class="row"> 
            <%-- Avatar preview & upload --%>
            <%--<div class="avatar-upload">
                <div class="avatar-edit">
                    <asp:FileUpload ID="imageUpload" runat="server" CssClass="file_input"/>
                    <input type='file' id="imageUpload" class="file_input" accept=".png, .jpg, .jpeg" />
                    <label for="imageUpload"></label>
                </div>
                <div class="avatar-preview">
                    <div class="image_preview" id="imagePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                    </div>
                </div>
            </div>--%>
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
        <div class="row">
            <h4>Course</h4>
            <%--Course Name Textbox--%>
            <div class="input-group input-group-icon">
                <asp:TextBox ID="name_text" runat="server" CssClass="input" placeholder="Course name"></asp:TextBox>
                <div class="input-icon"><p></p></div>
            </div>
            <div class="col-half">
                <%--Level DDL--%>
                <div class="input-group input-group-icon">
                    <h4>Level</h4>
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
            </div>
            <div class="col-half">
                <%--Tutor ddl--%>
                <div class="input-group input-group-icon">
                    <h4>Tutor</h4>
                    <div class="input-group">
                        <asp:DropDownList ID="tutor_ddl" runat="server">
                            <asp:ListItem>Tutor</asp:ListItem>
                        </asp:DropDownList>
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
                            <asp:DropDownList ID="language_ddl" runat="server">
                            <asp:ListItem>Malay</asp:ListItem>
                            <asp:ListItem>Chinese</asp:ListItem>
                            <asp:ListItem>English</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-half">
                <%--Price Textbox--%>
                <div class="input-group input-group-icon">
                    <h4>Price</h4>
                    <div class="input-group">
                        <asp:TextBox ID="price_text" runat="server" CssClass="input" placeholder="0.00"></asp:TextBox>
                        <div class="input-icon input-icon2"><p>RM</p></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-half">
                <%--Day DDL--%>
                <div class="input-group input-group-icon">
                    <h4>Day</h4>
                    <div class="input-group">
                        <asp:DropDownList ID="day_ddl" runat="server">
                            <asp:ListItem>Monday</asp:ListItem>
                            <asp:ListItem>Tuesday</asp:ListItem>
                            <asp:ListItem>Wednesday</asp:ListItem>
                            <asp:ListItem>Thursday</asp:ListItem>
                            <asp:ListItem>Friday</asp:ListItem>
                            <asp:ListItem>Saturday</asp:ListItem>
                            <asp:ListItem>Sunday</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-half">
                <%--Duration DDL--%>
                <div class="input-group input-group-icon">
                    <h4>Duration</h4>
                    <div class="input-group">
                        <asp:DropDownList ID="duration_ddl" runat="server">
                            <asp:ListItem>1 hour</asp:ListItem>
                            <asp:ListItem>1.5 hours</asp:ListItem>
                            <asp:ListItem>2 hours</asp:ListItem>
                            <asp:ListItem>2.5 hours</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <h4>Time</h4>
        </div>
        <div class="row">
            <div class="col-half">
                <%--Time Hour Text--%>
                <div class="input-group input-group-icon">
                    <div class="input-group">
                        <asp:TextBox ID="hour_text" runat="server" CssClass="input" placeholder="00" MaxLength="2"></asp:TextBox>
                        <div class="input-icon"><p>HH</p></div>
                    </div>
                </div>
            </div>
            <div class="col-half">
                <%--Time Hour Text--%>
                <div class="input-group input-group-icon">
                    <div class="input-group">
                        <asp:TextBox ID="min_text" runat="server" CssClass="input" placeholder="00" MaxLength="2"></asp:TextBox>
                        <div class="input-icon"><p>MM</p></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-half">
                <div class="input-group"></div>
            </div>
            <div class="col-half">
                <%--<asp:Button ID="clear_btn" runat="server" Text="Clear" CssClass="modal_btn" OnClick="clear_btn_Click"/>
                <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="modal_btn" OnClick="submit_btn_Click"/>--%>
            </div>
        </div>
    </div>
</asp:Content>