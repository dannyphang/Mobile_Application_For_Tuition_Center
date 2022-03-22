<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/staff.Master" AutoEventWireup="true" CodeBehind="classroom_main.aspx.cs" Inherits="Tuition_Center_Application.common.Staff.classroom_main" Async="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../../css/classroom_main.css" type="text/css" />

    <div class="container">
        <div class="page-contain">
            <asp:Repeater ID="classroom_repeater" runat="server">
                <ItemTemplate>
                    <div class="data-card">
                        <h3>
                            <asp:Label ID="course_name_label" runat="server" Text='<%# Eval("courseName") %>'></asp:Label>
                        </h3>
                        <h4>
                            <asp:Label ID="time_label" runat="server" Text=""><%# Eval("day") %> <br /><%# Eval("time_start") %> - <%# Eval("time_end") %></asp:Label>
                        </h4>
                        <%--<p>Aenean lacinia bibendum nulla sed consectetur.</p>--%>
                        <span class="link-text">
                            <a>
                                <asp:LinkButton ID="classroom_btn" runat="server" OnClick="classroom_btn_Click">
                                    <svg width="25" height="16" viewBox="0 0 25 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M17.8631 0.929124L24.2271 7.29308C24.6176 7.68361 24.6176 8.31677 24.2271 8.7073L17.8631 15.0713C17.4726 15.4618 16.8394 15.4618 16.4489 15.0713C16.0584 14.6807 16.0584 14.0476 16.4489 13.657L21.1058 9.00019H0.47998V7.00019H21.1058L16.4489 2.34334C16.0584 1.95281 16.0584 1.31965 16.4489 0.929124C16.8394 0.538599 17.4726 0.538599 17.8631 0.929124Z" fill="#753BBD" />
                                    </svg>
                                </asp:LinkButton>
                                <asp:HiddenField ID="courseID_hf" runat="server" Value='<%# Eval("courseID") %>'/>
                            </a>
                        </span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>

</asp:Content>
