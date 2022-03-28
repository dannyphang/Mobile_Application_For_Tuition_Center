<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/guess.Master" AutoEventWireup="true" CodeBehind="order_form.aspx.cs" Inherits="Tuition_Center_Application.common.order_form" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/mc-datepicker/dist/mc-calendar.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/mc-datepicker/dist/mc-calendar.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"/>
    <%--<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>--%>
    <link rel="stylesheet" href="../../css/order_form.css" />

    <section id="container">
        <div class="reg_form_content">
            <div class="row row2">
                <div class="avatar-upload">
                    <div class="avatar-edit">
                        <input type='file' id="imageUpload" class="file_input" accept=".png, .jpg, .jpeg" />
                        <label for="imageUpload"></label>
                        <asp:HiddenField ID="image_hf" runat="server" Value="Why are you here? I don't want to see you eh.." />
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
                        <p>
                            <span class="info_icon" data-blobity-tooltip="Tooltip text">
                                <ion-icon name="person-circle-outline"></ion-icon>
                            </span>
                        </p>

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
                            <span class="info_icon">
                                <ion-icon name="id-card-outline"></ion-icon>
                            </span>
                        </p>
                    </div>
                </div>
            </div>
            <%--Email Textbox--%>
            <div class="row row2">
                <h4 class="h4_text">Email</h4>
                <div class="input-group input-group-icon">
                    <asp:TextBox ID="email_text" runat="server" CssClass="input" placeholder="Email" TextMode="SingleLine"></asp:TextBox>
                    <div class="input-icon">
                        <p>
                            <span class="info_icon">
                                <ion-icon name="mail-outline"></ion-icon>
                            </span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="row row2">
                <%--Password Textbox--%>
                <div class="col-half col-half2">
                    <h4 class="h4_text">Password</h4>
                    <div class="input-group input-group-icon">
                        <asp:TextBox ID="password_text" runat="server" CssClass="input" placeholder="Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                        <div class="input-icon">
                            <p>
                                <span class="info_icon">
                                    <ion-icon name="lock-closed-outline"></ion-icon>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
                <%--Confirm Password Textbox--%>
                <div class="col-half col-half2">
                    <h4 class="h4_text">Confirm Password</h4>
                    <div class="input-group input-group-icon">
                        <asp:TextBox ID="confirm_password_text" runat="server" CssClass="input" placeholder="Confirm Password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                        <div class="input-icon">
                            <p>
                                <span class="info_icon">
                                    <ion-icon name="lock-closed-outline"></ion-icon>
                                </span>
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
                    <div class="input-icon">
                        <p>
                            <span class="info_icon">
                                <ion-icon name="planet-outline"></ion-icon>
                            </span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="row row2">
                <%-- Phone Number Textbox --%>
                <div class="col-half col-half2">
                    <h4 class="h4_text">Phone Number</h4>
                    <div class="input-group input-group-icon">
                        <asp:TextBox ID="phone_text" runat="server" CssClass="input" placeholder="Phone Number"></asp:TextBox>
                        <div class="input-icon">
                            <p>
                                <span class="info_icon">
                                    <ion-icon name="call-outline"></ion-icon>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
                <%-- DOB DDL --%>
                <div class="col-half col-half2">
                    <h4 class="h4_text">Date of Birth</h4>
                    <input class="datepicker form-control" data-date-format="mm/dd/yyyy"  data-date-end-date="0d"/>
                    <asp:HiddenField ID="datehf" runat="server" Value="0000" ClientIDMode="Static" />
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
                                <span class="info_icon">
                                    <ion-icon name="school-outline"></ion-icon>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row row2">
                <div class="col-half col-half2">
                    <a href="order.aspx" class="modal_btn" data-blobity-tooltip="Back"><span>
                        <ion-icon name="arrow-back-outline"></ion-icon>
                    </span></a>
                </div>
                <div class="col-half col-half2">
                    <asp:Button ID="clear_btn" runat="server" Text="Clear" CssClass="modal_btn" OnClick="clear_btn_Click" />
                    <asp:Button ID="checkout_btn" runat="server" Text="Checkout" CssClass="modal_btn" OnClick="stripe_checkout" />
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" ></script>
    <script src="../js/air_datepicker.js" type="text/javascript"></script>

    <%-- Stripe --%>
    <script src="https://js.stripe.com/v3/"></script>
    <script type="module" src="../js/stripe.js"></script>

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                    $('#imagePreview').hide();
                    //$('#imagePreview').fadeIn(650);
                    console.log(e.target.result);
                    document.getElementById("<%= image_hf.ClientID %>").value = String(e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#imageUpload").change(function () {
            readURL(this);
        });
    </script>
</asp:Content>
