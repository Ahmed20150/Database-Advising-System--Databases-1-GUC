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
    public partial class Pemding_Requests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
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
        public bool Exists1(string tableName, string tablepkname, string tablepkvalue, string tablepkname1, string tablepkvalue1)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            using (var conn = new SqlConnection(connstr))
            {
                conn.Open();
                string sql = $"SELECT COUNT(*) FROM {tableName} WHERE {tablepkname} = @pkValue AND {tablepkname1} = @pkvalue2";
                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@pkValue", tablepkvalue);
                    cmd.Parameters.AddWithValue("@pkValue2", tablepkvalue1);
                    object result = cmd.ExecuteScalar();
                    return (int)result > 0;
                }
            }
        }
        protected void pending(object sender, EventArgs e)
        {

            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand active_studs1 = new SqlCommand("Procedures_AdvisorViewPendingRequests", conn);
            
            active_studs1.CommandType = System.Data.CommandType.StoredProcedure;

            conn.Open();
            active_studs1.Parameters.Add(new SqlParameter("@Advisor_ID", Advisor.curid));

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

            div3.Controls.Add(tbl);


           
            rdr.Close();
            conn.Close();


        }

        protected void allr(object sender, EventArgs e)
        {

            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand active_studs = new SqlCommand($"SELECT * FROM dbo.FN_Advisors_Requests({Advisor.curid})", conn);
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

            div3.Controls.Add(tbl);

            rdr.Close();
            conn.Close();


        }




        protected void redirectBack(object sender, EventArgs e)
        {
            Response.Redirect("Advisor_start_page.aspx");
        }

        protected void chreq(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            string semcod = semcode.Text;
            string reqid = StudID.Text;
            string ad = "" + Advisor.curid;

            if (semcode.Text == "" || StudID.Text == "") { Response.Write("Please fill all the boxes"); }
            else if (!int.TryParse(StudID.Text, out int r)) { Response.Write("ID is not a number"); }
            else if (!Exists("Request", "request_id", reqid)) { Response.Write("ID doesn't exist"); }
            else if (!Exists("Semester", "semester_code", semcod)) { Response.Write("Semester code doesn't exist"); }
            else if (!Exists1("Request", "request_id", reqid, "advisor_id", ad)) { Response.Write("This request isnt associated with you"); }
            else
            {
                SqlCommand registerproc = new SqlCommand("Procedures_AdvisorApproveRejectCHRequest", connect);
                registerproc.CommandType = CommandType.StoredProcedure;
                registerproc.Parameters.Add(new SqlParameter("@requestID", reqid));
                registerproc.Parameters.Add(new SqlParameter("@current_sem_code", semcod));
                
                
                connect.Open();
                registerproc.ExecuteNonQuery();
                connect.Close();
                Response.Write("The request has been reviewed");
            }
        }


        protected void coureq(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            string semcod = Semcode2.Text;
            string reqid = StudID2.Text;
            string ad = "" + Advisor.curid;

            if (Semcode2.Text == "" || StudID2.Text == "") { Response.Write("Please fill all the boxes"); }
            else if (!int.TryParse(StudID2.Text, out int r)) { Response.Write("ID is not a number"); }
            else if (!Exists("Request", "request_id", reqid)) { Response.Write("ID doesn't exist"); }
            else if (!Exists("Semester", "semester_code", semcod)) { Response.Write("Semester code doesn't exist"); }
            else if (!Exists1("Request", "request_id", reqid, "advisor_id", ad)) { Response.Write("This request isnt associated with you"); }
            else
            {
              
                    SqlCommand registerproc = new SqlCommand("Procedures_AdvisorApproveRejectCourseRequest", connect);
                    registerproc.CommandType = CommandType.StoredProcedure;
                    registerproc.Parameters.Add(new SqlParameter("@requestID", reqid));
                    registerproc.Parameters.Add(new SqlParameter("@current_semester_code", semcod));


                    connect.Open();
                    registerproc.ExecuteNonQuery();
                    connect.Close();
                    Response.Write("The request has been reviewed");
                
                
            }
        }
    }
}