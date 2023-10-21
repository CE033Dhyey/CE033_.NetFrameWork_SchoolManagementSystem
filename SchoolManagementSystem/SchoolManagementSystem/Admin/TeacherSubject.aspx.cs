using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;

namespace SchoolManagementSystem.Admin
{
    public partial class TeacherSubject : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnxfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                
                GetClass();
                //GetTeacher();
               // GetSubject();
                GetTeacherSubject();        
            }
        }


        public void GetClass()
        {
           
            DataTable dt = fn.Fetch("Select* from Class");
            
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");
            


        }
       /*  private void GetTeacher() 
         {
             DataTable dt = fn.Fetch("Select * from Teacher");
             ddlTeacher.DataSource = dt;
             ddlTeacher.DataTextField = "Name";
             ddlTeacher.DataValueField = "TeacherId";
             ddlTeacher.DataBind();
             ddlTeacher.Items.Insert(0, "Select Teacher");
         } */


        private void GetSubject() {


            string classId = ddlClass.SelectedValue;
            DataTable dt1 = fn.Fetch("Select * from Subject where ClassId='" + classId + "'");
            ddlSubject.DataSource = dt1;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "Select Subject");


        }

        private void GetTeacherSubject()
        {
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No],ts.Id,ts.ClassId,c.ClassName,ts.SubjectId,
                                     s.SubjectName, ts.TeacherId, t.Name from TeacherSubject ts inner join Class c on ts.ClassId= c.ClassId
                                     inner join Subject s on ts.SubjectId = s.SubjectId inner join Teacher t on ts.TeacherId = t.TeacherId");

            
            GridView1.DataSource = dt;
           
         
            GridView1.DataBind();


        }


        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {

            DataTable dt = fn.Fetch("Select * from Teacher");
            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "Name";
            ddlTeacher.DataValueField = "TeacherId";
            ddlTeacher.DataBind();
            ddlTeacher.Items.Insert(0, "Select Teacher");
            


            string classId = ddlClass.SelectedValue;
             DataTable dt1 = fn.Fetch("Select * from Subject where ClassId='" + classId + "'");
             ddlSubject.DataSource = dt1;
             ddlSubject.DataTextField = "SubjectName";
             ddlSubject.DataValueField = "SubjectId";
             ddlSubject.DataBind();
             ddlSubject.Items.Insert(0, "Select Subject"); 
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classId = ddlClass.SelectedValue;
                string subjectId = ddlSubject.SelectedValue;
                string teacherId = ddlTeacher.SelectedValue;
                DataTable dt = fn.Fetch("Select * from TeacherSubject where ClassId='" + classId + "' and SubjectId ='" + subjectId + "'");

                if (dt.Rows.Count == 0)
                {

                    string query = "Insert into TeacherSubject values('" + classId + "','" + subjectId + "','" + teacherId + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted  Sucessfully !";
                    lblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    ddlSubject.SelectedIndex = 0;
                    ddlTeacher.SelectedIndex = 0;
                    GetTeacherSubject();


                }
                else
                {
                    lblMsg.Text = "Entered Teacher Already Exists! ";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }

            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "');</script>");


            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetTeacherSubject();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeacherSubject();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {


                int teacherSubjectId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from TeacherSubject where Id= '" + teacherSubjectId + "' ");

                lblMsg.Text = "Teachers subject Deleated Sucessfully !";
                lblMsg.CssClass = "alert alert-success";

                GridView1.EditIndex = -1;
                GetTeacherSubject();

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int teacherSubjectId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlClassGV")).SelectedValue;
                string subjectId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlSubjectGV")).SelectedValue;
                string teacherId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlTeacherGV")).SelectedValue;
               // string subjectName = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query(@"Update TeacherSubject set ClassId = '" + classId + "', SubjectId='" + subjectId + "', TeacherId='" + teacherId + "' " + "    where Id ='" + teacherSubjectId + "' ");
                lblMsg.Text = "Record Updated Sucessfully !";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetTeacherSubject();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetTeacherSubject();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)

                {
                    DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClassGV");
                    DropDownList ddlSubject = (DropDownList)e.Row.FindControl("ddlSubjectGV");
                    DataTable dt = fn.Fetch("Select * from Subject where ClassId = '" + ddlClass.SelectedValue + "'");
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "SubjectName";
                    ddlSubject.DataValueField = "SubjectId";
                    ddlSubject.DataBind();
                     ddlSubject.Items.Insert(0, "Select Subject");
                    string teacherSubjectId = GridView1.DataKeys[e.Row.RowIndex].Value.ToString();
                    DataTable dataTable = fn.Fetch(@"Select ts.Id,ts.ClassId,ts.SubjectId, s.SubjectName from TeacherSubject ts
                                                   inner join Subject s on ts.SubjectId = s.SubjectId where ts.Id = '" + teacherSubjectId + "' ");
                    ddlSubject.SelectedValue = dataTable.Rows[0]["SubjectId"].ToString();

                }
            }
        }

        protected void ddlClassGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlClassSelected = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlClassSelected.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)

                {
                    DropDownList ddlSubjectGV = (DropDownList)row.FindControl("ddlSubjectGV");
                    DataTable dt = fn.Fetch("Select * from Subject where ClassId= '" + ddlClassSelected.SelectedValue + "'  ");
                    ddlSubjectGV.DataSource = dt;
                    ddlSubjectGV.DataTextField = "SubjectName";
                    ddlSubjectGV.DataValueField = "SubjectId";
                    ddlSubjectGV.DataBind();
                }
            }
        }
    }
}