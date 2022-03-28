<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/student.Master" AutoEventWireup="true" CodeBehind="payment_history.aspx.cs" Inherits="Tuition_Center_Application.common.User.payment_history" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/unicons.css" />
    <link rel="stylesheet" href="../../css/payment_history.css" />
    <link rel="stylesheet" href="../../css/receipt.css" />

    <asp:Repeater ID="history_repeater" runat="server" OnItemDataBound="history_repeater_ItemDataBound">
        <ItemTemplate>
            <div class="btn_background">
                <div class="button-67"><%# Eval("payMonth") %></div>
            </div>
            <asp:HiddenField ID="payID_hf" runat="server" Value='<%# Eval("paymentHistoryID") %>' />
                <div class="section-dropdown">
                    <table class="body-wrap">
                        <tbody>
                            <tr>
                                <td class="container" width="600">
                                    <div class="content">
                                        <table class="main" width="100%" cellpadding="0" cellspacing="0">
                                            <tbody>
                                                <tr>
                                                    <td class="content-wrap aligncenter">
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="content-block">
                                                                        <table class="invoice">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="invoice_label" runat="server" Text="Invoice #12345"></asp:Label>
                                                                                        <br>
                                                                                        <asp:Label ID="paydate_label" runat="server" ></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table class="invoice-items" cellpadding="0" cellspacing="0">
                                                                                            <tbody>
                                                                                                <asp:Repeater ID="course_desc_repeater" runat="server" OnItemDataBound="course_desc_repeater_ItemDataBound">
                                                                                                    <ItemTemplate>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <asp:Label ID="course_label" runat="server"></asp:Label>
                                                                                                                <asp:HiddenField ID="name_hf" runat="server" Value='<%# Eval("courseName") %>' />
                                                                                                                <asp:HiddenField ID="day_hf" runat="server" Value='<%# Eval("day") %>' />
                                                                                                                <asp:HiddenField ID="start_hf" runat="server" Value='<%# Eval("time_start") %>' />
                                                                                                                <asp:HiddenField ID="end_hf" runat="server" Value='<%# Eval("time_end") %>' />
                                                                                                            </td>
                                                                                                            <td class="alignright">
                                                                                                                <asp:Label ID="price_label" runat="server">RM <%# Eval("price") %></asp:Label></td>
                                                                                                        </tr>
                                                                                                    </ItemTemplate>
                                                                                                </asp:Repeater>

                                                                                                <tr class="total">
                                                                                                    <td class="alignright" width="80%">Total</td>
                                                                                                    <td class="alignright">
                                                                                                        <asp:Label ID="total_label" runat="server">RM <%# Eval("amount") %></asp:Label>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="content-block">
                                                                        <a class="receipt_btn">
                                                                            <asp:Button ID="receipt_btn" runat="server" Text="Get receipt" CssClass="receipt_btn" OnClick="receipt_btn_Click"/>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
