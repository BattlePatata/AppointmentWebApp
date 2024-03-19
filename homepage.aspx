<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="AppointmentWebApp.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 mx-auto">
                                    <label>Choose Category</label>
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
                                    <label>Choose Doctor</label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DocDropDownList" runat="server"
                                                          CssClass="form-control">
                                            <asp:ListItem Text="Select" Value="select"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
