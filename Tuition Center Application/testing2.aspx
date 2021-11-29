<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/guess.Master" AutoEventWireup="true" CodeBehind="testing2.aspx.cs" Inherits="Tuition_Center_Application.testing2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href=".././css/testing.css" type="text/css" />

    <div class="email" onclick="this.classList.add('expand')">
    <div class="from">
      <div class="from-contents">
        <div class="name">+</div>
      </div>
    </div>
    <div class="to">
      <div class="to-contents">
        <div class="top">
          <div class="name-large">+</div>
          <div class="x-touch" onclick="document.querySelector('.email').classList.remove('expand');event.stopPropagation();">
            <div class="x">
              <div class="line1"></div>
              <div class="line2"></div>
            </div>
          </div>
        </div>
        <div class="bottom">
          
        </div>
      </div>
    </div>
  </div>    

</asp:Content>
