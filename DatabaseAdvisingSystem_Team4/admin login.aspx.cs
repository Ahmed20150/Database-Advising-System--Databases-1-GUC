using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            //string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            ////create new connection
            //SqlConnection conn = new SqlConnection(connstr);


            if (username.Text == "1" && passwords.Text == "123")
            {
            
             Response.Redirect("options.aspx");
            
            }
            else
            {

                Response.Write("sorry wrong username or password");
            }
        }
    }
}