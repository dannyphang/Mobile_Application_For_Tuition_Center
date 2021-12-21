<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.student" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<link rel="stylesheet" href="../../css/admin_student.css" />

    <%-- CONTENT --%>
    <section id="content">
		<%-- CATEGORY --%>
		<section id="cat_container">
			<asp:DropDownList ID="educationLV_ddl" runat="server" CssClass="ddl_btn" AppendDataBoundItems="True">
				<asp:ListItem>Standard 1</asp:ListItem>
				<asp:ListItem>Standard 2</asp:ListItem>
				<asp:ListItem>Standard 3</asp:ListItem>
				<asp:ListItem>Standard 4</asp:ListItem>
				<asp:ListItem>Standard 5</asp:ListItem>
				<asp:ListItem>Standard 6</asp:ListItem>
				<asp:ListItem>Form 1</asp:ListItem>
				<asp:ListItem>Form 2</asp:ListItem>
				<asp:ListItem>Form 3</asp:ListItem>
				<asp:ListItem>Form 4</asp:ListItem>
				<asp:ListItem>Form 5</asp:ListItem>
			</asp:DropDownList>
			<asp:DropDownList ID="sort_ddl" runat="server" CssClass="ddl_btn">
				<asp:ListItem>↑ Alphabetical</asp:ListItem>
				<asp:ListItem>↓ Alphabetical</asp:ListItem>
				<asp:ListItem>↑ Level</asp:ListItem>
				<asp:ListItem>↓ Level</asp:ListItem>
			</asp:DropDownList>
			<asp:TextBox ID="search_input" runat="server" CssClass="search_box" placeholder="Student name..."></asp:TextBox>
			<asp:LinkButton ID="search_text_btn" runat="server" CssClass="search_box_btn">
				<span><ion-icon name="search-circle-outline" class="search_box_icon"></ion-icon></span>
			</asp:LinkButton>
		</section>
		<%-- CATEGORY --%>
		<!-- MAIN -->
		<main>
			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Students</h3>
						<i class='bx bx-search' ></i>
						<%--<i class='bx bx-list-ul'></i>--%>
					</div>
					<table>
						<thead>
							<tr>
								<th>Name</th>
								<th>Education Level</th>
								<th>IC/No</th>
								<th>Phone Number</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
                            <asp:Repeater ID="student_repeater" runat="server">
                                <ItemTemplate>
                                    <asp:HiddenField ID="studentID_hd" runat="server" Value='<%# Eval("studentID") %>'/>
                                    <asp:HiddenField ID="name_hd" runat="server" Value='<%# Eval("name") %>'/>
                                    <tr>
									    <td class="name_column">
										    <img src="../../img/profile.png">
                                            <asp:Label ID="name_label" runat="server" Text=<%# Eval("name") %>></asp:Label>
									    </td>
									    <td>
                                            <asp:Label ID="educationLV_label" runat="server" CssClass="status level" Text=<%# Eval("educationLV") %>></asp:Label>
									    </td>
									    <td>
                                            <asp:Label ID="IC_label" runat="server" Text=<%# Eval("IC") %>></asp:Label>
									    </td>
									    <td>
                                            <asp:Label ID="phoneNo_label" runat="server" Text=<%# Eval("phoneNo") %>></asp:Label>
									    </td>
									    <td>
                                            <div class="wrapper">
                                                <asp:LinkButton ID="more_btn" runat="server" CssClass="icon more" OnClick="more_btn_Click" OnClientClick="detail_btn_func()">
                                                    <div class="tooltip">More</div>
                                                    <span><ion-icon name="information-circle-outline"></ion-icon></span>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="edit_btn" runat="server" CssClass="icon edit" OnClick="edit_btn_Click" OnClientClick="detail_btn_func()">
                                                    <div class="tooltip">Edit</div>
                                                    <span><ion-icon name="create-outline"></ion-icon></span>
                                                </asp:LinkButton>
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


    </section>
    <%-- CONTENT --%>

	<<script src="../../js/course_student.js"></script>
	<script>
        const input = document.getElementById("search-input");
        const searchBtn = document.getElementById("search-btn");

        const expand = () => {
            searchBtn.classList.toggle("close");
            input.classList.toggle("square");
        };

        searchBtn.addEventListener("click", expand);
    </script>
</asp:Content>