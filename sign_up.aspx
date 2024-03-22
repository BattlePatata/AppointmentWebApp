<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="sign_up.aspx.cs" Inherits="AppointmentWebApp.sign_up" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Doctor Sign Up</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <br />
                        
                        <div class="row">
                            <div class="col">
                                <label>Profile Photo Upload<sup>*</sup></label>
                                <asp:FileUpload OnChange="readURL(this);" class="form-control" ID="ProfilePicFileUpload" runat="server" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <%--Full Name--%>
                        <div class="row">
                            <div class="col-md-12 mx-auto">
                                <center>
                                    <label>Full Name<sup>*</sup></label>
                                </center>

                                <div class="form-group">
                                    <asp:TextBox ID="FullNameBox" runat="server" 
                                                    CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <%--Category and Office Hours--%>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <label>Category<sup>*</sup></label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="CategDropDownList" runat="server"
                                                          CssClass="form-control">
                                            <asp:ListItem Text="Select" Value="select"></asp:ListItem>
                                            <asp:ListItem Text="Obstetrician-gynecologist" Value="obstetrician-gynecologist"></asp:ListItem>
                                            <asp:ListItem Text="Pediatritian" Value="pediatritian"></asp:ListItem>
                                            <asp:ListItem Text="Therapist" Value="therapist"></asp:ListItem>
                                            <asp:ListItem Text="Dantist" Value="dantist"></asp:ListItem>
                                            <asp:ListItem Text="ENT" Value="ent"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                            </div>
                        
                            <div class="col-md-6 mx-auto">
                                <label>Office hours<sup>*</sup></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="OfficeHoursBox" runat="server"
                                                     CssClass="form-control" placeholder="09:00-13:00"
                                                     ></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--Full Address --%>
                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="FullAdrsBox" runat="server"
                                                     CssClass="form-control" placeholder="Full Address"
                                                     TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                    
                        <%--Pill badge--%>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info mx-auto">Login Credentials</span><br><br>
                                </center>
                            </div>
                        </div>

                        <%--Doctor ID, Password--%>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <label>Doctor ID<sup>*</sup></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="DoctorIdBox" runat="server" 
                                                 CssClass="form-control" placeholder="Doctor ID (Prohibited symbols: ', `, ;)"></asp:TextBox>
                                    </div>
                            </div>
    
                            <div class="col-md-6 mx-auto">
                                <label>Password<sup>*</sup></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="PasswrdBox" runat="server"
                                                 CssClass="form-control" placeholder="Password (Prohibited symbols: ', `, ;)"
                                                 TextMode="Password"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--Sign up button--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="SignUpButton"
                                                runat="server" Text="Sign Up" OnClick="SignUpButton_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
                <a href="homepage.aspx"><< Back to Home</a><br><br>
            </div>
        </div>
    </div>
</asp:Content>
