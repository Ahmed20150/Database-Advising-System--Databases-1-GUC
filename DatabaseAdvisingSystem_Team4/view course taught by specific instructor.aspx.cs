using DatabaseAdvisingSystem;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DatabaseAdvisingSystem
{
	public partial class view_course_taught_by_specific_instructor : System.Web.UI.Page
	{
		DropDownList ddl1 = new DropDownList();
		DropDownList ddl2 = new DropDownList();
		DropDownList ddl3 = new DropDownList();
		protected void redirectBack(object sender, EventArgs e)
		{
			Response.Redirect("Home Page.aspx");
		}
		protected void Page_Load(object sender, EventArgs e)

		{


			string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();



			SqlConnection conn2 = new SqlConnection(connectfr);
			conn2.Open();
			SqlCommand Instructor = new SqlCommand("select* from Instructor", conn2);
			Instructor.CommandType = System.Data.CommandType.Text;

			SqlDataReader rdr2 = Instructor.ExecuteReader(CommandBehavior.CloseConnection);
			ddl2.Width = 173;
			ddl2.ID = "dropdown2";

			instructor_id.Controls.Add(ddl2);
			ddl2.Items.Clear();
			ddl2.Items.Add("-- Select Your Instructor --");

			while (rdr2.Read())
			{
				int instructorid = rdr2.GetInt32(rdr2.GetOrdinal("instructor_id"));
				String name = rdr2.GetString(rdr2.GetOrdinal("name"));

				ddl2.Items.Add(name);
				ddl2.Items.FindByText(name).Value = "" + instructorid;
			}



			SqlConnection conn = new SqlConnection(connectfr);
			SqlCommand idfinder = new SqlCommand("select* from Course", conn);
			idfinder.CommandType = System.Data.CommandType.Text;
			conn.Open();
			SqlDataReader rdr = idfinder.ExecuteReader(CommandBehavior.CloseConnection);
			ddl1.Width = 173;
			ddl1.ID = "dropdown1";
			courseshere.Controls.Add(ddl1);
			ddl1.Items.Clear();
			ddl1.Items.Add("-- Select Your Course --");

			while (rdr.Read())
			{
				int course_id = rdr.GetInt32(rdr.GetOrdinal("course_id"));
				String name = rdr.GetString(rdr.GetOrdinal("name"));
				ddl1.Items.Add(name);
				ddl1.Items.FindByText(name).Value = "" + course_id;
			}










		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
			SqlConnection connect = new SqlConnection(connectfr);

			string SV = ddl1.SelectedValue;
			String SV2 = ddl2.SelectedValue;




			if (SV == "-- Select Your Course --")
			{ Response.Write("Please Choose a Course"); }
			else if (SV2 == "-- Select Your Instructor --")
			{
				Response.Write("Please Choose an Instructor");
			}
			else
			{
				int course_id = Int16.Parse(SV);
				int instructor_id = Int16.Parse(SV2);


				// SqlConnection conn = new SqlConnection(connstr);
				SqlCommand active_studs = new SqlCommand($"SELECT * FROM dbo.FN_StudentViewSlot({course_id},{instructor_id})", connect);
				active_studs.CommandType = System.Data.CommandType.Text;

				connect.Open();
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


			}




			ddl1.SelectedIndex = 0;
			ddl2.SelectedIndex = 0;

		}
	}
}

