<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/guess.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="Tuition_Center_Application.common.order" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<link rel="stylesheet" href="../../css/order.css" />

    <section id="content">
        <!-- MAIN -->
		<main>
			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Courses</h3>
						<i class='bx bx-search' ></i>
						<%--<i class='bx bx-list-ul'></i>--%>
					</div>
					<table>
						<thead>
							<tr>
								<th>Name</th>
								<th>Level</th>
								<th>Day</th>
								<th>Time</th>
								<th>Price</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
                            <asp:Repeater ID="order_repeater" runat="server">
                                <ItemTemplate>
                                    <tr>
									    <td>
										    <img src="../../img/profile.png">
                                            <asp:Label ID="courseName_label" runat="server" Text=<%# Eval("courseName") %>></asp:Label>
                                            <asp:HiddenField ID="courseID_hd" runat="server" Value='<%# Eval("courseID") %>'/>
                                            <asp:HiddenField ID="courseName_hd" runat="server" Value='<%# Eval("courseName") %>'/>
									    </td>
									    <td>
                                            <asp:Label ID="level_label" runat="server" Text=<%# Eval("level") %>></asp:Label>
									    </td>
									    <td>
										    <%--<span class="status completed">Completed</span>--%>
                                            <asp:Label ID="day_label" runat="server" Text=<%# Eval("day") %>></asp:Label>
									    </td>
									    <td>
                                            <asp:Label ID="time_start_label" runat="server" Text=""><%# Eval("time_start") %> - <%# Eval("time_end") %></asp:Label>
									    </td>
									    <td>
                                            <asp:Label ID="price_label" runat="server" Text="RM "><%# Eval("price") %></asp:Label>
									    </td>
									    <td>
                                            <div class="wrapper">
                                                <asp:LinkButton ID="delete_btn" runat="server" CssClass="icon delete" OnClick="delete_btn_Click">
                                                    <div class="tooltip">Delete</div>
                                                    <span><ion-icon name="trash-outline"></ion-icon></span>
                                                </asp:LinkButton>
                                            </div>
									    </td>
								    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
						</tbody>
					</table>
				</div>
			</div>
		</main>
		<!-- MAIN -->

		<div class="payment">
			<h4>Payment Amount :<asp:Label ID="amount_text" runat="server" CssClass="amount" Text=""></asp:Label></h4> 
			<asp:LinkButton ID="next_btn" runat="server" CssClass="next_btn" OnClick="next_btn_Click">Next</asp:LinkButton>
		</div>
    </section>
</asp:Content>
