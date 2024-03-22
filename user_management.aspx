<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="user_management.aspx.cs" Inherits="AppointmentWebApp.user_management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Doctor Details</h4>
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

                        <%--Full Name and Date of Birth --%>
                        <div class="row">
                            <div class="col-md-3 mx-auto">
                                <label>Doctor ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="IdBox" runat="server" 
                                                            CssClass="form-control" placeholder="Doctor ID"></asp:TextBox>
                                              <asp:LinkButton class="btn btn-primary" ID="IdButton" OnClick="IdButton_Click" 
                                                          runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        </div>
                                    </div>
                            </div>
                
                            <div class="col-md-4 mx-auto">
                                <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="FullNameBox" runat="server"
                                                        CssClass="form-control" placeholder="Doctor Name"
                                                        ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>

                            <div class="col-md-5 mx-auto">
                                <label>Account Status</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="AccStatusBox" runat="server" 
                                                         CssClass="form-control mr-1" placeholder="Pending"
                                                         ReadOnly="true"></asp:TextBox>
                                        
                                            <asp:LinkButton class="btn btn-success mr-1" ID="ActiveButton" OnClick="ActiveButton_Click"
                                                            runat="server" Text="S"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        
                                            <asp:LinkButton class="btn btn-warning mr-1" ID="PengindButton" OnClick="PengindButton_Click"
                                                            runat="server" Text="P"><i class="fa-regular fa-circle-pause"></i></asp:LinkButton>
                                        
                                            <asp:LinkButton class="btn btn-danger" ID="DeactiveButton" OnClick="DeactiveButton_Click"
                                                            runat="server" Text="D"><i class="fa-solid fa-circle-xmark"></i></asp:LinkButton>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <%-- Contact num, Email--%>
                        <div class="row">
                            <div class="col-md-3 mx-auto">
                                <label>Date of Birth</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="DobBox" runat="server" 
                                                    CssClass="form-control" placeholder="dd-mm-yyyy"
                                                    TextMode="Date" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>

                            <div class="col-md-4 mx-auto">
                                <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="ContactNoBox" runat="server" 
                                                    CssClass="form-control" placeholder="Contact No"
                                                    TextMode="Phone" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                
                            <div class="col-md-5 mx-auto">
                                <label>Email ID</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="EmailIdBox" runat="server"
                                                    CssClass="form-control" placeholder="Email ID"
                                                    TextMode="Email" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--State, City, Pin code --%>
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <label>State</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="StateBox" runat="server"
                                                     CssClass="form-control" placeholder="State"
                                                     ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                
                            <div class="col-md-4 mx-auto">
                                <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="CityBox" runat="server"
                                                     CssClass="form-control" placeholder="City"
                                                     ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                
                            <div class="col-md-4 mx-auto">
                                <label>Pin Code</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="PinCodeBox" runat="server"
                                                    CssClass="form-control" placeholder="Pin Code"
                                                    TextMode="Number" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--Full Address --%>
                        <div class="row">
                            <div class="col">
                                <label>Full Postal Address</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="FullAdresBox" runat="server"
                                                        CssClass="form-control" placeholder="Description of place of work"
                                                        TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
            
                        <%--Delete doctor button--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-danger btn-block btn-lg" ID="DeleteDoctorButton" 
                                                runat="server" Text="Delete Doctor Permanently" OnClick="DeleteDoctorButton_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    
                <a href="homepage.aspx"><< Back to Home</a><br><br>
            </div>

            <div class="col-md-7">
               <div class="card">
                   <div class="card-body">
                       <div class="row">
                           <div class="col">
                               <center>
                                   <h4>Doctor List</h4>
                               </center>
                           </div>
                       </div>
  
                       <div class="row">
                           <div class="col">
                               <hr />
                           </div>
                       </div>

                       <asp:SqlDataSource ID="DoctorSqlDataSource" runat="server"
                           ConnectionString="<%$ ConnectionStrings:lukman_kabulhanaDBConnectionString %>"
                           ProviderName="<%$ ConnectionStrings:lukman_kabulhanaDBConnectionString.ProviderName %>"
                           SelectCommand="SELECT * FROM [doctor_master_tbl]"></asp:SqlDataSource>

                       <div class="row">
                           <div class="col">
                               <asp:GridView ID="DoctorGridView" runat="server"
                                             class="table table-striped table-bordered" 
                                             DataSourceID="DoctorSqlDataSource" 
                                             AutoGenerateColumns="False">
                                   <Columns>
                                       <asp:BoundField DataField="doctor_id" HeaderText="ID" ReadOnly="True" SortExpression="doctor_id"></asp:BoundField>
                                       <asp:BoundField DataField="fullname" HeaderText="Name" SortExpression="fullname"></asp:BoundField>
                                       <asp:BoundField DataField="status" HeaderText="Account Status" SortExpression="status"></asp:BoundField>
                                       <asp:BoundField DataField="place_of_work" HeaderText="Place of work" SortExpression="place_of_work"></asp:BoundField>
                                       <asp:BoundField DataField="office_hours" HeaderText="Office Hours" SortExpression="office_hours"></asp:BoundField>
                                       <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category"></asp:BoundField>
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
