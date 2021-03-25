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
    public partial class VocProgrammeCRUD : System.Web.UI.Page
    {

        SqlConnection sqlcon = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CRUD;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }
        }

        public void Clear()
        {
            hfVocProgID.Value = "";
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
            SqlDataAdapter sqlDa = new SqlDataAdapter("VocationalProgrammeViewAll", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            gvVocProg.DataSource = dtbl;
            gvVocProg.DataBind();

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlCmd = new SqlCommand("VocationalProgrammeCreateOrUpdate", sqlcon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ProgID", (hfVocProgID.Value == "" ? 0 : Convert.ToInt32(hfVocProgID.Value)));
            sqlCmd.Parameters.AddWithValue("@ProgName", txtProgName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@ProgDescrip", txtProgDescription.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@StartDate", DateTime.ParseExact(txtStartDate.Text, "dd/MM/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture));
            sqlCmd.Parameters.AddWithValue("@EndDate", DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture));
            sqlCmd.ExecuteNonQuery();
            sqlcon.Close();
            string ProgID = hfVocProgID.Value;
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
            SqlDataAdapter sqlDa = new SqlDataAdapter("VocationalProgrammeViewByID", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@ProgID", ProgID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            hfVocProgID.Value = ProgID.ToString();
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
            SqlCommand sqlCmd = new SqlCommand("VocationalProgrammeDeleteByID", sqlcon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ProgID", Convert.ToInt32(hfVocProgID.Value));
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

    }
}