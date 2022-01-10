<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.course" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<link rel="stylesheet" href="../../css/admin_course.css" />
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css' rel='stylesheet'>

    <!-- CONTENT -->
	<section id="content">
		<!-- MAIN -->
		<main>
			<%--<ul class="box-info">
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
			</ul>--%>

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
                            <asp:Repeater ID="course_repeater" runat="server">
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
                                            <asp:Label ID="price_label" runat="server" Text="RM "><%# Eval("price") %></asp:Label>
									    </td>
									    <td>
                                            <asp:Label ID="language_label" runat="server" Text=<%# Eval("language") %>></asp:Label>
									    </td>
									    <td>
                                            <div class="wrapper">
                                                <asp:LinkButton ID="more_btn" runat="server" CssClass="icon more" OnClick="more_btn_Click" OnClientClick="return detail_btn_func()">
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
        
		<%--Flow ADD Button--%>
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
                            <%-- Avatar preview & upload --%>
                            <%--<div class="avatar-upload">
                                <div class="avatar-edit">
                                    <asp:FileUpload ID="imageUpload" runat="server" CssClass="file_input"/>
                                    <input type='file' id="imageUpload" class="file_input" accept=".png, .jpg, .jpeg" />
                                    <label for="imageUpload"></label>
                                </div>
                                <div class="avatar-preview">
                                    <div class="image_preview" id="imagePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                    </div>
                                </div>
                            </div>--%>
                            <%--<div class="avatar-upload">
                                <div class="avatar-edit">
                                    <input type='file' id="imageUpload" class="file_input" accept=".png, .jpg, .jpeg"/>
                                    <label for="imageUpload"></label>
                                </div>
                                <div class="avatar-preview">
                                    <div id="imagePreview" class="image_preview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                    </div>
                                </div>
                            </div>--%>
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
                            </div>
                            <div class="col-half">
                                <%--Tutor ddl--%>
                                <div class="input-group input-group-icon">
                                    <h4>Tutor</h4>
                                    <div class="input-group">
                                        <asp:DropDownList ID="tutor_ddl" runat="server">
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
                                         <asp:DropDownList ID="language_ddl" runat="server">
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
                                        <asp:DropDownList ID="day_ddl" runat="server">
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
                                        <asp:DropDownList ID="duration_ddl" runat="server">
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
                            <div class="col-half">
                                <div class="input-group"></div>
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
		<%--Flow ADD Button--%>

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
	<!-- CONTENT -->

	<link rel="stylesheet" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" />

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imagePreview').css('background-image', 'url(http://i.pravatar.cc/500?img=7)');
                    $('#imagePreview').hide();
                    $('#imagePreview').fadeIn(650);
                }
                reader.readAsDataURL(input.files[0]);
            }
            alert('alert');
        }
        $("#imageUpload").change(function () {
            alert('alert2');
            readURL(this);
        });
    </script>
    <script>
        function detail_btn_func() {
            document.querySelector('.modal_form').classList.add('expand');





            return false;
        }
    </script>
</asp:Content>
