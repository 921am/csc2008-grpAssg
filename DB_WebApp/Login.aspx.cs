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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Name = tbName.Text;
            string Password = tbPwd.Text;
            if (Name == "" || Password == "")
            {
                lblLoginErrorMsg.Text = "Please ensure all fields are filled";
            }
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
            }
            SqlCommand sqlCmd = new SqlCommand("select * from Users where Name=@Name and Password=@Password", sqlcon);
            sqlCmd.Parameters.AddWithValue("@Name", Name);
            sqlCmd.Parameters.AddWithValue("@Password", Password);
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            DataTable dtbl = new DataTable();
            sda.Fill(dtbl);
            sqlCmd.ExecuteNonQuery();
            sqlcon.Close();
            if (dtbl.Rows.Count > 0) { 
                Response.Redirect("User.aspx");
            }
            else { 
                lblLoginErrorMsg.Text = "Your username or password is incorrect.";
            }
        }
    }
}