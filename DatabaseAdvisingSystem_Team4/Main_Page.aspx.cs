using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseAdvisingSystem_Team4
{
	public partial class Main_Page : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}


		protected void Student_Redirect(object sender, EventArgs e)
		{
			Response.Redirect("Login.aspx");
		}
		protected void Admin_Redirect(object sender, EventArgs e)
		{
			Response.Redirect("admin login.aspx");
		}

		protected void Advisor_Redirect(object sender, EventArgs e)
		{
			Response.Redirect("Advisor.aspx");
		}


	}
}