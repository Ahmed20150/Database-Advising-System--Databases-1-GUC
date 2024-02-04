using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class View_student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Viewall(object sender, EventArgs e)
        {

            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            string maj = major.Text;
            SqlCommand active_studs1 = new SqlCommand("Procedures_AdvisorViewAssignedStudents", conn);

            active_studs1.CommandType = System.Data.CommandType.StoredProcedure;
            if (major.Text == "") { Response.Write("Please fill all the boxes");}
            else
            {
                conn.Open();
                active_studs1.Parameters.Add(new SqlParameter("@AdvisorID", Advisor.curid));
                active_studs1.Parameters.Add(new SqlParameter("@major", maj));

                SqlDataReader rdr = active_studs1.ExecuteReader(CommandBehavior.CloseConnection);


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

                div1.Controls.Add(tbl);



                rdr.Close();
                conn.Close();
            }

        }

        protected void Viewall2(object sender, EventArgs e)
        {

            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr); 
            SqlCommand active_studs1 = new SqlCommand($"select * from Student where advisor_id={Advisor.curid}", conn);
            active_studs1.CommandType = System.Data.CommandType.Text;
            
            conn.Open();

            SqlDataReader rdr = active_studs1.ExecuteReader(CommandBehavior.CloseConnection);


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

            div1.Controls.Add(tbl);



            rdr.Close();
            conn.Close();


        }
        protected void redirectBack(object sender, EventArgs e)
        {
            Response.Redirect("Advisor_start_page.aspx");
        }

    }
}