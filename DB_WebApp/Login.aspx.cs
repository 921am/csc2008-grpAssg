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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CRUD;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btn_Login(object sender, EventArgs e)
        {
            string UserId = tbUserId.Text;
            string Password = tbPassword.Text;
            if (UserId == "" || Password == "")
                lblLoginErrorMsg.Text = "Please ensure all fields are filled.";
            else if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlCmd = new SqlCommand("UserRetrieve", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlCmd.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            sqlCmd.SelectCommand.Parameters.AddWithValue("@Password", Password);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCmd.ExecuteNonQuery();
            sqlcon.Close();
            if (dtbl.Rows.Count > 1 )
                Response.Redirect("Redirectform.aspx");
            else
                lblLoginErrorMsg.Text = "Your username or password is incorrect.";  

        }
    }
}