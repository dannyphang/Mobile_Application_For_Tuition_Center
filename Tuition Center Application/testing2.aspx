<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="testing2.aspx.cs" Inherits="Tuition_Center_Application.testing2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href=".././css/testing2.css" type="text/css" />
    <link rel="stylesheet" href=".././css/testing.css" type="text/css" />


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
                                <asp:TextBox ID="price_text" runat="server" CssClass="input" placeholder="0.00"></asp:TextBox>
                                <div class="input-icon input-icon2"><i>RM</i></div>
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
                                <asp:DropDownList ID="day_ddl" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="col-half">
                        <%--Duration DDL--%>
                        <div class="input-group input-group-icon">
                            <h4>Duration</h4>
                            <div class="input-group">
                                <asp:DropDownList ID="duration_ddl" runat="server"></asp:DropDownList>
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
                                <asp:TextBox ID="hour_text" runat="server" CssClass="input" placeholder="00"></asp:TextBox>
                                <div class="input-icon"><i>HH</i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-half">
                        <%--Time Hour Text--%>
                        <div class="input-group input-group-icon">
                            <div class="input-group">
                                <asp:TextBox ID="min_text" runat="server" CssClass="input" placeholder="00"></asp:TextBox>
                                <div class="input-icon"><i>MM</i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>    

</asp:Content>
