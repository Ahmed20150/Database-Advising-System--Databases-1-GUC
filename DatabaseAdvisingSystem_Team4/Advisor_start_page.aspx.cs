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
    public partial class Advisor_start_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connectfr);
            SqlCommand idfinder = new SqlCommand($"select * from Advisor where advisor_id={Advisor.curid}", conn);
            idfinder.CommandType = System.Data.CommandType.Text;
            conn.Open();
            SqlDataReader rdr = idfinder.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                String name = rdr.GetString(rdr.GetOrdinal("advisor_name"));
                String email = rdr.GetString(rdr.GetOrdinal("email"));
                String major = rdr.GetString(rdr.GetOrdinal("office"));
               ;

                nameholder.InnerHtml = name;
                idholder.InnerHtml = "" + Advisor.curid;
                emailholder.InnerHtml = email;
                semholder.InnerHtml = "" + major;
            }
            conn.Close();
           
        }

        protected void Advisor_request_Redirect(object sender, EventArgs e)
        {
            Response.Redirect("Advisor_request.aspx");
        }
    }
}