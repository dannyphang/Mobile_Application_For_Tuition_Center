<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="report_course.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.report_course" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../../css/admin_course.css" />

    <section id="content">
        <!-- MAIN -->
        <main>
            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>
                            <asp:Label ID="title_label" runat="server" Text="Label"></asp:Label>
                        </h3>
                        <i class='bx bx-search'></i>
                    </div>
                    <table id="display_table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Level</th>
                                <th>Day</th>
                                <th>Language</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="course_repeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <img src="../../img/profile.png">
                                            <asp:Label ID="courseName_label" runat="server" Text='<%# Eval("courseName") %>'></asp:Label>
                                            <asp:HiddenField ID="courseID_hd" runat="server" Value='<%# Eval("courseID") %>' />
                                            <asp:HiddenField ID="courseName_hd" runat="server" Value='<%# Eval("courseName") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="level_label" runat="server"><%# Eval("time_start") %> - <%# Eval("time_end") %></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="price_label" runat="server"><%# Eval("day") %></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="language_label" runat="server" Text='<%# Eval("language") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <div class="wrapper">
                                                <asp:LinkButton ID="next_btn" runat="server" CssClass="icon more" OnClick="next_btn_Click">
                                                <div class="tooltip">More</div>
                                                <span><ion-icon name="information-circle-outline"></ion-icon></span>
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
    </section>
</asp:Content>
