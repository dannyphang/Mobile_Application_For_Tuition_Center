<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testing3.aspx.cs" Inherits="Tuition_Center_Application.testing3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href=".././css/testing3.css" type="text/css" />
    <script src=".././js/testing3.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700&display=swap" rel="stylesheet" />
</head>
<body>
    <form id="form_1">
        <input id="Submit1" type="submit" value="Checkout" />
    </form>

    <%-- Stripe --%>
    <script src="https://js.stripe.com/v3/"></script>
    <script type="module" src="./js/stripe.js"></script>
</body>
</html>
