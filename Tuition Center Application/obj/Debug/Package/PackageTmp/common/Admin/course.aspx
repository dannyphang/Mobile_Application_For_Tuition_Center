<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.course" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css'>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400" />
    <link rel="stylesheet" href="../../css/admin_course.css" />
    <link rel="stylesheet" href="../../css/search.css" />

    <!-- CONTENT -->
    <section id="content">
        <div class="search-form">
            <input type="search" id="search_input" value="" placeholder="Search" class="search-input" onkeyup="search_filter()">
            <button type="submit" class="search-button">
                <span class="icon_span">
                    <ion-icon name="search-circle-outline"></ion-icon>
                </span>
            </button>
            <div class="search-option">
                <div class="radio_div">
                    <input name="type" type="radio" value="type-users" id="type-users" onclick="option_checked()" checked="checked">
                    <label for="type-users">
                        <span class="icon_span">
                            <ion-icon name="bookmark-outline" class="zero_padding"></ion-icon>
                        </span>
                        <span class="tool_span">Name</span>
                    </label>
                </div>

                <div class="radio_div">
                    <input name="type" type="radio" value="type-posts" id="type-posts" onclick="option_checked()">
                    <label for="type-posts">
                        <span class="icon_span">
                            <ion-icon name="bulb-outline" class="zero_padding"></ion-icon>
                        </span>
                        <span class="tool_span">Level</span>
                    </label>
                </div>
                <div class="radio_div">
                    <input name="type" type="radio" value="type-images" id="type-images" onclick="option_checked()">
                    <label for="type-images">
                        <span class="icon_span">
                            <ion-icon name="cash-outline" class="zero_padding"></ion-icon>
                        </span>
                        <span class="tool_span">Price</span>
                    </label>
                </div>
                <div class="radio_div">
                    <input name="type" type="radio" value="type-special" id="type-special" onclick="option_checked()">
                    <label for="type-special">
                        <span class="icon_span">
                            <ion-icon name="chatbubble-ellipses-outline" class="zero_padding"></ion-icon>
                        </span>
                        <span class="tool_span">Language</span>
                    </label>
                </div>
            </div>
        </div>

        <!-- MAIN -->
        <main>
            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Courses</h3>
                        <i class='bx bx-search'></i>
                    </div>
                    <table id="display_table">
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
                                            <asp:Label ID="courseName_label" runat="server" Text='<%# Eval("courseName") %>'></asp:Label>
                                            <asp:HiddenField ID="courseID_hd" runat="server" Value='<%# Eval("courseID") %>' />
                                            <asp:HiddenField ID="courseName_hd" runat="server" Value='<%# Eval("courseName") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="level_label" runat="server" Text='<%# Eval("level") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="price_label" runat="server" Text="RM "><%# Eval("price") %></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="language_label" runat="server" Text='<%# Eval("language") %>'></asp:Label>
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

        <%--Flow ADD Button--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
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
                                    <h4>Course</h4>
                                    <%--Course Name Textbox--%>
                                    <div class="input-group input-group-icon">
                                        <asp:TextBox ID="name_text" runat="server" CssClass="input" placeholder="Course name"></asp:TextBox>
                                        <div class="input-icon">
                                            <p></p>
                                        </div>
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
                                                <asp:HiddenField ID="tutor_ddl_hf" runat="server" ClientIDMode="Static" />
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
                                                <div class="input-icon input-icon2">
                                                    <p>RM</p>
                                                </div>
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
                                                <div class="input-icon">
                                                    <p>HH</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-half">
                                        <%--Time Hour Text--%>
                                        <div class="input-group input-group-icon">
                                            <div class="input-group">
                                                <asp:TextBox ID="min_text" runat="server" CssClass="input" placeholder="00" MaxLength="2"></asp:TextBox>
                                                <div class="input-icon">
                                                    <p>MM</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-half">
                                        <div class="input-group"></div>
                                    </div>
                                    <div class="col-half">
                                        <asp:Button ID="clear_btn" runat="server" Text="Clear" CssClass="modal_btn" OnClick="clear_btn_Click" />
                                        <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="modal_btn" OnClick="submit_btn_Click" />
                                        <asp:HiddenField ID="submit_btn_hf" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%--Flow ADD Button--%>

        <%-- Flow EDIT Modal --%>
        <div id="demo_modal" class="modal_form" runat="server">
            <div class="modal__content">
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
                                <h4>Course</h4>
                                <%--Course Name Textbox--%>
                                <div class="input-group input-group-icon">
                                    <asp:TextBox ID="name_text2" runat="server" CssClass="input" placeholder="Course name"></asp:TextBox>
                                    <div class="input-icon">
                                        <p></p>
                                    </div>
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
                                            <div class="input-icon input-icon2">
                                                <p>RM</p>
                                            </div>
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
                                            <div class="input-icon">
                                                <p>HH</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-half">
                                    <%--Time Hour Text--%>
                                    <div class="input-group input-group-icon">
                                        <div class="input-group">
                                            <asp:TextBox ID="min_text2" runat="server" CssClass="input" placeholder="00" MaxLength="2"></asp:TextBox>
                                            <div class="input-icon">
                                                <p>MM</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-half">
                                    <div class="input-group"></div>
                                </div>
                                <div class="col-half">
                                    <asp:Button ID="reset_btn" runat="server" Text="Reset" CssClass="modal_btn" OnClick="reset_btn_Click" />
                                    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="modal_btn" OnClick="update_btn_Click" />
                                    <asp:HiddenField ID="courseID_hd2" runat="server" Value='<%# Eval("courseID") %>' />
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <%-- Search Filter --%>
    <script>
        $('.search-input').focus(function () {
            $(this).parent().addClass('focus');
        }).blur(function () {
            $(this).parent().removeClass('focus');
        })

        function option_checked() {
            var option_checked_num = 0;

            if (document.getElementById("type-users").checked == true) {
                option_checked_num = 0;
            }
            else if (document.getElementById("type-posts").checked == true) {
                option_checked_num = 1;
            }
            else if (document.getElementById("type-images").checked == true) {
                option_checked_num = 2;
            }
            else if (document.getElementById("type-special").checked == true) {
                option_checked_num = 3;
            }
            console.log(option_checked_num);
            return option_checked_num;
        }

        function search_filter() {
            let input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("search_input");
            filter = input.value.toUpperCase();
            table = document.getElementById("display_table");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[option_checked()];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>

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

        function detail_btn_func() {
            document.querySelector('.modal_form').classList.add('expand');
            //document.querySelector('.modal-thread').addClass('active');
            //document.querySelector('.move-thread-modal').addClass('active');
            return false;
        }

        window.addEventListener('load',
            function load() {
                window.removeEventListener('load', load, false);
                document.body.classList.remove('preload');
            }
            , false);
        $(function () {
            $("#move-thread").click(function (event) {
                event.preventDefault();
                $(".modal_form").addClass("expand");
                $("#move-thread-modal").addClass("active");
            });
            $("#move-thread-close").click(function (event) {
                event.preventDefault();
                $("#modal-overlay").removeClass("active");
                $("#move-thread-modal").removeClass("active");
            });
        });
        $(document).ready(function () {
            $(document.body).append("<div id='modal-overlay'></div>");
        });
    </script>

</asp:Content>
