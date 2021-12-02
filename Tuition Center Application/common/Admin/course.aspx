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

		<%--Flow Button--%>
        <div class="email" onclick="this.classList.add('expand')">
            <div class="from">
                <div class="from-contents">
                    <div class="name">+</div>
                </div>
            </div>
            <div class="to">
                <div class="to-contents">
                    <div class="top">
                        <div class="x-touch" onclick="document.querySelector('.email').classList.remove('expand');event.stopPropagation();">
                            <div class="x">
                                <div class="line1"></div>
                                <div class="line2"></div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom">
                        <div class="row"> 
                            <div class="avatar-upload">
                                <div class="avatar-edit">
                                    <asp:FileUpload ID="imageUpload" runat="server" CssClass="file_input"/>
                                    <label for="imageUpload"></label>
                                </div>
                                <div class="avatar-preview">
                                    <div class="image_preview" id="imagePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <h4>Course</h4>
                            <%--Course Name Textbox--%>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="name_text" runat="server" CssClass="input" placeholder="Course name"></asp:TextBox>
                                <div class="input-icon"><p></p></div>
                            </div>
                            <div class="col-half">
                                <%--Level DDL--%>
                                <div class="input-group input-group-icon">
                                    <h4>Level</h4>
                                    <div class="input-group">
                                        <select id="Select1">
                                            <% foreach (var lv in level_list){ %>
                                                <option><%= lv%></option>
                                            <% } %> 
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-half">
                                <%--Tutor ddl--%>
                                <div class="input-group input-group-icon">
                                    <h4>Tutor</h4>
                                    <div class="input-group">
                                        <asp:DropDownList ID="tutor_ddl" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-half">
                                <%--Language radio button--%>
                                <div class="input-group input-group-icon">
                                    <h4>Language</h4>
                                    <div class="input-group">
                                        <input id="bm" type="radio" name="language" value="bm" />
                                        <label for="bm">Malay</label>
                                        <input id="bc" type="radio" name="language" value="bc" />
                                        <label for="bc">Chinese</label>
                                        <input id="bi" type="radio" name="language" value="bi" />
                                        <label for="bi">English</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-half">
                                <%--Price Textbox--%>
                                <div class="input-group input-group-icon">
                                    <h4>Price</h4>
                                    <div class="input-group">
                                        <asp:TextBox ID="price_text" runat="server" CssClass="input" placeholder="0.00"></asp:TextBox>
                                        <div class="input-icon input-icon2"><p>RM</p></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-half">
                                <%--Day DDL--%>
                                <div class="input-group input-group-icon">
                                    <h4>Day</h4>
                                    <div class="input-group">
                                        <asp:DropDownList ID="day_ddl" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-half">
                                <%--Duration DDL--%>
                                <div class="input-group input-group-icon">
                                    <h4>Duration</h4>
                                    <div class="input-group">
                                        <asp:DropDownList ID="duration_ddl" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <h4>Time</h4>
                        </div>
                        <div class="row">
                            <div class="col-half">
                                <%--Time Hour Text--%>
                                <div class="input-group input-group-icon">
                                    <div class="input-group">
                                        <asp:TextBox ID="hour_text" runat="server" CssClass="input" placeholder="00" MaxLength="2"></asp:TextBox>
                                        <div class="input-icon"><p>HH</p></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-half">
                                <%--Time Hour Text--%>
                                <div class="input-group input-group-icon">
                                    <div class="input-group">
                                        <asp:TextBox ID="min_text" runat="server" CssClass="input" placeholder="00" MaxLength="2"></asp:TextBox>
                                        <div class="input-icon"><p>MM</p></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <%--<asp:Button ID="clear_btn" runat="server" Text="Clear" CssClass="modal_btn"/>
                            <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="modal_btn"/>--%>
                            <div class="col-half">
                                <div class="input-group">
                                    <label id="language_value"></label>
                                </div>
                            </div>
                            <div class="col-half">
                                <asp:Button ID="clear_btn" runat="server" Text="Clear" CssClass="modal_btn" OnClick="clear_btn_Click"/>
                                <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="modal_btn" OnClick="submit_btn_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
		<%--Flow Button--%>
	</section>
	<!-- CONTENT -->

	<%--<script src="../../js/side_nav.js"></script>--%>

    <script>
        function get_language_value() {
            var bm = document.getElementById("bm");
            var bc = document.getElementById("bc");
            var bi = document.getElementById("bi");
            var text = document.getElementById("language_value");

            if (bm.checked == true) {
                text.innerHTML = "Malay";
                //value = document.getElementById("language_value").innerHTML;
            }
            else if (bc.checked == true) {
                text.innerHTML = "Chinese";
            }
            else if (bi.checked == true) {
                text.innerHTML = "English";
            }
        }
    </script>
</asp:Content>
