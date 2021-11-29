<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/guess.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="Tuition_Center_Application.common.course" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--css--%>
    <link rel="stylesheet" href=".././css/course.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <%--content--%>
    <section>
        <%--<div class="category_section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <h6>About</h6>
                        <p class="text-justify">
                            The Authentic Education Center (AEC) – a well-established education learning center that has started its very first center in October 2017 in Penang.
                        </p>
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <h6>TALK TO US</h6>
                        <ul class="footer-links">
                            <li><a href="#"><ion-icon name="location-outline" class="talk-icon"></ion-icon>55-3, Jalan Pisang Embun, Kampung Melayu, 11500 Ayer Itam, Pulau Pinang</a></li>
                            <li><a href="#"><ion-icon name="call-outline" class="talk-icon"></ion-icon>+6016-507 9008</a></li>
                            <li><a href="#"><ion-icon name="mail-outline" class="talk-icon"></ion-icon>info@authenticeducationcenter.com</a></li>
                        </ul>
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <h6>OPERATING HOURS</h6>
                        <ul class="footer-links">
                            <li><a href="http://scanfcode.com/about/">About Us</a></li>
                            <li><a href="http://scanfcode.com/contact/">Contact Us</a></li>
                            <li><a href="http://scanfcode.com/contribute-at-scanfcode/">Contribute</a></li>
                            <li><a href="http://scanfcode.com/privacy-policy/">Privacy Policy</a></li>
                            <li><a href="http://scanfcode.com/sitemap/">Sitemap</a></li>
                        </ul>
                    </div>
                </div>
                <hr>
            </div>
        </div>--%>
        <div class="course_section">
            <%foreach (var cr in course_var) {%>
                <div>
                    <!-- flip-card-container -->
                    <div class="flip-card-container" style="--hue: 220">
                        <div class="flip-card">
                            <div class="card-front">
                                <figure>
                                    <div class="img-bg"></div>
                                    <img src="../img/profile.png" alt="Brohm Lake">
                                    <%--<figcaption>
                                        <p id="figcaption"><%= cr.courseName %></p>
                                    </figcaption>--%>
                                </figure>

                                <ul class="course_ul">
                                    <li><%= cr.courseID %></li>
                                    <li><%= cr.courseName %></li>
                                    <li><%= cr.level %></li>
                                    <li>RM <%= cr.price %></li>
                                </ul>
                            </div>

                            <div class="card-back">
                                <figure>
                                    <div class="img-bg"></div>
                                    <img src="../img/profile.png" alt="Brohm Lake">
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