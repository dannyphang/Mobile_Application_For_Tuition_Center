<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.report" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../../css/report.css" />

    <section class="container">
        <div class="btn_background">
            <a href="./report_level.aspx">
                <div class="button-67">Course</div>
            </a>
        </div>

        <div class="btn_background">
            <a href="./report_bill_year.aspx">
                <div class="button-67">Payment Bill</div>
            </a>
        </div>
    </section>

</asp:Content>
