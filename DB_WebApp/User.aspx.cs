using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DB_WebApp
{
    public partial class User : System.Web.UI.Page
    {
        
        /// Change connection string here
        /// under your Database, click on properties and find Connection String
        SqlConnection sqlcon = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CRUD;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        public void Clear()
        {
            hfUserID.Value = "";
            txtName.Text = "";
            txtMobile.Text = "";
            txtAddress.Text = "";
            lblErrorMessage.Text = lblSuccessMessage.Text = "";
            btnSave.Text = "Save";
            btnDelete.Enabled = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlCmd = new SqlCommand("UsersCreateOrUpdate", sqlcon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@UserID", (hfUserID.Value == "" ? 0 : Convert.ToInt32(hfUserID.Value)));
            sqlCmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
            sqlCmd.ExecuteNonQuery();
            sqlcon.Close();
            string UserID = hfUserID.Value;
            Clear();
            if (UserID == "")
                lblSuccessMessage.Text = "Saved Successfully";
            else
                lblSuccessMessage.Text = "Updated Successfully";
            FillGridView();
        }

        void FillGridView()
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("UsersViewAll", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            gvUsers.DataSource = dtbl;
            gvUsers.DataBind();

        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int UserID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("UsersViewByID", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            hfUserID.Value = UserID.ToString();
            txtName.Text = dtbl.Rows[0]["Name"].ToString();
            txtMobile.Text = dtbl.Rows[0]["Mobile"].ToString();
            txtAddress.Text = dtbl.Rows[0]["Address"].ToString();
            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlCmd = new SqlCommand("UsersDeleteByID", sqlcon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(hfUserID.Value));
            sqlCmd.ExecuteNonQuery();
            sqlcon.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Successfully";
        }
    }
}