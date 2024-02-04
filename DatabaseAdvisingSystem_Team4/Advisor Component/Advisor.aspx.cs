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
    public partial class Advisor : System.Web.UI.Page
    {
        public static int curid;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Advisor_Login(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            if (ID.Text == "")
            { Response.Write("Please fill all the boxes"); }
            else
            {
                int id = Int32.Parse(ID.Text);
                string password = Password.Text;
                using (SqlConnection connection = new SqlConnection(connectfr))
                {
                    connection.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT dbo.FN_AdvisorLogin(@Advisor_ID, @password)", connection))
                    {
                        cmd.Parameters.Add(new SqlParameter("@Advisor_ID", SqlDbType.Int) { Value = id });
                        cmd.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar, 40) { Value = password });
                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            bool success = Convert.ToBoolean(result);
                            if (success)
                            { Response.Write("Login successful");
                                curid=id;
                                Advisor_start_pageRedirect(sender, e);
                            }
                            else { Response.Write("Login failed"); }
                        }
                        else { Response.Write("No result returned."); }
                    }
                }
            }
        }

        protected void Advisor_start_pageRedirect(object sender, EventArgs e)
        {
            Response.Redirect("Advisor_start_page.aspx");
        }

    }
}