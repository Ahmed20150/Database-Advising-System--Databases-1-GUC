using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseAdvisingSystem
{
    public partial class view_grad_plan : System.Web.UI.Page
    {
        int idmoments = GUI.Login.idmoment;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand active_studs = new SqlCommand($"SELECT * FROM dbo.FN_StudentViewGP({idmoments})", conn);
            active_studs.CommandType = System.Data.CommandType.Text;

            conn.Open();
            SqlDataReader rdr = active_studs.ExecuteReader(CommandBehavior.CloseConnection);
            Table tbl = new Table();
            tbl.BorderWidth = Unit.Pixel(1);
            tbl.BorderStyle = BorderStyle.Solid;
            tbl.CellSpacing = 10;
            tbl.CssClass = "styled-table";

            TableRow headerRow = new TableRow();


            for (int i = 0; i < rdr.FieldCount; i++)
            {
                TableCell headerCell = new TableCell();
                headerCell.Text = rdr.GetName(i);
                headerRow.Cells.Add(headerCell);
            }
            tbl.Rows.Add(headerRow);

            while (rdr.Read())
            {
                TableRow row = new TableRow();

                for (int i = 0; i < rdr.FieldCount; i++)
                {
                    TableCell cell = new TableCell();
                    cell.Text = (rdr.IsDBNull(i) ? "null" : rdr[i].ToString());
                    row.Cells.Add(cell);
                }

                tbl.Rows.Add(row);
            }

            form1.Controls.Add(tbl);

            Button btn = new Button();
            btn.Text = "Back";
            btn.Click += new EventHandler(Back);
            btn.CssClass = "button";

            form1.Controls.Add(btn);

            rdr.Close();
            conn.Close();


        }
        protected void Back(object seso, EventArgs args)
        {
            Response.Redirect("Home Page.aspx");
        }
    }
}