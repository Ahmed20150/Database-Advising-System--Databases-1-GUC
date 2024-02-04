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
    public partial class Available_Courses : System.Web.UI.Page
    {
        DropDownList ddl = new DropDownList();
        protected void redirectBack(object sender, EventArgs e)
        {
            Response.Redirect("Home Page.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conna = new SqlConnection(connectfr);
            SqlCommand idfinder = new SqlCommand("select* from semester", conna);
            idfinder.CommandType = System.Data.CommandType.Text;
            conna.Open();
            SqlDataReader rdra = idfinder.ExecuteReader(CommandBehavior.CloseConnection);

            ddl.ID = "yourmom";
            form1.Controls.Add(ddl);
            ddl.Items.Clear();
            ddl.Items.Add("-- Select Your Semester --");
            while (rdra.Read())
            {
                String sem = rdra.GetString(rdra.GetOrdinal("semester_code"));
                ddl.Items.Add(sem);
                ddl.Items.FindByText(sem).Value = sem;
            }


            Button btn = new Button();
            btn.Text = "Back";
            btn.Click += new EventHandler(redirectBack);
            btn.CssClass = "button";

            form1.Controls.Add(btn);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            string semcode = ddl.SelectedValue;
            SqlConnection conn = new SqlConnection(connectfr);
            SqlCommand available = new SqlCommand($"SELECT* FROM dbo.FN_SemsterAvailableCourses({"'"+semcode+"'"})", conn);
            available.CommandType = System.Data.CommandType.Text;
            conn.Open();
            SqlDataReader rdr = available.ExecuteReader(CommandBehavior.CloseConnection);

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

            
            rdr.Close();
            conn.Close();

        }
    }
}