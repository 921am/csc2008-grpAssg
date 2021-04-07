using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_WebApp
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // check if logged in
            if (Session["logged_in"] != null)
            {
                if (!IsPostBack)
                {
                    ShowPieChart();
                    hardcode();
                }
            }
            else
            {
                Response.Write("Please login to access this page.");
            }
        }

        private void ShowPieChart()
        {
            SqlConnection sqlcon = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CRUD;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();

            string[] arr_category = { "Avg Enrolled Duration", "Avg Not Enrolled Duration" };
            int[] arr_values = { 312, 2313 };

            SqlDataAdapter sqlDa = new SqlDataAdapter("AverageEnroll", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);

            sqlcon.Close();

            

            //for (int i = 0; i < dtbl.Rows.Count; i++)
            //{
            //    arr_values[i] = int.Parse(dtbl.Rows[i][1].ToString());
            //}

            JavaScriptSerializer ser = new JavaScriptSerializer();
            string Category_Names = ser.Serialize(arr_category);
            string Values = ser.Serialize(arr_values);
            string[] arr = { Category_Names, Values };

            
        }

        private void hardcode()
        {
            String chart = "";
            chart += "< script type = \"text/javascript\" >";

            chart += "var linechart = document.getElementById('line').getContext('2d');";
            chart += "var mylinechart = new Chart(linechart, {";
            chart += "    type: 'line',";
            chart += "    data:";
            chart += "        {";
            chart += "        labels: ['001', '002', '003'],";
            chart += "        datasets:";
            chart += "            [{";
            chart += "            label: \"Enrolled duration\",";
            chart += "            data: [12, 32, 4124],";
            chart += "            backgroundColor: 'rgba(6,128,250)'";
            chart += "        }]";
            chart += "    }, options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } }";
            chart += "});";

            chart += "var barchart = document.getElementById('bar').getContext('2d');";
            chart += "var mybarchart = new Chart(barchart, {";
            chart += "    type: 'bar',";
            chart += "    data:";
            chart += "        {";
            chart += "        labels: ['001', '002', '003'],";
            chart += "        datasets:";
            chart += "            [{";
            chart += "            label: \"Enrolled duration\",";
            chart += "            data: [12, 32, 4124],";
            chart += "            backgroundColor: 'rgba(6,128,250)'";
            chart += "        }]";
            chart += "    }, options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } }";
            chart += "});";

            chart += "var piechart = document.getElementById('pie').getContext('2d');";
            chart += "var mypiechart = new Chart(piechart, {";
            chart += "    type: 'pie',";
            chart += "    data:";
            chart += "        {";
            chart += "        labels: ['001', '002', '003'],";
            chart += "        datasets:";
            chart += "            [{";
            chart += "            label: \"Enrolled duration\",";
            chart += "            data: [12, 32, 4124],";
            chart += "            backgroundColor: 'rgba(6,128,250)'";
            chart += "        }]";
            chart += "    }, options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } }";
            chart += "});";

            chart += "</script>";

            //Literal1 text = chart;
        }

    }
}