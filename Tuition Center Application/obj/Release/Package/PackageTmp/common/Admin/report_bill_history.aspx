<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="report_bill_history.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.report_bill_history" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../../css/admin_student.css" />

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
                                                <asp:LinkButton ID="next_btn" runat="server" CssClass="icon more" OnClick="next_btn_Click">
                                                    <div class="tooltip">Next</div>
                                                    <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
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
    </section>
</asp:Content>