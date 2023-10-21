<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="TeacherSubject.aspx.cs" Inherits="SchoolManagementSystem.Admin.TeacherSubject" %>
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
            <h3 class="text-center">Assign Subject To Teacher</h3>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                   <label for="ddlClass"> Class</label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="
                        ddlClass_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Class is required" ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" 
                        InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>
               <div class="col-md-6">
                   <label for="ddlSubject"> Subject</label>
        <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Subject is required" ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" 
                        InitialValue="Select Subject" SetFocusOnError="True"></asp:RequiredFieldValidator>  
             </div>

                 <div class="col-md-6">
               <asp:Label for="ddlTeacher" runat="server" Text="Teacher"></asp:Label>
               <asp:DropDownList ID="ddlTeacher" runat="server" Height="26px" Width="260px"></asp:DropDownList>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlTeacher"
                   ErrorMessage="Teacher is Required" InitialValue="Select Teacher" SetFocusOnError="true"></asp:RequiredFieldValidator>




           </div>


           </div>
          

           <div>

               </div>
             <div class="row mb-3 mr-lg-5 ml-lg-5">
                    <div class="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Assign Subject" /> 

                </div>      

                

            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-8">

                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                        AutoGenerateColumns="False" AllowPaging="True" PageSize="6" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="Id"
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
                            <asp:DropDownList ID="ddlSubjectGV" runat="server" CssClass="form-control"  SelectedValue='<%# Eval("SubjectId") %>' DataSourceID="SqlDataSource3" DataTextField="SubjectName" DataValueField="SubjectId">
                                        
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Teacher">
                                <EditItemTemplate>
                                     
                                    <asp:DropDownList ID="ddlTeacherGV" runat="server" DataSourceID="SqlDataSource2" DataTextField="TeacherId" 
                                        DataValueField="Name" SelectedValue='<%# Eval("TeacherId") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SchoolCS %>" SelectCommand="SELECT [Name], [TeacherId] FROM [Teacher]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
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
