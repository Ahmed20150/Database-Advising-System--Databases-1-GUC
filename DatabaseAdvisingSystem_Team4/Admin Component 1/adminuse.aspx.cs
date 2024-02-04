using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication1
{
    public partial class adminuse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void listadvisors_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand listadvisor = new SqlCommand("Procedures_AdminListAdvisors", conn);
            listadvisor.CommandType = CommandType.Text;

            conn.Open();
            SqlDataReader rdr = listadvisor.ExecuteReader(CommandBehavior.CloseConnection);


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

            //Button btn = new Button();
            //btn.Text = "Back";
            //btn.Click += new EventHandler(redirectBack);
            //btn.CssClass = "button";

            //form1.Controls.Add(btn);

            rdr.Close();
            conn.Close();

        }

        protected void stad_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand listadvisor = new SqlCommand("AdminListStudentsWithAdvisors", conn);
            listadvisor.CommandType = CommandType.Text;

            conn.Open();
            SqlDataReader rdr = listadvisor.ExecuteReader(CommandBehavior.CloseConnection);


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

            //Button btn = new Button();
            //btn.Text = "Back";
            //btn.Click += new EventHandler(redirectBack);
            //btn.CssClass = "button";

            //form1.Controls.Add(btn);

            rdr.Close();
            conn.Close();
        }

        protected void pending_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand listadvisor = new SqlCommand("SELECT * FROM all_Pending_Requests", conn);
            listadvisor.CommandType = CommandType.Text;

            conn.Open();
            SqlDataReader rdr = listadvisor.ExecuteReader(CommandBehavior.CloseConnection);


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

            //Button btn = new Button();
            //btn.Text = "Back";
            //btn.Click += new EventHandler(redirectBack);
            //btn.CssClass = "button";

            //form1.Controls.Add(btn);

            rdr.Close();
            conn.Close();
        }

        protected void intructorcourse_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand listadvisor = new SqlCommand("SELECT * FROM Instructors_AssignedCourses", conn);
            listadvisor.CommandType = CommandType.Text;

            conn.Open();
            SqlDataReader rdr = listadvisor.ExecuteReader(CommandBehavior.CloseConnection);


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

            //Button btn = new Button();
            //btn.Text = "Back";
            //btn.Click += new EventHandler(redirectBack);
            //btn.CssClass = "button";

            //form1.Controls.Add(btn);

            rdr.Close();
            conn.Close();
        }

        protected void semestercourse_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand listadvisor = new SqlCommand("SELECT * FROM Semster_offered_Courses", conn);
            listadvisor.CommandType = CommandType.Text;

            conn.Open();
            SqlDataReader rdr = listadvisor.ExecuteReader(CommandBehavior.CloseConnection);


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

            //Button btn = new Button();
            //btn.Text = "Back";
            //btn.Click += new EventHandler(redirectBack);
            //btn.CssClass = "button";

            //form1.Controls.Add(btn);

            rdr.Close();
            conn.Close();
        }
    }
}