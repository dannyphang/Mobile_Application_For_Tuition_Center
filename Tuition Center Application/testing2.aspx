<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="testing2.aspx.cs" Inherits="Tuition_Center_Application.testing2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href=".././css/calander.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://designmodo.com/demo/calendarjquerycss3/css/calendar.css" media="screen">
    <meta name="robots" content="noindex,follow" />

    <div class="calendar"></div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://designmodo.com/demo/calendarjquerycss3/js/jquery-ui-datepicker.min.js"></script>
    <script>
        $('#calendar').datepicker({
            inline: true,
            firstDay: 1,
            showOtherMonths: true,
            dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
        });
    </script>
</asp:Content>
