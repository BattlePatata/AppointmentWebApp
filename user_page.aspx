<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="user_page.aspx.cs" Inherits="AppointmentWebApp.user_page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-7">
                    <div class="card">
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
                                        <h4>Your Profile</h4>
                                        <span>Account Status - </span>
                                        <asp:Label class="badge badge-pill badge-info" ID="AccStatusLabel" runat="server"></asp:Label>
                                    </center>
                                </div>
                            </div>
                    
                            <br />
                            
                            <div class="row">
                                <div class="col">
                                    <asp:FileUpload OnChange="readURL(this);" class="form-control" ID="ProfilePicFileUpload" runat="server" />
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
                                                        Class="form-control" placeholder="Full Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                       
                            <%--Category, Office Hours --%>
                            <div class="row">
                                <div class="col-md-6 mx-auto">
                                    <label>Category</label>
                                        <div class="form-group">
                                            <asp:DropDownList ID="CategDropDownList" runat="server"
                                                              class="form-control">
                                                <asp:ListItem Text="Select" Value="select" />
                                                <asp:ListItem Text="Obstetrician-gynecologist" Value="obstetrician-gynecologist"></asp:ListItem>
                                                <asp:ListItem Text="Pediatritian" Value="pediatritian"></asp:ListItem>
                                                <asp:ListItem Text="Therapist" Value="therapist"></asp:ListItem>
                                                <asp:ListItem Text="Dantist" Value="dantist"></asp:ListItem>
                                                <asp:ListItem Text="ENT" Value="ent"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                </div>
                    
                                <div class="col-md-6 mx-auto">
                                    <label>Office Hours</label>
                                        <div class="form-group">
                                            <asp:TextBox ID="OfficeHoursBox" runat="server"
                                                     class="form-control" placeholder="Office Hours"
                                                     ></asp:TextBox>
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
                                <div class="col-md-4 mx-auto">
                                    <label>Doctor ID</label>
                                        <div class="form-group">
                                            <asp:TextBox ID="IdBox" runat="server" 
                                                         placeholder="Doctor ID"
                                                         ReadOnly="true" class="form-control"></asp:TextBox>
                                                 
                                        </div>
                                </div>

                                <div class="col-md-4 mx-auto">
                                    <label>Old Password</label>
                                        <div class="form-group">
                                            <asp:TextBox ID="PasswBox" runat="server"
                                                         class="form-control" placeholder="Old Password"
                                                         ReadOnly="true"></asp:TextBox>
                                        </div>
                                </div>

                                <div class="col-md-4 mx-auto">
                                    <label>New Password</label>
                                        <div class="form-group">
                                            <asp:TextBox ID="NewPasswBox" runat="server"
                                                         class="form-control" placeholder="New Password"
                                                         TextMode="Password"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                            <%--Update button--%>
                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <div class="form-group">
                                        <center>
                                            <asp:Button class="btn btn-primary btn-block btn-lg" ID="UpdateButton" 
                                                        runat="server" Text="Update" OnClick="UpdateButton_Click" />
                                        </center>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>

             <div class="col-md-5">
               <div class="card">
                   <div class="card-body">
                       <div class="row">
                           <div class="col">
                               <center>
                                   <h4>Your Appointments</h4>
                                   <asp:Label Class="badge badge-pill badge-info" ID="UserIssuedLabel" 
                                              runat="server" Text="Info about Appointments"></asp:Label>
                               </center>
                           </div>
                       </div>
          
                       <div class="row">
                           <div class="col">
                               <hr />
                           </div>
                       </div>

                       <div class="row">
                           <asp:SqlDataSource id="OfficeHoursSqlDataSource" runat="server"
                               ConnectionString="<%$ ConnectionStrings:lukman_kabulhanaDBConnectionString %>"
                               ProviderName="<%$ ConnectionStrings:lukman_kabulhanaDBConnectionString.ProviderName %>"
                               >
                           </asp:SqlDataSource>
                           <div class="col">
                               <asp:GridView ID="AppointmentGridView" runat="server"
                                   class="table table-striped table-bordered"
                                   DataSourceID="OfficeHoursSqlDataSource"
                                   AutoGenerateColumns="false">
                                   <Columns>
                                        <asp:BoundField DataField="fullname" HeaderText="Name" ReadOnly="True" SortExpression="fullname"></asp:BoundField>
                                        <asp:BoundField DataField="phone_number" HeaderText="Phone Number" SortExpression="phone_number"></asp:BoundField>
                                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date"></asp:BoundField>
                                   </Columns>
                               </asp:GridView>
                           </div>
                       </div>
                  </div>
               </div>
            </div>
        </div>
    </div>

    <br />

     <div class="container-fluid">
         <div class="row">
             <div class="col-md-7 mx-auto">
                 <div class="card">
                     <div class="card-body">
                         <div class="row">
                             <div class="col">
                                 <center>
                                     <h4>F.A.Q</h4>
                                 </center>
                             </div>
                         </div>

                         <%--Question ID --%>
                         <div class="row">
                             <div class="col-md-6 mx-auto">
                                 <label>Question ID</label>
                                     <div class="form-group">
                                         <div class="input-group">
                                             <asp:TextBox ID="QuestionIdBox" runat="server" 
                                                             CssClass="form-control" placeholder="Question ID"></asp:TextBox>
                                               <asp:LinkButton class="btn btn-primary" ID="QuestionButton" OnClick="QuestionButton_Click" 
                                                           runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                         </div>
                                     </div>
                             </div>
                         </div>
                         
                         <%--FAQ --%>
                         <div class="row">
                             <div class="col-md-6 mx-auto">
                                 <label>Question</label>
                                     <div class="form-group">
                                         <asp:TextBox ID="QuestionBox" runat="server"
                                                         CssClass="form-control" placeholder="Question"
                                                         TextMode="MultiLine" Rows="2"></asp:TextBox>
                                     </div>
                             </div>

                             <div class="col-md-6 mx-auto">
                                 <label>Answer</label>
                                     <div class="form-group">
                                         <asp:TextBox ID="AnswerBox" runat="server"
                                                         CssClass="form-control" placeholder="Answer"
                                                         TextMode="MultiLine" Rows="2"></asp:TextBox>
                                     </div>
                             </div>
                         </div>
         
                         <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-block btn-success" ID="AddButton" 
                                                    runat="server" Text="Add" OnClick="AddButton_Click"/>
                                    </center>
                                </div>
                            </div>

                            <div class="col-4">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-block btn-primary" ID="Update_Button" 
                                                    runat="server" Text="Update" OnClick="Update_Button_Click"/>
                                    </center>
                                </div>
                            </div>

                            <div class="col-4">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-block btn-danger" ID="DeleteButton" 
                                                    runat="server" Text="Delete" OnClick="DeleteButton_Click"/>
                                    </center>
                                </div>
                            </div>
                        </div>
                     </div>
                 </div>
 
                 <a href="homepage.aspx"><< Back to Home</a><br><br>
             </div>

             <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>F.A.Q List</h4>
                                </center>
                            </div>
                        </div>
  
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <asp:SqlDataSource ID="FAQSqlDataSource" runat="server"
                            ConnectionString="<%$ ConnectionStrings:lukman_kabulhanaDBConnectionString %>"
                            ProviderName="<%$ ConnectionStrings:lukman_kabulhanaDBConnectionString.ProviderName %>"
                            ></asp:SqlDataSource>

                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="FAQGridView" runat="server"
                                              class="table table-striped table-bordered" 
                                              AutoGenerateColumns="False"
                                              DataSourceID="FAQSqlDataSource">
                                    <Columns>
                                        <asp:BoundField DataField="q_id" HeaderText="ID" SortExpression="q_id"></asp:BoundField>
                                        <asp:BoundField DataField="question" HeaderText="Question" SortExpression="question"></asp:BoundField>
                                        <asp:BoundField DataField="answer" HeaderText="Answer" SortExpression="answer"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                   </div>
                </div>
             </div>
         </div>
     </div>
</asp:Content>
