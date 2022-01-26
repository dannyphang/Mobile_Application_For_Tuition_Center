 <%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/staff.Master" AutoEventWireup="true" CodeBehind="timetable.aspx.cs" Inherits="Tuition_Center_Application.common.Staff.timetable" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>document.getElementsByTagName("html")[0].className += " js";</script>
    <link rel="stylesheet" href="../../css/timetable.css">
    <div class="page_space">
        <div class="cd-schedule cd-schedule--loading margin-top-lg margin-bottom-lg js-cd-schedule">
            <div class="cd-schedule__timeline">
                <ul>
                    <% foreach (var time in time_list) { %>
                        <li><span><%= time %></span></li>
                    <% } %>
                </ul>
            </div> <!-- .cd-schedule__timeline -->
  
            <div class="cd-schedule__events">
                <ul>
                    <%--Monday--%>
                    <li class="cd-schedule__group">
                        <div class="cd-schedule__top-info">
                            <span>Monday</span>
                        </div>
  
                        <ul>
                            <%--<% foreach (var tt in datetime_mon_list) { %>
                                <li class="cd-schedule__event">
                                    <a data-start = <%= tt.time_start %> data-end = <%= tt.time_end %> data-content = "" data-event="event-1" href="#">
                                        <em class="cd-schedule__name"><%= tt.datetimeID %></em>
                                    </a>
                                </li>
                            <% } %>--%>
                            <asp:Repeater ID="monday_repeater" runat="server">
                                <ItemTemplate>
                                    <li class="cd-schedule__event">
                                        <a data-start = <%# Eval("time_start") %> data-end = <%# Eval("time_end") %> data-content = "" data-event="event-1" href="#">
                                            <em class="cd-schedule__name"><%# Eval("courseName") %></em>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </li>
  
                    <%--Tuesday--%>
                    <li class="cd-schedule__group">
                        <div class="cd-schedule__top-info"><span>Tuesday</span></div>
  
                        <ul>
                            <asp:Repeater ID="tuesday_repeater" runat="server">
                                <ItemTemplate>
                                    <li class="cd-schedule__event">
                                        <a data-start = <%# Eval("time_start") %> data-end = <%# Eval("time_end") %> data-content = "" data-event="event-1" href="#">
                                            <em class="cd-schedule__name"><%# Eval("courseName") %></em>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </li>
  
                    <%--Wednesday--%>
                    <li class="cd-schedule__group">
                        <div class="cd-schedule__top-info"><span>Wednesday</span></div>
  
                        <ul>
                            <asp:Repeater ID="wednesday_repeater" runat="server">
                                <ItemTemplate>
                                    <li class="cd-schedule__event">
                                        <a data-start = <%# Eval("time_start") %> data-end = <%# Eval("time_end") %> data-content = "" data-event="event-1" href="#">
                                            <em class="cd-schedule__name"><%# Eval("courseName") %></em>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </li>
  
                    <%--Thursday--%>
                    <li class="cd-schedule__group">
                        <div class="cd-schedule__top-info"><span>Thursday</span></div>
  
                        <ul>
                            <asp:Repeater ID="thursday_repeater" runat="server">
                                <ItemTemplate>
                                    <li class="cd-schedule__event">
                                        <a data-start = <%# Eval("time_start") %> data-end = <%# Eval("time_end") %> data-content = "" data-event="event-1" href="#">
                                            <em class="cd-schedule__name"><%# Eval("courseName") %></em>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </li>
  
                    <%--Friday--%>
                    <li class="cd-schedule__group">
                        <div class="cd-schedule__top-info"><span>Friday</span></div>
  
                        <ul>
                            <asp:Repeater ID="friday_repeater" runat="server">
                                <ItemTemplate>
                                    <li class="cd-schedule__event">
                                        <a data-start = <%# Eval("time_start") %> data-end = <%# Eval("time_end") %> data-content = "" data-event="event-1" href="#">
                                            <em class="cd-schedule__name"><%# Eval("courseName") %></em>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </li>

                    <%--Saturday--%>
                    <li class="cd-schedule__group">
                        <div class="cd-schedule__top-info"><span>Saturday</span></div>
  
                        <ul>
                            <asp:Repeater ID="saturday_repeater" runat="server">
                                <ItemTemplate>
                                    <li class="cd-schedule__event">
                                        <a data-start = <%# Eval("time_start") %> data-end = <%# Eval("time_end") %> data-content = "" data-event="event-1" href="#">
                                            <em class="cd-schedule__name"><%# Eval("courseName") %></em>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </li>

                    <%--Sunday--%>
                    <li class="cd-schedule__group">
                        <div class="cd-schedule__top-info"><span>Sunday</span></div>
  
                        <ul>
                            <asp:Repeater ID="sunday_repeater" runat="server">
                                <ItemTemplate>
                                    <li class="cd-schedule__event">
                                        <a data-start = <%# Eval("time_start") %> data-end = <%# Eval("time_end") %> data-content = "" data-event="event-1" href="#">
                                            <em class="cd-schedule__name"><%# Eval("courseName") %></em>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </li>
                </ul>
            </div>
  
            <div class="cd-schedule-modal">
                <header class="cd-schedule-modal__header">
                    <div class="cd-schedule-modal__content">
                        <span class="cd-schedule-modal__date"></span>
                        <h3 class="cd-schedule-modal__name"></h3>
                    </div>
  
                    <div class="cd-schedule-modal__header-bg"></div>
                </header>
  
                <div class="cd-schedule-modal__body">
                    <div class="cd-schedule-modal__event-info"></div>
                    <div class="cd-schedule-modal__body-bg"></div>
                </div>
  
                <a href="#0" class="cd-schedule-modal__close text-replace">Close</a>
            </div>
  
            <div class="cd-schedule__cover-layer"></div>
        </div> <!-- .cd-schedule -->
    </div>
    

    <%--JavaScript--%>
    <script src="../../js/timetable_util.js"></script> <!-- util functions included in the CodyHouse framework -->
    <script src="../../js/timetable.js"></script>
</asp:Content>