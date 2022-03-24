<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="report_bill_year.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.report_bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../../css/report.css" />

    <section class="container">
        <asp:Repeater ID="year_repeater" runat="server">
            <ItemTemplate>
                <div class="btn_background">
                    <asp:LinkButton ID="year_btn" runat="server" CssClass="button-67" OnClick="year_btn_Click">
                        <asp:Label ID="year_label" runat="server" Text='<%# Eval("year") %>'></asp:Label>
                    </asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </section>
</asp:Content>
