<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/guess.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="Tuition_Center_Application.common.course" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--css--%>
    <link rel="stylesheet" href=".././css/course.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%--content--%>
    <section>
        <div class="category_section">

        </div>
        <div class="course_section">
            <%foreach (var cr in course_var) {%>
                <div>
                    <!-- flip-card-container -->
                    <div class="flip-card-container" style="--hue: 220">
                        <div class="flip-card">
                            <div class="card-front">
                                <figure>
                                    <div class="img-bg"></div>
                                    <img src=".." alt="Brohm Lake">
                                    <%--<figcaption>
                                        <p id="figcaption"><%= cr.courseName %></p>
                                    </figcaption>--%>
                                </figure>

                                <ul class="course_ul">
                                    <li><%= cr.courseName %></li>
                                    <li><%= cr.level %></li>
                                    <li>RM <%= cr.price %></li>
                                </ul>
                            </div>

                            <div class="card-back">
                                <figure>
                                    <div class="img-bg"></div>
                                    <img src=".." alt="Brohm Lake">
                                </figure>

                                <asp:Button ID="view_btn" runat="server" Text="View" CssClass="book_btn" OnClick="view_btn_Click"/>

                                <div class="design-container">
                                    <span class="design design--1"></span>
                                    <span class="design design--2"></span>
                                    <span class="design design--3"></span>
                                    <span class="design design--4"></span>
                                    <span class="design design--5"></span>
                                    <span class="design design--6"></span>
                                    <span class="design design--7"></span>
                                    <span class="design design--8"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /flip-card-container -->
                </div>
            <%} %>
        </div>
    </section>
</asp:Content>