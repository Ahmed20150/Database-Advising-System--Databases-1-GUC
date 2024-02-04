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
    public partial class Advisor_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void regadvup(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            string name = AvName.Text;
            string password = Password.Text;
            string email = Email.Text;
            string office = Office.Text;
           
                if (AvName.Text == "" || Office.Text == "" || Email.Text == "" || Password.Text == "") { Response.Write("Please fill all the boxes"); }
                else
                {
                    SqlCommand registerproc = new SqlCommand("Procedures_AdvisorRegistration", connect);
                    registerproc.CommandType = CommandType.StoredProcedure;
                    registerproc.Parameters.Add(new SqlParameter("@advisor_name", name));
                    registerproc.Parameters.Add(new SqlParameter("@password", password));
                    registerproc.Parameters.Add(new SqlParameter("@email", email));
                    registerproc.Parameters.Add(new SqlParameter("@office", office));
                    SqlParameter result = registerproc.Parameters.Add("@Advisor_id", SqlDbType.Int);
                    result.Direction = ParameterDirection.Output;
                    connect.Open();
                    registerproc.ExecuteNonQuery();
                    connect.Close();
                    Response.Write("Welcome to the Advising system " + name + ", Your Advisor id is: ");
                    Response.Write(result.Value.ToString());
                }
            }
        protected void Advisor_Redirect(object sender, EventArgs e)
        {
            Response.Redirect("Advisor.aspx");
        }


    }
    }
