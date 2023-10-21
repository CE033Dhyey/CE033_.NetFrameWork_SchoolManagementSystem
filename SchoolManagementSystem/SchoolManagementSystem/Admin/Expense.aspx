<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="SchoolManagementSystem.Admin.Expense" %>
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
            <h3 class="text-center">Add Expense</h3>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                   <label for="ddlClass"> Class</label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Class is required" ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" 
                        InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>
               <div class="col-md-6">
                   <label for="ddlSubject"> Subject</label>
        <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                        </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Subject is required" ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" 
                        InitialValue="Select Subject" SetFocusOnError="True"></asp:RequiredFieldValidator>  
             </div>

                 <div class="col-md-6 mt-4">
               <asp:Label for="txtExpenseAmt" runat="server" Text="Charges"></asp:Label>
                     <asp:TextBox ID="txtExpenseAmt" runat="server"  CssClass="form-control" placeholder="Enter Charge Amount" TextMode="Number" required></asp:TextBox>
            




           </div>


           </div>
          

           <div>

               </div>
             <div class="row mb-3 mr-lg-5 ml-lg-5">
                    <div class="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID="btnAdd" runat="server"  Text="Add Expense" OnClick="btnAdd_Click" /> 

                </div>      

                

            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-8">

                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                        AutoGenerateColumns="False" AllowPaging="True" PageSize="6" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="ExpenseId"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" 
                         OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Class">
                                <EditItemTemplate>
                                     
                                    <asp:DropDownList ID="ddlClassGV" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" 
                                        DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClassGV_SelectedIndexChanged">
                                        <asp:ListItem>Select Class</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SchoolCS %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlSubjectGV" runat="server" DataSourceID="SqlDataSource4" DataTextField="SubjectName"  DataValueField="SubjectId" SelectedValue='<%#Eval("SubjectId") %>'  CssClass="form-control">
                                       
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Amount">
                                <EditItemTemplate>
                                     
                                  
                                    <asp:TextBox ID="txtExpenseAmtGV" runat="server" CssClass="form-control"  Text='<%# Eval("ChargeAmount") %>' TextMode="Number"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ChargeAmount") %>'></asp:Label>
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
