<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.course" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<link rel="stylesheet" href="../../css/admin_course.css" />
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

    <!-- CONTENT -->
	<section id="content">
		<!-- MAIN -->
		<main>
			<ul class="box-info">
				<li>
					<i class='bx bxs-calendar-check' ></i>
					<span class="text">
						<h3>1020</h3>
						<p>New Order</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-group' ></i>
					<span class="text">
						<h3>2834</h3>
						<p>Visitors</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-dollar-circle' ></i>
					<span class="text">
						<h3>$2543</h3>
						<p>Total Sales</p>
					</span>
				</li>
			</ul>

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
								<th>Price</th>
								<th>Language</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%foreach (var cr in course_var) {%>
								<tr>
									<td>
										<img src="../../img/profile.png">
										<p><%= cr.courseName %></p>
									</td>
									<td>
										<%= cr.level %>
									</td>
									<td>
										<%--<span class="status completed">Completed</span>--%>
										RM <%= cr.price %>
									</td>
									<td>
										<%= cr.language %>
									</td>
									<td>
										<%--TODO: button: edit, delete--%>
									</td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->

	<%--<script src="../../js/side_nav.js"></script>--%>
</asp:Content>
