<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="report_bill_month.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.report_bill_month" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../../css/report.css" />

    <section class="container">
        <asp:Repeater ID="month_repeater" runat="server">
            <ItemTemplate>
                <div class="btn_background">
                    <asp:LinkButton ID="month_btn" runat="server" CssClass="button-67" OnClick="month_btn_Click">
                        <asp:Label ID="month_label" runat="server" Text='<%# Eval("month") %>'></asp:Label>
                    </asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </section>
</asp:Content>