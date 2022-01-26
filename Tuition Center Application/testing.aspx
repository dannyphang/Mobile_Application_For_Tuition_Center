<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="Tuition_Center_Application.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href=".././css/testing.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

    <%-- MODAL BOX --%>
    <a href="#" class="btn-normal blue" id="move-thread"><i class="fa fa-share"></i>Move Thread</a>

    <div id="move-thread-modal" class="modal">
        <a href="#" id="move-thread-close" class="btn-normal red"><i class="fa fa-ban"></i><span>
            <ion-icon name="close-outline"></ion-icon>
        </span></a>
    </div>
    <%-- MODAL BOX --%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script>
        const input = document.getElementById("search-input");
        const searchBtn = document.getElementById("search-btn");

        const expand = () => {
            searchBtn.classList.toggle("close");
            input.classList.toggle("square");
        };

        searchBtn.addEventListener("click", expand);
    </script>
    <script>
        window.addEventListener('load',
            function load() {
                window.removeEventListener('load', load, false);
                document.body.classList.remove('preload');
            }
            , false);
        $(function () {
            $("#move-thread").click(function (event) {
                event.preventDefault();
                $("#modal-overlay").addClass("active");
                $("#move-thread-modal").addClass("active");
            });
            $("#move-thread-close").click(function (event) {
                event.preventDefault();
                $("#modal-overlay").removeClass("active");
                $("#move-thread-modal").removeClass("active");
            });
        });
        $(document).ready(function () {
            $(document.body).append("<div id='modal-overlay'></div>");
        });
    </script>
</asp:Content>
