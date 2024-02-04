using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using DocumentFormat.OpenXml.Drawing.Charts;

namespace GUI
{
    public partial class Home_Page : System.Web.UI.Page
    {
        
        public bool Exists(string tableName, string tablepkname, string tablepkvalue)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            using (var conn = new SqlConnection(connstr))
            {
                conn.Open();
                string sql = $"SELECT COUNT(*) FROM {tableName} WHERE {tablepkname} = @pkValue";
                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@pkValue", tablepkvalue);
                    object result = cmd.ExecuteScalar();
                    return (int)result > 0;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
            

            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connectfr);
            SqlCommand idfinder = new SqlCommand($"select* from student where student_id={Login.idmoment}", conn);
            idfinder.CommandType = System.Data.CommandType.Text;
            conn.Open();
            SqlDataReader rdr = idfinder.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                String name = rdr.GetString(rdr.GetOrdinal("f_name")) + " " + rdr.GetString(rdr.GetOrdinal("l_name"));
                Decimal gpa = rdr.GetDecimal(rdr.GetOrdinal("gpa"));
                String email = rdr.GetString(rdr.GetOrdinal("email"));
                String major = rdr.GetString(rdr.GetOrdinal("major"));
                String faculty = rdr.GetString(rdr.GetOrdinal("faculty"));
                int acq = rdr.GetInt32(rdr.GetOrdinal("acquired_hours"));
                int ash = rdr.GetInt32(rdr.GetOrdinal("assigned_hours"));
                int advisor = rdr.GetInt32(rdr.GetOrdinal("advisor_id"));
                int semester = rdr.GetInt32(rdr.GetOrdinal("semester"));

                nameholder.InnerHtml = name;
                idholder.InnerHtml = "" + Login.idmoment;
                gpaholder.InnerHtml = "" + gpa;
                emailholder.InnerHtml = email;
                acholder.InnerHtml = "" + acq;
                ashholder.InnerHtml = "" + ash;
                majorholder.InnerHtml = major;
                facholder.InnerHtml = faculty;
                adholder.InnerHtml = "" + advisor;
                semholder.InnerHtml = "" + semester;
            }
            conn.Close();
                SqlCommand phonehold = new SqlCommand($"Select* from Student_Phone where student_id= {Login.idmoment}", conn);
                phonehold.CommandType = System.Data.CommandType.Text;
                conn.Open();
                SqlDataReader rdra = phonehold.ExecuteReader(CommandBehavior.CloseConnection);
                Table tbl = new Table();
                while (rdra.Read())
                {   String phone = rdra.GetString(rdra.GetOrdinal("phone_number"));
                    TableRow row = new TableRow();
                    TableCell pcell = new TableCell();
                    pcell.Text = phone;
                    row.Cells.Add(pcell);
                    tbl.Rows.Add(row);
                }
                phoneholder.Controls.Add(tbl);
                rdra.Close();
                conn.Close();
        }
        protected void Add(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            String phone = PhoneNum.Text;
            if (PhoneNum.Text == "") {PhoneNum.CssClass = "yourmom";}
            else
            {SqlCommand insert = new SqlCommand("Procedures_StudentaddMobile", connect);
            insert.CommandType = CommandType.StoredProcedure;
            insert.Parameters.Add(new SqlParameter("@StudentID", Login.idmoment));
            insert.Parameters.Add(new SqlParameter("@mobile_number", phone));
            if (Exists("Student_Phone", "phone_number", phone)) { PhoneNum.CssClass = "yourmom"; }
            else
            {connect.Open();
            insert.ExecuteNonQuery();
            connect.Close();
            Response.Redirect("Home Page.aspx");
            }
            }
        }
        
        protected void All_Click(object sender, EventArgs e)
        {

        }
        protected void Missing(object sender, EventArgs e)
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
            idHeaderCell.Text = "Course ID";
            headerRow.Cells.Add(idHeaderCell);

            TableCell nameHeaderCell = new TableCell();
            nameHeaderCell.Text = "Name";
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

            ButtnO.Style["visibility"] = "hidden";
            ButtnR.Style["visibility"] = "hidden";
            ButtnA.Style["visibility"] = "hidden";
            tablemomento.Controls.Add(tbl);


            rdr.Close();
            conn.Close();
        }

        protected void Exam(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand gettable = new SqlCommand("select * from Courses_MakeupExams", conn);

            gettable.CommandType = System.Data.CommandType.Text;

            conn.Open();
            SqlDataReader rdr = gettable.ExecuteReader(CommandBehavior.CloseConnection);
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


            ButtnO.Style["visibility"] = "hidden";
            ButtnR.Style["visibility"] = "hidden";
            ButtnA.Style["visibility"] = "hidden";
            tablemomento.Controls.Add(tbl);

            rdr.Close();
            conn.Close();
        }
        protected void Prerequisite(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connp = new SqlConnection(connstr);
            SqlCommand gettable = new SqlCommand("select * from view_Course_prerequisites", connp);

            gettable.CommandType = System.Data.CommandType.Text;

            connp.Open();
            SqlDataReader rdr = gettable.ExecuteReader(CommandBehavior.CloseConnection);
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

            ButtnO.Style["visibility"] = "hidden";
            ButtnR.Style["visibility"] = "hidden";
            ButtnA.Style["visibility"] = "hidden";
            tablemomento.Controls.Add(tbl);




            rdr.Close();
            connp.Close();
        }
        protected void Required(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conna = new SqlConnection(connectfr);
            SqlCommand idfinder = new SqlCommand("select* from semester", conna);
            idfinder.CommandType = System.Data.CommandType.Text;
            conna.Open();
            SqlDataReader rdra = idfinder.ExecuteReader(CommandBehavior.CloseConnection);
            ;
            tablemoment.Controls.Add(ddl);
            ddl.Items.Clear();
            ddl.Items.Add("-- Select Your Semester --");
            while (rdra.Read())
            {
                String sem = rdra.GetString(rdra.GetOrdinal("semester_code"));
                ddl.Items.Add(sem);
                ddl.Items.FindByText(sem).Value = sem;
            }
            ButtnA.Style["visibility"] = "hidden";
            ButtnO.Style["visibility"] = "hidden";
            ButtnR.Style["visibility"] = "visible";
            ddl.Style["visibility"] = "visible";

        }
        protected void Available(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conna = new SqlConnection(connectfr);
            SqlCommand idfinder = new SqlCommand("select* from semester", conna);
            idfinder.CommandType = System.Data.CommandType.Text;
            conna.Open();
            SqlDataReader rdra = idfinder.ExecuteReader(CommandBehavior.CloseConnection);
            ;
            tablemoment.Controls.Add(ddl);
            ddl.Items.Clear();
            ddl.Items.Add("-- Select Your Semester --");
            while (rdra.Read())
            {
                String sem = rdra.GetString(rdra.GetOrdinal("semester_code"));
                ddl.Items.Add(sem);
                ddl.Items.FindByText(sem).Value = sem;
            }
            ButtnO.Style["visibility"] = "hidden";
            ButtnR.Style["visibility"] = "hidden";
            ButtnA.Style["visibility"] = "visible";
            ddl.Style["visibility"] = "visible";

        }
        protected void Phone(object sender, EventArgs e)
        {
            Response.Redirect("Phone.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Request.aspx");
        }


        protected void Optional(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conna = new SqlConnection(connectfr);
            SqlCommand idfinder = new SqlCommand("select* from semester", conna);
            idfinder.CommandType = System.Data.CommandType.Text;
            conna.Open();
            SqlDataReader rdra = idfinder.ExecuteReader(CommandBehavior.CloseConnection);
;
            tablemoment.Controls.Add(ddl);
            ddl.Items.Clear();
            ddl.Items.Add("-- Select Your Semester --");
            while (rdra.Read())
            {
                String sem = rdra.GetString(rdra.GetOrdinal("semester_code"));
                ddl.Items.Add(sem);
                ddl.Items.FindByText(sem).Value = sem;
            }

            ButtnA.Style["visibility"] = "hidden";
            ButtnR.Style["visibility"] = "hidden";
            ButtnO.Style["visibility"] = "visible";
            ddl.Style["visibility"] = "visible";


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String semcode = workaround.Value;
            string connecti = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connecti);
            SqlCommand optional = new SqlCommand("Procedures_ViewOptionalCourse", conn);
            optional.CommandType = System.Data.CommandType.StoredProcedure;
            conn.Open();
            optional.Parameters.Add(new SqlParameter("@StudentID", Login.idmoment));
            
            optional.Parameters.Add(new SqlParameter("@current_semester_code", semcode));
            SqlDataReader rdr = optional.ExecuteReader(CommandBehavior.CloseConnection);

            Table tbl = new Table();
            tbl.BorderWidth = Unit.Pixel(1);
            tbl.BorderStyle = BorderStyle.Solid;
            tbl.CellSpacing = 10;
            tbl.CssClass = "styled-table";

            TableRow headerRow = new TableRow();

            TableCell idHeaderCell = new TableCell();
            idHeaderCell.Text = "Course ID";
            headerRow.Cells.Add(idHeaderCell);

            TableCell nameHeaderCell = new TableCell();
            nameHeaderCell.Text = "Name";
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
            ButtnO.Style["visibility"] = "hidden";
            ddl.Style["visibility"] = "hidden";
            tablemomento.Controls.Add(tbl);


            rdr.Close();
            conn.Close();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            String semcode = workaround.Value;
            string connecti = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connecti);
            SqlCommand optional = new SqlCommand("Procedures_ViewRequiredCourses", conn);
            optional.CommandType = System.Data.CommandType.StoredProcedure;
            conn.Open();
            optional.Parameters.Add(new SqlParameter("@StudentID", Login.idmoment));

            optional.Parameters.Add(new SqlParameter("@current_semester_code", semcode));
            SqlDataReader rdr = optional.ExecuteReader(CommandBehavior.CloseConnection);

            Table tbl = new Table();
            tbl.BorderWidth = Unit.Pixel(1);
            tbl.BorderStyle = BorderStyle.Solid;
            tbl.CellSpacing = 10;
            tbl.CssClass = "styled-table";

            TableRow headerRow = new TableRow();

            TableCell idHeaderCell = new TableCell();
            idHeaderCell.Text = "Course ID";
            headerRow.Cells.Add(idHeaderCell);

            TableCell nameHeaderCell = new TableCell();
            nameHeaderCell.Text = "Name";
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
            ButtnR.Style["visibility"] = "hidden";
            ddl.Style["visibility"] = "hidden";
            tablemomento.Controls.Add(tbl);


            rdr.Close();
            conn.Close();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            string semcode = workaround.Value;
            SqlConnection conn = new SqlConnection(connectfr);
            SqlCommand available = new SqlCommand($"SELECT* FROM dbo.FN_SemsterAvailableCourses({"'" + semcode + "'"})", conn);
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
            idHeaderCell.Text = "Course ID";
            headerRow.Cells.Add(idHeaderCell);

            TableCell nameHeaderCell = new TableCell();
            nameHeaderCell.Text = "Name";
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
            ButtnA.Style["visibility"] = "hidden";
            ddl.Style["visibility"] = "hidden";
            tablemomento.Controls.Add(tbl);


            rdr.Close();
            conn.Close();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            string semcode = workaround.Value;
            SqlConnection conn = new SqlConnection(connectfr);
            SqlCommand available = new SqlCommand($"SELECT* FROM dbo.FN_SemsterAvailableCourses({"'" + semcode + "'"})", conn);
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
            idHeaderCell.Text = "Course ID";
            headerRow.Cells.Add(idHeaderCell);

            TableCell nameHeaderCell = new TableCell();
            nameHeaderCell.Text = "Name";
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
            ButtnA.Style["visibility"] = "hidden";
            ddl.Style["visibility"] = "hidden";
            tablemomento.Controls.Add(tbl);


            rdr.Close();
            conn.Close();
        }

        
    }
}