﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_WebApp
{
    public partial class Inmates : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CRUD;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        } //Page_Load
        protected void btnSave_Click(object sender, EventArgs e)
        {
        } //btnSave_Click

        protected void btnDelete_Click(object sender, EventArgs e)
        {
        } //btnDelete_Click

        protected void btnClear_Click(object sender, EventArgs e)
        {
        } //btnClear_Click

    } //Inmates Class
} //DB_WebApp