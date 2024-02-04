using DocumentFormat.OpenXml.Spreadsheet;
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
    public partial class Login : System.Web.UI.Page
    {
        public static int idmoment;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signup(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            if (ID.Text == "")
            {Response.Write("Please fill all the boxes");}
            else{int id = Int32.Parse(ID.Text);
                idmoment = id;
                string password = Password.Text;
                using (SqlConnection connect = new SqlConnection(connectfr))
                {connect.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT dbo.FN_StudentLogin(@Student_id, @password)", connect))
                    {cmd.Parameters.Add(new SqlParameter("@Student_id", SqlDbType.Int) {Value = id});
                        cmd.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar, 40) {Value = password});
                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {bool success = Convert.ToBoolean(result);
                            if (success)
                            {Response.Redirect("Home Page.aspx");}
                            else{Response.Write("Login failed");}}
                        else{Response.Write("No result returned.");}
                    }
                }
            }
        }
    }
}