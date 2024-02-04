using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI
{
    public partial class Missing_Courses : System.Web.UI.Page
    {
        protected void redirectBack(object sender, EventArgs e)
        {
            Response.Redirect("Home Page.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connectfr);
            SqlCommand missing = new SqlCommand("Procedures_ViewMS", conn);
            missing.CommandType = System.Data.CommandType.StoredProcedure;
            conn.Open();
            missing.Parameters.Add(new SqlParameter("@StudentID", Login.idmoment));
            SqlDataReader rdr = missing.ExecuteReader(CommandBehavior.CloseConnection);

            Table tbl = new Table();
            tbl.BorderWidth = Unit.Pixel(1);
            tbl.BorderStyle = BorderStyle.Solid;
            tbl.CellSpacing = 10;
            tbl.CssClass = "styled-table";

            TableRow headerRow = new TableRow();

            TableCell idHeaderCell = new TableCell();
            idHeaderCell.Text = "course_id";
            headerRow.Cells.Add(idHeaderCell);

            TableCell nameHeaderCell = new TableCell();
            nameHeaderCell.Text = "name";
            headerRow.Cells.Add(nameHeaderCell);

            tbl.Rows.Add(headerRow);

            while (rdr.Read())
            {
                int course_id = rdr.GetInt32(rdr.GetOrdinal("course_id"));
                String name = rdr.GetString(rdr.GetOrdinal("name"));

                TableRow row1 = new TableRow();

                TableCell idcell = new TableCell();
                idcell.Text = "" + course_id;
                row1.Cells.Add(idcell);

                TableCell namecell = new TableCell();
                namecell.Text = name;
                row1.Cells.Add(namecell);


                tbl.Rows.Add(row1);
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
    }
}