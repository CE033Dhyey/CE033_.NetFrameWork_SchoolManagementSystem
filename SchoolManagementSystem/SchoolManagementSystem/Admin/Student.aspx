<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="SchoolManagementSystem.Admin.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="background-image:url('../Image/admin_login.jpg');width:100%; height:900px;">
       <div class ="container p-md-4 p-sm-4">
        <div>
            
            <asp:Label  ID="lblMsg" runat="server" Width="400px"></asp:Label>
            
            </div>
            <h3 class="text-center">Add Student</h3>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                   <label for="txtName">Student Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name"  required></asp:TextBox>


                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name should be in charecters only" ForeColor="Red" 
                        ValidationExpression="^[a-zA-Z\s]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">

                    </asp:RegularExpressionValidator>

               </div>
               <div class="col-md-6">
                   <label for="txtDoB"> Date of Birth</label>
                   <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="Date" required ReadOnly="False"></asp:TextBox>
               </div>
           </div>


           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                   <label for="ddlGender"> Gender</label>

                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem Value="0">Select Gender</asp:ListItem>
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                    </asp:DropDownList>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender is not selected!" 
                        ForeColor="Red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true"> InitialValue="Select Gender"></asp:RequiredFieldValidator>

               </div>
               <div class="col-md-6">
                   <label for="txtMobile">Mobile No. </label>
                   <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="10 Digits" required></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="In valid Mobile No."
                       ForeColor="Red" 
                        ValidationExpression="^[0-9]{10}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                   </div>
           </div>
           <!--  -->
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                   <label for="txtEmail"> Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email" required></asp:TextBox>


                   

               </div>
               <div class="col-md-6">
                   <label for="textPassword"> Password</label>
                   <asp:TextBox ID="textPassword" runat="server" CssClass="form-control"   placeholder="Enter Password" required ></asp:TextBox>
               </div>
           </div>


             <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-12">
                   <label for="textAddress"> Address</label>
                    <asp:TextBox ID="textAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="Multiline" required></asp:TextBox>


                   

               </div>
             
           </div>


             <div class="row mb-3 mr-lg-5 ml-lg-5">
                    <div class="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Teacher" /> 

                </div>      

                

            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-8">

                   <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                        AutoGenerateColumns="False" AllowPaging="True" PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="TeacherId"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" 
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" >
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                <asp:TextBox ID="textName" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control"></asp:TextBox> 
    
                                   
                                  
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile No.">
                                <EditItemTemplate>
                                   <asp:TextBox ID="textMobile" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control" Width="100px"></asp:TextBox> 

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>



                              <asp:TemplateField HeaderText="Email">
                               
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("RollNo") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>


                              <asp:TemplateField HeaderText="Password">
                                <EditItemTemplate>
                                   <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control" Width="100px"></asp:TextBox> 

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>



                              <asp:TemplateField HeaderText="Address">
                                <EditItemTemplate>
                                   <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control" Width="100px"></asp:TextBox> 

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:CommandField CausesValidation="false" HeaderText="Oprations" ShowDeleteButton="True" ShowEditButton="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle BackColor="#bcbcbc" ForeColor="#ffffff"/>
                    </asp:GridView> 
                </div>

              

            </div>
    </div>
        </div>
</asp:Content>
