<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/staff.Master" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="Tuition_Center_Application.common.Staff.student" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://designmodo.com/demo/calendarjquerycss3/css/calendar.css" media="screen">
    <link rel="stylesheet" href="../../css/calander.css" />
    <meta name="robots" content="noindex,follow" />
    <link rel="stylesheet" href="../../css/admin_student.css" />

    <section id="content">
        <!-- MAIN -->
        <main>
            <ul class="box-info">
                <asp:LinkButton ID="all_btn" runat="server" CssClass="course_btn" OnClick="all_btn_Click">
                    <li>
                        <i class='bx bxs-calendar-check'></i>
                        <span class="text">
                            <h3>
                                All
                            </h3>
                        </span>
                    </li>
                </asp:LinkButton>
                <asp:Repeater ID="course_repeater" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton ID="course_btn" runat="server" OnClick="course_btn_Click" CssClass="course_btn">
                            <asp:HiddenField ID="courseID_hf" runat="server" Value='<%# Eval("courseID") %>' />
                            <li>
                                <i class='bx bxs-calendar-check'></i>
                                <span class="text">
                                    <h3>
                                        <asp:Label ID="name_label" runat="server" Text='<%# Eval("courseName") %>'></asp:Label>
                                    </h3>
                                    <p>
                                        <asp:Label ID="time_label" runat="server"><%# Eval("time_start") %> - <%# Eval("time_end") %></asp:Label>
                                    </p>
                                </span>
                            </li>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>

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
                                                <asp:LinkButton ID="more_btn" runat="server" CssClass="icon more" OnClick="more_btn_Click" data-no-blobity>
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
        <!-- MAIN -->
    </section>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://designmodo.com/demo/calendarjquerycss3/js/jquery-ui-datepicker.min.js"></script>
    <<script src="../../js/admin_student.js"></script>
    <script src="../../js/calendar.js"></script>
</asp:Content>
