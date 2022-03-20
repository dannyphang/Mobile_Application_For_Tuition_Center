<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/student.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="Tuition_Center_Application.common.User.course" EnableEventValidation="false" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--css--%>
    <link rel="stylesheet" href="../../css/course.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <%--content--%>
    <section>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="course_section">
                    <asp:Repeater ID="course_repeater" runat="server">
                        <ItemTemplate>
                            <div>
                                <!-- flip-card-container -->
                                <div class="flip-card-container" style="--hue: 220">
                                    <div class="flip-card">
                                        <div class="card-front">
                                            <figure>
                                                <div class="img-bg"></div>
                                                <img src="https://daisy.org/wp-content/uploads/2018/11/book-dark-enlightenment-1029141-1024x683.jpg" alt="Brohm Lake">
                                            </figure>
                                            <asp:HiddenField ID="courseID_hf" runat="server" Value='<%# Eval("courseID") %>' />
                                            <ul class="course_ul">
                                                <%--<li>
                                                    <asp:Label ID="courseID_label" runat="server" Text=<%# Eval("courseID") %>></asp:Label>
                                                </li>--%>
                                                <li><%# Eval("courseName") %></li>
                                                <li><%# Eval("level") %></li>
                                                <li>RM <%# Eval("price") %></li>
                                                <li><%# Eval("time_start") %> - <%# Eval("time_end") %></li>
                                            </ul>
                                        </div>

                                        <div class="card-back">
                                            <figure>
                                                <div class="img-bg"></div>
                                                <img src="../../img/profile.png" alt="Brohm Lake">
                                            </figure>

                                            <asp:Button ID="view_btn" runat="server" Text="Add to Cart" CssClass="book_btn" OnClick="view_btn_Click" />
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
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <asp:HiddenField ID="added_course_list_hf" runat="server" />
                <div class="next_container">
                    <div class="next_btn_container">
                        <asp:LinkButton ID="next_btn" runat="server" CssClass="notification" OnClick="next_btn_Click" PostBackUrl="~/common/User/order.aspx">
                            <span>
                                <ion-icon name="chevron-forward-outline"></ion-icon>
                            </span>
                            <%--<asp:Label ID="notification_label" runat="server" Text="0" CssClass="badge"></asp:Label>--%>
                        </asp:LinkButton>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>
    <script>
        
    </script>
</asp:Content>