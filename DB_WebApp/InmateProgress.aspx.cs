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
    public partial class InmateProgress : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CRUD;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //btnDeleteInmate.Enabled = false;
                FillGridView();
            }
        }

        void FillGridView()
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("InmateProgressViewAll", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            gvInmateProgress.DataSource = dtbl;
            gvInmateProgress.DataBind();

        }

        public void Clear()
        {
            hfInmateProgressID.Value = "";
            
            lblErrorMessage.Text = lblSuccessMessage.Text = "";
            //btnSaveInmate.Text = "Save";
            //btnDeleteInmate.Enabled = false;
        }


        //protected void btnSave_Click(object sender, EventArgs e)
        //{

        //}

        //protected void btnClear_Click(object sender, EventArgs e)
        //{
        //    Clear();
        //}

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int InmateProgressID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("InmateProgressViewByID", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@InmateProgressID", InmateProgressID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            hfInmateProgressID.Value = InmateProgressID.ToString();
            txtInmateID.Text = dtbl.Rows[0]["InmateID"].ToString();
            txtRehabProgID.Text = dtbl.Rows[0]["RehabProgID"].ToString();
            txtAcadProgID.Text = dtbl.Rows[0]["AcadProgID"].ToString();
            txtVocProgID.Text = dtbl.Rows[0]["VocProgID"].ToString();

        }

        //protected void btnDelete_Click(object sender, EventArgs e)
        //{

        //}

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