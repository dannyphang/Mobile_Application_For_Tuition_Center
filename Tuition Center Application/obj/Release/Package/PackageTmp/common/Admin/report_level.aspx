<%@ Page Title="" Language="C#" MasterPageFile="~/common/MasterPage/admin.Master" AutoEventWireup="true" CodeBehind="report_level.aspx.cs" Inherits="Tuition_Center_Application.common.Admin.report_student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../../css/admin_course.css" />

    <section id="content">
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
                                <th>Level</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Standard 1
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_s1" runat="server" CssClass="icon delete" OnClick="next_btn_s1_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Standard 2
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_s2" runat="server" CssClass="icon delete" OnClick="next_btn_s2_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Standard 3
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_s3" runat="server" CssClass="icon delete" OnClick="next_btn_s3_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Standard 4
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_s4" runat="server" CssClass="icon delete" OnClick="next_btn_s4_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Standard 5
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_s5" runat="server" CssClass="icon delete" OnClick="next_btn_s5_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Standard 6
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_s6" runat="server" CssClass="icon delete" OnClick="next_btn_s6_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Form 1
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_f1" runat="server" CssClass="icon delete" OnClick="next_btn_f1_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Form 2
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_f2" runat="server" CssClass="icon delete" OnClick="next_btn_f2_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Form 3
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_f3" runat="server" CssClass="icon delete" OnClick="next_btn_f3_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Form 4
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_f4" runat="server" CssClass="icon delete" OnClick="next_btn_f4_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Form 5
                                </td>
                                <td>
                                    <div class="wrapper">
                                        <asp:LinkButton ID="next_btn_f5" runat="server" CssClass="icon delete" OnClick="next_btn_f5_Click">
                                        <div class="tooltip">Next</div>
                                        <span><ion-icon name="arrow-forward-outline"></ion-icon></span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </section>
</asp:Content>
