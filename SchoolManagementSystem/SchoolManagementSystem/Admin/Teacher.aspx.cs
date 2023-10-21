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
    public partial class Teacher : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnxfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                GetTeacher();
            }
        }

        private void GetTeacher()
        {
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], TeacherId, [Name], DOB,Gender,Mobile,RollNo,[Address],[Password] from Teacher");
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlGender.SelectedValue != "0")
                {
                    string email = txtEmail.Text.Trim();
                    DataTable dt = fn.Fetch("Select* from Teacher where RollNo ='" + email + "'");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "Insert into Teacher values('" + txtName.Text.Trim() + "','" + txtDoB.Text.Trim() + "','" +
                            ddlGender.SelectedValue + "','" + txtMobile.Text.Trim() + "','" + txtEmail.Text.Trim() + "','" +
                            textAddress.Text.Trim() + "','" + textPassword.Text.Trim() + "')";
                        fn.Query(query);
                        lblMsg.Text = "Added Sucessfully !";
                        lblMsg.CssClass = "alert alert-success";
                        ddlGender.SelectedIndex = 0;
                        txtDoB.Text = string.Empty;
                        txtMobile.Text = string.Empty;
                        txtEmail.Text = string.Empty;
                        textAddress.Text = string.Empty;
                        textPassword.Text = string.Empty;
                        GetTeacher();

                    }
                    else
                    {

                        lblMsg.Text = "Entered <b> '" + email + "' </b>already exists!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else 
                {

                    lblMsg.Text = "Gender is required!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch(Exception ex) 
            {
                Response.Write("<>script>alert('"+ex.Message+"');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetTeacher();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeacher();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {


                int teacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Teacher where TeacherId= '" + teacherId + "' ");

                lblMsg.Text = "Teacher Deleated Sucessfully !";
                lblMsg.CssClass = "alert alert-success";

                GridView1.EditIndex = -1;
                GetTeacher();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetTeacher();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int teacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("textName") as TextBox).Text;
                string mobile = (row.FindControl("textMobile") as TextBox).Text;
                string password = (row.FindControl("txtPassword") as TextBox).Text;
                string address = (row.FindControl("txtAddress") as TextBox).Text;

                fn.Query("Update Teacher set Name = '" + name.Trim() + "', Mobile='" + mobile.Trim() + "',Address = '" + address.Trim() + "',Password='" + password.Trim() + "' where TeacherId='" + teacherId + "' ");
                
                lblMsg.Text = "Teacher Updated Sucessfully !";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetTeacher();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "');</script>");
            }
        }
    }
}