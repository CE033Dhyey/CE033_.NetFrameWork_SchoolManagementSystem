<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="SchoolManagementSystem.Admin.AddClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div style="background-image:url('../Image/admin_login.jpg');width:100%; height:720px;">
       <div class ="container p-md-4 p-sm-4">
        <div>
            
            <asp:Label  ID="lblMsg" runat="server" Width="400px"></asp:Label>
            
            </div>
            <h3 class="text-center">New Class</h3>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-6">
                   <label for="textClass"> Class Name</label>
                   <asp:TextBox ID="textClass" runat="server" CssClass="form-control" placeholder="Enter Class Name"  required></asp:TextBox>
               </div>
           </div>
             <div class="row mb-3 mr-lg-5 ml-lg-5">
                    <div class="col-md-3 col-md-offset-2 mb-3">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-bolck" BackColor="#bcbcbc" Text="Add Class" OnClick="btnAdd_Click"  />

                </div>

            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-6">

                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" DataKeyNames ="ClassId" AutoGenerateColumns="False"
                            EmptyDataText="No Record Found!" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                            OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" pageSize="6" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Class">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtClassEdit" runat="server" Text='<%# Eval("ClassName") %>' CssClass="form-control" ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblClassName" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="False" HeaderText="Oprations" ShowEditButton="True" />
                        </Columns>
                        <HeaderStyle BackColor="#bcbcbc" ForeColor="White"/>
                    </asp:GridView>
                </div>

            </div>
    </div>
        </div>

</asp:Content>

