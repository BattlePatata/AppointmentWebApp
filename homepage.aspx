<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="AppointmentWebApp.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 mx-auto">
                                    <label>Kategoriýany saýlaň</label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="CategDropDownList" runat="server" class="form-control"
                                                            DataTextField="Text" DataValueField="Value"
                                                            AutoPostBack="true" OnSelectedIndexChanged="CategDropDownList_SelectedIndexChanged">
                                            <asp:ListItem Value="homepage">Kategoriýany saýlaň</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-6 mx-auto">
                                    <label>Lukmany saýlaň</label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DocDropDownList" runat="server" class="form-control"
                                                            DataTextField="Text" DataValueField="Value"
                                                            AutoPostBack="true" OnSelectedIndexChanged="DocDropDownList_SelectedIndexChanged">
                                            <asp:ListItem>Lukmany saýlaň</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <br />

                    <div class="card" id="Doc_Info">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img id="imgview" runat="server" width="100" src="doctor_imgs/generaluser.png" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>About Doctor</h4>
                                    </center>
                                </div>
                            </div>
        
                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>
                            <%--Full Name --%>
                            <div class="row">
                                <div class="col-md-12 mx-auto">
                                    <center>
                                        <label>Full Name</label>
                                    </center>

                                    <div class="form-group">
                                        <asp:TextBox ID="FullNameBox" runat="server" 
                                                        Class="form-control" placeholder="Full Name"
                                                        ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
           
                            <%--Category, Office Hours --%>
                            <div class="row">
                                <div class="col-md-6 mx-auto">
                                    <label>Category</label>
                                        <div class="form-group">
                                            <asp:TextBox ID="CategBox" runat="server"
                                                     class="form-control" placeholder="Category"
                                                     ReadOnly="true"></asp:TextBox>
                                        </div>
                                </div>
        
                                <div class="col-md-6 mx-auto">
                                    <label>Office Hours</label>
                                        <div class="form-group">
                                            <asp:TextBox ID="OfficeHoursBox" runat="server"
                                                     class="form-control" placeholder="Office Hours"
                                                     ReadOnly="true"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                            <%--Full Address --%>
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <label>Full Address</label>
                                    </center>

                                    <div class="form-group">
                                        <asp:TextBox ID="FullAdrsBox" runat="server"
                                                        class="form-control" placeholder="Full Address"
                                                        TextMode="MultiLine" Rows="2"
                                                        ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7">
                    <asp:Repeater ID="FaqRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card" >
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <center>
                                            <button id="FaqButton" class="accordion-button" type="button" 
                                                data-toggle="collapse" data-target="#collapse_<%# Eval("question") %>" 
                                                aria-expanded="true" aria-controls="collapse_<%# Eval("question") %>">
                                            <%# Eval("question")  %>
                                            </button>
                                        </center>
                                    </h2>
                                    <div id="collapse_<%# Eval("question") %>" class="accordion-collapse collapse" aria-labelledby="collapse_<%# Eval("question") %>" data-parent="#faqRepeater">
                                        <div class="accordion-body">
                                            <center>
                                                <h5><%# Eval("answer") %></h5>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>

    
        
</asp:Content>
