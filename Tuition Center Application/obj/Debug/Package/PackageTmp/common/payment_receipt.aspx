<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment_receipt.aspx.cs" Inherits="Tuition_Center_Application.common.payment_receipt" Async="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link rel="stylesheet" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/unicons.css" />
    <link rel="stylesheet" href="../css/payment_history.css" />
    <link rel="stylesheet" href="../css/receipt.css" />
</head>
<body>
    <form id="form1" runat="server">
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
                                                                                Invoice #[historyID]
                                                                                <br/>
                                                                                [payDate]
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
                                                                                                RM [total]
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
    </form>
</body>
</html>
