using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseAdvisingSystem_Team4
{
    public partial class OfferedCourses_with_Sem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand active_studs = new SqlCommand("SELECT * FROM Semster_offered_Courses", conn);
            active_studs.CommandType = System.Data.CommandType.Text;

            conn.Open();
            SqlDataReader rdr = active_studs.ExecuteReader(CommandBehavior.CloseConnection);


            Table tbl = new Table();
            tbl.BorderWidth = Unit.Pixel(1);
            tbl.BorderStyle = BorderStyle.Solid;
            tbl.CellSpacing = 10;
            tbl.CssClass = "styled-table";

            TableRow headerRow = new TableRow();

            headerRow.BackColor = System.Drawing.Color.Red;


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
            btn.Click += new EventHandler(redirectBack);
            btn.CssClass = "button";

            form1.Controls.Add(btn);

            rdr.Close();
            conn.Close();


        }

        protected void redirectBack(object sender, EventArgs e)
        {
            Response.Redirect("viewingPage.aspx");
        }
    }
}