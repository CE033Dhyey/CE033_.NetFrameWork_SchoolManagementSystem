<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="SchoolManagementSystem.Admin.Subject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="background-image:url('../Image/admin_login.jpg');width:100%; height:720px;">
       <div class ="container p-md-4 p-sm-4">
        <div>
            
            <asp:Label  ID="lblMsg" runat="server" Width="400px"></asp:Label>
            
            </div>
            <h3 class="text-center">New Subject</h3>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                   <label for="ddlClass"> Class</label>
                    <asp:DropDownList ID="ddlClass" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Class is required" ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" 
                        InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>

                  

               </div>
               <div class="col-md-6">
                   <label for="txtSubject"> Subject</label>
                   <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter Subject Name"  required></asp:TextBox>
               </div>
           </div>
           <div>

               </div>
             <div class="row mb-3 mr-lg-5 ml-lg-5">
                    <div class="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" /> 

                </div>      

                

            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-8">

                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                        AutoGenerateColumns="False" AllowPaging="True" PageSize="6" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="SubjectId"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" 
                        OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated" OnRowUpdating="GridView1_RowUpdating" >
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Class">
                                <EditItemTemplate>
                                     
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName"  DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject">
                                <EditItemTemplate>
                                   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("SubjectName") %>' CssClass="form-control"></asp:TextBox> 

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
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

