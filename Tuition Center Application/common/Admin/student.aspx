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

		<%-- Flow ADD Buttom --%>
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
						<div class="row row2">
                            <div class="avatar-upload">
                                <div class="avatar-edit">
                                    <input type='file' id="imageUpload" class="file_input" accept=".png, .jpg, .jpeg"/>
                                    <label for="imageUpload"></label>
                                </div>
                                <div class="avatar-preview">
                                    <div id="imagePreview" class="image_preview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--Student Name Textbox--%>
                        <div class="row row2">
                            <h4 class="h4_text">Name</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="name_text" runat="server" CssClass="input" placeholder="Name"></asp:TextBox>
                                <div class="input-icon">
                                        <div class="tooltip">Delete</div>
                                        <span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
                                </div>
                            </div>
                        </div>
                        <%--IC Textbox--%>
                        <div class="row row2">
                            <h4 class="h4_text">IC NO</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="IC_text" runat="server" CssClass="input" placeholder="IC No"></asp:TextBox>
                                <div class="input-icon">
                                    <p>
                                        <div class="tooltip">Delete</div>
                                        <span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <%--Email Textbox--%>
                        <div class="row row2">
                            <h4 class="h4_text">Email</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="email_text" runat="server" CssClass="input" placeholder="Email"></asp:TextBox>
                                <div class="input-icon">
                                    <p>
                                        <div class="tooltip">Delete</div>
                                        <span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row row2">
                            <%--Password Textbox--%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">Password</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="password_text" runat="server" CssClass="input" placeholder="Password"></asp:TextBox>
                                    <div class="input-icon"><p><span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span></p></div>
                                </div>
                            </div>
                            <%--Confirm Password Textbox--%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">Confirm Password</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="confirm_password_text" runat="server" CssClass="input" placeholder="Confirm Password"></asp:TextBox>
                                    <div class="input-icon" onmouseover="icon_hover()">
                                        <div class="tooltip">Delete</div>
                                        <p>
                                            <span id="info_icon" class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--Address Textbox--%>
                        <div class="row row2">
                            <h4 class="h4_text">Address</h4>
                            <div class="input-group input-group-icon">
                                <asp:TextBox ID="address_text" runat="server" CssClass="input" placeholder="Address"></asp:TextBox>
                                <div class="input-icon"><p></p></div>
                            </div>
                        </div>
                        <div class="row row2">
                            <%-- Phone Number Textbox --%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">Phone Number</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="phone_text" runat="server" CssClass="input" placeholder="Phone Number"></asp:TextBox>
                                    <div class="input-icon">
                                        <asp:LinkButton ID="delete_btn" runat="server" CssClass="info_icon delete" OnClick="delete_btn_Click">
                                            <div class="tooltip">Delete</div>
                                            <span><ion-icon name="trash-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                        <%--<p>
                                            <div class="tooltip">Delete</div>
                                            <span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
                                        </p>--%>
                                    </div>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="info_icon delete" OnClick="delete_btn_Click">
                                        <div class="tooltip">Delete</div>
                                        <span><ion-icon name="trash-outline"></ion-icon></span>
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <%-- DOB DDL --%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">Date of Birth</h4>
                
                            </div>
                        </div>
                        <div class="row row2">
                            <%-- Education Level DDL --%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">Education Level</h4>
                                <div class="input-group">
                                    <asp:DropDownList ID="level_ddl" runat="server">
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
                                </div>
                            </div>
                            <%-- School Textbox --%>
                            <div class="col-half col-half2">
                                <h4 class="h4_text">School</h4>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="school_text" runat="server" CssClass="input" placeholder="School"></asp:TextBox>
                                    <div class="input-icon">
                                        <p>
                                            <div class="tooltip">Delete</div>
                                            <span class="info_icon"><ion-icon name="information-circle-outline"></ion-icon></span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row2">
                            <div class="col-half col-half2">
                                <div class="input-group"></div>
                            </div>
                            <div class="col-half col-half2">
                                <asp:Button ID="clear_btn" runat="server" Text="Clear" CssClass="modal_btn" OnClick="clear_btn_Click"/>
                                <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="modal_btn" OnClick="submit_btn_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		</div>
		<%-- Flow ADD Buttom --%>

        <%-- Flow EDIT Modal --%>
        <div id="demo_modal" class="modal_form" runat="server">
            <div class="modal__content">
                <%--<a class="modal__close" onclick="document.querySelector('.modal_form').classList.remove('expand');event.stopPropagation();"><ion-icon name="close-outline" class="edit_close_icon"></ion-icon></a>--%>
                <div class="top">
                    <div class="x-touch" onclick="document.querySelector('.modal_form').classList.remove('expand');event.stopPropagation();">
                        <div class="x">
                            <div class="line1"></div>
                            <div class="line2"></div>
                        </div>
                    </div>
                </div>
                <div class="to">
                    <div class="to-contents">
                        <div class="bottom">
                            <div class="row">
                                <div class="avatar-upload">
                                    <div class="avatar-edit">
                                        <input type='file' id="imageUpload2" class="file_input" accept=".png, .jpg, .jpeg"/>
                                        <label for="imageUpload"></label>
                                    </div>
                                    <div class="avatar-preview">
                                        <div id="imagePreview2" class="image_preview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <h4>Course</h4>
                                <%--Course Name Textbox--%>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="name_text2" runat="server" CssClass="input" placeholder="Course name"></asp:TextBox>
                                    <div class="input-icon"><p></p></div>
                                </div>
                                <div class="col-half">
                                    <%--Level DDL--%>
                                    <div class="input-group input-group-icon">
                                        <h4>Level</h4>
                                        <div class="input-group">
                                            <asp:DropDownList ID="level_ddl2" runat="server">
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
                                        </div>
                                    </div>
                                </div>
                                <div class="col-half">
                                    <%--Tutor ddl--%>
                                    <div class="input-group input-group-icon">
                                        <h4>Tutor</h4>
                                        <div class="input-group">
                                            <asp:DropDownList ID="tutor_ddl2" runat="server">
                                                <asp:ListItem>Tutor</asp:ListItem>
                                            </asp:DropDownList>
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
                                             <asp:DropDownList ID="language_ddl2" runat="server">
                                                <asp:ListItem>Malay</asp:ListItem>
                                                <asp:ListItem>Chinese</asp:ListItem>
                                                <asp:ListItem>English</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-half">
                                    <%--Price Textbox--%>
                                    <div class="input-group input-group-icon">
                                        <h4>Price</h4>
                                        <div class="input-group">
                                            <asp:TextBox ID="price_text2" runat="server" CssClass="input" placeholder="0.00"></asp:TextBox>
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
                                            <asp:DropDownList ID="day_ddl2" runat="server">
                                                <asp:ListItem>Monday</asp:ListItem>
                                                <asp:ListItem>Tuesday</asp:ListItem>
                                                <asp:ListItem>Wednesday</asp:ListItem>
                                                <asp:ListItem>Thursday</asp:ListItem>
                                                <asp:ListItem>Friday</asp:ListItem>
                                                <asp:ListItem>Saturday</asp:ListItem>
                                                <asp:ListItem>Sunday</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-half">
                                    <%--Duration DDL--%>
                                    <div class="input-group input-group-icon">
                                        <h4>Duration</h4>
                                        <div class="input-group">
                                            <asp:DropDownList ID="duration_ddl2" runat="server">
                                                <asp:ListItem>1 hour</asp:ListItem>
                                                <asp:ListItem>1.5 hours</asp:ListItem>
                                                <asp:ListItem>2 hours</asp:ListItem>
                                                <asp:ListItem>2.5 hours</asp:ListItem>
                                            </asp:DropDownList>
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
                                            <asp:TextBox ID="hour_text2" runat="server" CssClass="input" placeholder="00" MaxLength="2"></asp:TextBox>
                                            <div class="input-icon"><p>HH</p></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-half">
                                    <%--Time Hour Text--%>
                                    <div class="input-group input-group-icon">
                                        <div class="input-group">
                                            <asp:TextBox ID="min_text2" runat="server" CssClass="input" placeholder="00" MaxLength="2"></asp:TextBox>
                                            <div class="input-icon"><p>MM</p></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-half">
                                    <div class="input-group"></div>
                                </div>
                                <div class="col-half">
                                    <asp:Button ID="reset_btn" runat="server" Text="Reset" CssClass="modal_btn" OnClick="reset_btn_Click"/>
                                    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="modal_btn" OnClick="update_btn_Click"/>
                                    <asp:HiddenField ID="courseID_hd2" runat="server" Value='<%# Eval("courseID") %>'/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- Flow EDIT Modal --%>
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