

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;

namespace SchoolManagementSystem.Admin
{
    public partial class AddClass : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
            }
        }
        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], ClassId, ClassName from Class");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("Select * from Class where ClassName='" + textClass.Text.Trim() + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Class values('" + textClass.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Added Sucessfully !";
                    lblMsg.CssClass = "alert alert-success";
                    textClass.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    lblMsg.Text = "Entered Class Already Exists !";
                    lblMsg.CssClass = "alert alert-danger";
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "');</script>");


            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetClass();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetClass();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                String ClassName = (row.FindControl("txtClassEdit") as TextBox).Text;
                fn.Query("Update Class set ClassName ='" + ClassName + "' where ClassId='" + cId + "' ");

                // lblMsg.Text = "Class Updated Sucessfully !";
                // Response.Write("<script> alert('Class Updated Sucessfully !');</script>");
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1; //get gridview index to previous state before calling getclass to reflect in the database
                GetClass();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "');</script>");
            }
        }
    }
}