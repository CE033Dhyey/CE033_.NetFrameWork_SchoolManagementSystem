using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;

namespace SchoolManagementSystem.Admin
{
    public partial class Subject : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                GetClass();
                GetSubject();
                
            }
           
        }

        private void GetClass()
        {
            DataTable dataTable = fn.Fetch("Select* from Class");
            DataTable dt = dataTable;
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");
        }

       

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classVal = ddlClass.SelectedItem.Text;
                DataTable dt = fn.Fetch("Select * from Subject where ClassId='" + ddlClass.SelectedItem.Value + "' and SubjectName='" + txtSubject.Text.Trim() + "' ");
                if (dt.Rows.Count == 0)
                {
                    TextBox txtSubject1 = txtSubject;
                    string query = "Insert into Subject values('" + ddlClass.SelectedItem.Value + "','" + txtSubject1.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Added Sucessfully !";
                    lblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    txtSubject.Text = string.Empty;
                    GetSubject();
                }
                else
                {
                    lblMsg.Text = "Entered Subject Already Exists for <b> '" + classVal + "' </b>!";
                    lblMsg.CssClass = "alert alert-danger";
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "');</script>");


            }
        }

        private void GetSubject()
        {
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], s.SubjectId  ,s.ClassId ,c.ClassName, s.SubjectName from Subject  s inner join Class c on c.ClassId = s .ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetClass();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetSubject();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

              
                int subjectId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Subject where SubjectId= '" + subjectId + "' ");
               
                lblMsg.Text = "Fees Deleated Sucessfully !";
                lblMsg.CssClass = "alert alert-success";
             
                GridView1.EditIndex = -1;
                GetSubject();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetSubject();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int subjectId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("DropDownList1")).SelectedValue;
                string subjectName = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Subject set ClassId = '" + classId + "', SubjectName='" + subjectName + "' where  SubjectId='" + subjectId + "'");
                lblMsg.Text = "Subject Updated Sucessfully !";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetSubject();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "');</script>");
            }
        }




    }
}