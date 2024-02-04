using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI
{
    public partial class Phone : System.Web.UI.Page
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
            SqlCommand phonehold = new SqlCommand($"Select* from Student_Phone where student_id= {Login.idmoment}", conn);
            phonehold.CommandType = System.Data.CommandType.Text;
            conn.Open();
            SqlDataReader rdra = phonehold.ExecuteReader(CommandBehavior.CloseConnection);
            Table tbl = new Table();
            while (rdra.Read())
            {
                String phone = rdra.GetString(rdra.GetOrdinal("phone_number"));
                TableRow row = new TableRow();
                TableCell pcell = new TableCell();
                pcell.Text = phone;
                row.Cells.Add(pcell);
                tbl.Rows.Add(row);
            }
            form1.Controls.Add(tbl);
            rdra.Close();
            conn.Close();
        }

        protected void Add(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            String phone = PhoneNum.Text;
            if (PhoneNum.Text == "") { PhoneNum.CssClass = "yourmom"; }
            else
            {   SqlCommand insert = new SqlCommand("Procedures_StudentaddMobile", connect);
                insert.CommandType = CommandType.StoredProcedure;
                insert.Parameters.Add(new SqlParameter("@StudentID", Login.idmoment));
                insert.Parameters.Add(new SqlParameter("@mobile_number", phone));
                if (Exists("Student_Phone", "phone_number", phone)) { Response.Write("This number is already used"); }
                else
                {   connect.Open();
                    insert.ExecuteNonQuery();
                    connect.Close();
                    Response.Redirect("Phone.aspx");
                    PhoneNum.CssClass = "yourdad";
                }
            }
        }
    }
    
}