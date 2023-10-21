
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;
using static System.Net.Mime.MediaTypeNames;

namespace SchoolManagementSystem.Admin
{
    public partial class ClassFees : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetFees();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select* from Class");
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
                DataTable dt = fn.Fetch("Select * from Fees where ClassId='" + ddlClass.SelectedItem.Value + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Fees values('" + ddlClass.SelectedItem.Value + "','" + textFeeAmount.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Added Sucessfully !";
                    lblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    textFeeAmount.Text = string.Empty;
                    GetFees();
                }
                else
                {
                    lblMsg.Text = "Entered Fees Amount Already Exists for <b> '" + classVal + "' </b>!";
                    lblMsg.CssClass = "alert alert-danger";
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "');</script>");


            }
        }

        private void GetFees()
        {
            DataTable dt = fn.Fetch("Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], f.FeesId,f.ClassId ,c.ClassName, f.FeesAmount from Fees  f inner join Class c on c.ClassId = f.ClassId");
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
            GetFees();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                
                int feesId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
              
                fn.Query("Delete from Fees where FeesId= '" +feesId + "' ");
                lblMsg.Text = "Fees Deleated Sucessfully !";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetFees();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try 
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int feesId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string feeAmt = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Fees set FeesAmount = '"+feeAmt.Trim()+"' FeesId='"+feesId+"'");
                 lblMsg.Text = "Fees Updated Sucessfully !";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex= -1;
            }
            catch(Exception ex) 
            {
                Response.Write("<script> alert('" + ex.Message + "');</script>");
            }
        }
    }
}