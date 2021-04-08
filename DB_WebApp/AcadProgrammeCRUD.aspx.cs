using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace DB_WebApp
{
    public partial class AcadProgrammeCRUD : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CRUD;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            // check if logged in
            if (Session["logged_in"] != null)
            {
                if (!IsPostBack)
                {
                    btnDelete.Enabled = false;
                    FillGridView();
                }
            }
            else
            {
                Response.Write("<span style= 'color:red'>Please Login as Admin to view more</span>");
                gvAcadProg.Visible = false;
            }
        }

        public void Clear()
        {
            hfAcadProgID.Value = "";
            txtProgName.Text = "";
            txtProgDescription.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            lblErrorMessage.Text = lblSuccessMessage.Text = "";
            btnSave.Text = "Save";
            btnDelete.Enabled = false;
        }

        void FillGridView()
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("AcadProgrammeViewAll", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            gvAcadProg.DataSource = dtbl;
            gvAcadProg.DataBind();

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlCmd = new SqlCommand("AcadProgrammeCreateOrUpdate", sqlcon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ProgID", (hfAcadProgID.Value == "" ? 0 : Convert.ToInt32(hfAcadProgID.Value)));
            sqlCmd.Parameters.AddWithValue("@ProgName", txtProgName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@ProgDescrip", txtProgDescription.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@StartDate", DateTime.ParseExact(txtStartDate.Text, "dd/MM/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture));
            sqlCmd.Parameters.AddWithValue("@EndDate", DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture));
            sqlCmd.ExecuteNonQuery();
            sqlcon.Close();
            string ProgID = hfAcadProgID.Value;
            Clear();
            if (ProgID == "")
                lblSuccessMessage.Text = "Saved Successfully";
            else
                lblSuccessMessage.Text = "Updated Successfully";
            FillGridView();
        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int ProgID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("AcadProgrammeViewByID", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@ProgID", ProgID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            hfAcadProgID.Value = ProgID.ToString();
            txtProgName.Text = dtbl.Rows[0]["ProgName"].ToString();
            txtProgDescription.Text = dtbl.Rows[0]["ProgDescrip"].ToString();
            txtStartDate.Text = dtbl.Rows[0]["StartDate"].ToString();
            txtEndDate.Text = dtbl.Rows[0]["EndDate"].ToString();
            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlCmd = new SqlCommand("AcadProgrammeDeleteByID", sqlcon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ProgID", Convert.ToInt32(hfAcadProgID.Value));
            sqlCmd.ExecuteNonQuery();
            sqlcon.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Successfully";
        }

        protected void btnAcadProg_Click(object sender, EventArgs e)
        {
            Response.Redirect("AcadProgrammeCRUD.aspx");
        }

        protected void btnDrugRehab_Click(object sender, EventArgs e)
        {
            Response.Redirect("DrugRehabCRUD.aspx");
        }

        protected void btnVocProg_Click(object sender, EventArgs e)
        {
            Response.Redirect("VocProgrammeCRUD.aspx");
        }

        protected void btnInmates_Click(object sender, EventArgs e)
        {
            Response.Redirect("InmateCRUD.aspx");
        }

        protected void btnUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx");
        }
        protected void btnInmateProgress_Click(object sender, EventArgs e)
        {
            Response.Redirect("InmateProgress.aspx");
        }
    }
}