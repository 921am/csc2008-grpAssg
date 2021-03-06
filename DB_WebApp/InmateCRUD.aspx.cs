﻿using System;
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
using System.Text.RegularExpressions;

namespace DB_WebApp
{
    public partial class InmateCRUD : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CRUD;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if logged in
            if (Session["logged_in"] != null)
            {
                if (!IsPostBack)
                {
                    btnDeleteInmate.Enabled = false;
                    FillGridViewWithDecrypted();
                    btnSaveInmate.Visible = false;
                    btnDeleteInmate.Visible = false;

                }
            }
            else
            {
                
                FillGridView();
                Keep();
                
            }
        }

        void Keep()
        {
            txtDateEntered.Visible = false;
            txtDateReleased.Visible = false;
            txtDrugOff.Visible = false;
            txtEnrolled.Visible = false;
            txtGender.Visible = false;
            txtInmateName.Visible = false;
            btnSaveInmate.Visible = false;
            btnClearInmate.Visible = false;
            btnDeleteInmate.Visible = false;
            lblDateEntered.Visible = false;
            lblDateReleased.Visible = false;
            lblDrugOffender.Visible = false;
            lblEnrolled.Visible = false;
            lblGender.Visible = false;
            lblInmateName.Visible = false;
        }

        void Show()
        {
            txtDateEntered.Visible = true;
            txtDateReleased.Visible = true;
            txtDrugOff.Visible = true;
            txtEnrolled.Visible = true;
            txtGender.Visible = true;
            txtInmateName.Visible = true;
            btnSaveInmate.Visible = false;
            btnClearInmate.Visible = true;
            btnDeleteInmate.Visible = false;

            txtDateEntered.Visible = true;
            txtDateReleased.Visible = true;
            txtDrugOff.Visible = true;
            txtEnrolled.Visible = true;
            txtGender.Visible = true;
            txtInmateName.Visible = true;
            btnSaveInmate.Visible = true;
            btnClearInmate.Visible = true;
            btnDeleteInmate.Visible = true;
            lblDateEntered.Visible = true;
            lblDateReleased.Visible = true;
            lblDrugOffender.Visible = true;
            lblEnrolled.Visible = true;
            lblGender.Visible = true;
            lblInmateName.Visible = true;
        }

        void FillGridViewWithDecrypted()
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();


            SqlDataAdapter sqlDa = new SqlDataAdapter("InmatesViewDecrypted", sqlcon);

            SqlDataAdapter sqlDa2 = new SqlDataAdapter("AverageEnroll", sqlcon);

            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa2.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataTable dtbl = new DataTable();
            DataTable dtbl2 = new DataTable();

            sqlDa.Fill(dtbl);
            sqlDa2.Fill(dtbl2);

            sqlcon.Close();
            gvInmate.DataSource = dtbl;
            gvAverage.DataSource = dtbl2;

            gvInmate.DataBind();
            gvAverage.DataBind();

        }

        void FillGridView()
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();

            
            SqlDataAdapter sqlDa = new SqlDataAdapter("InmatesViewEncrypted", sqlcon);
            
            SqlDataAdapter sqlDa2 = new SqlDataAdapter("AverageEnroll", sqlcon);
            
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa2.SelectCommand.CommandType = CommandType.StoredProcedure;
           
            DataTable dtbl = new DataTable();
            DataTable dtbl2 = new DataTable();

            sqlDa.Fill(dtbl);
            sqlDa2.Fill(dtbl2);
            
            sqlcon.Close();
            gvInmate.DataSource = dtbl;
            gvAverage.DataSource = dtbl2;

            gvInmate.DataBind();
            gvAverage.DataBind();

            

        }

        public void Clear()
        {
            hfInmateID.Value = "";
            txtInmateName.Text = "";
            txtGender.Text = "";
            txtDateEntered.Text = "";
            txtDateReleased.Text = "";
            txtDrugOff.Text = "";
            txtEnrolled.Text = "";
            lblErrorMessage.Text = lblSuccessMessage.Text = "";
            btnSaveInmate.Text = "Save";
            btnDeleteInmate.Enabled = false;
            btnSaveInmate.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();

            //validate input
            if (txtInmateName.Text == "" || txtGender.Text == "" || txtDateEntered.Text == "" || txtDateReleased.Text == "")
            {
                lblSuccessMessage.Text = "Please ensure that all fields are filled.";
            }
            else
            {
                SqlCommand sqlCmd = new SqlCommand("InmatesCreateOrUpdate", sqlcon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@inmateID", (hfInmateID.Value == "" ? 0 : Convert.ToInt32(hfInmateID.Value)));
                sqlCmd.Parameters.AddWithValue("@inmateName", txtInmateName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@gender", txtGender.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@DateEntered", DateTime.ParseExact(txtDateEntered.Text, "dd/MM/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture));
                sqlCmd.Parameters.AddWithValue("@DateReleased", DateTime.ParseExact(txtDateReleased.Text, "dd/MM/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture));
                sqlCmd.Parameters.AddWithValue("@DrugOffender", txtDrugOff.Text.Trim());
                sqlCmd.ExecuteNonQuery();
                sqlcon.Close();
                string UserID = hfInmateID.Value;
                Clear();
                if (UserID == "")
                    lblSuccessMessage.Text = "Saved Successfully";
                else
                    lblSuccessMessage.Text = "Updated Successfully";
                FillGridView();
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            btnSaveInmate.Visible = false;
            int inmateID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("InmatesViewByID", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@inmateID", inmateID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            hfInmateID.Value = inmateID.ToString();
            txtInmateName.Text = dtbl.Rows[0]["inmateName"].ToString();
            txtGender.Text = dtbl.Rows[0]["gender"].ToString();
            txtDateEntered.Text = dtbl.Rows[0]["DateEntered"].ToString();
            txtDateReleased.Text = dtbl.Rows[0]["DateReleased"].ToString();
            txtDrugOff.Text = dtbl.Rows[0]["DrugOffender"].ToString();
            txtEnrolled.Text = dtbl.Rows[0]["Enrolled"].ToString();
            btnSaveInmate.Text = "Update";
            btnDeleteInmate.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlCmd = new SqlCommand("InmatesDeleteByID", sqlcon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@inmateID", Convert.ToInt32(hfInmateID.Value));
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