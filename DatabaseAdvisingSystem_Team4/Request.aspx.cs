//using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace GUI
{
    public partial class Request : System.Web.UI.Page
    {
        DropDownList ddl = new DropDownList();
        protected void redirectBack(object sender, EventArgs e)
        {
            Response.Redirect("Home Page.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connectfr);
            SqlCommand idfinder = new SqlCommand("select* from course", conn);
            idfinder.CommandType = System.Data.CommandType.Text;
            conn.Open();
            SqlDataReader rdr = idfinder.ExecuteReader(CommandBehavior.CloseConnection);
            ddl.Width = 173;
            ddl.Enabled = false;
            ddl.ID = "yourmom";
            courseshere.Controls.Add(ddl);
            ddl.Items.Clear();
            ddl.Items.Add("-- Select Your Course --");
            while (rdr.Read())
            {int course_id = rdr.GetInt32(rdr.GetOrdinal("course_id"));
            String name = rdr.GetString(rdr.GetOrdinal("name"));
            ddl.Items.Add(name);
                ddl.Items.FindByText(name).Value = ""+course_id;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            string wa = workaround.Value;
            string SV = ddl.SelectedValue;

            if (wa == "Add credit hours")
            {
                if (Cred.Text == "")
                { Response.Write("Please pick the credit hours"); }
                else
                {
                    int student = Login.idmoment;
                    int credit = Int16.Parse(Cred.Text);
                    String comment = commentmoment.Text;
                    SqlCommand credreq = new SqlCommand("Procedures_StudentSendingCHRequest", connect);
                    credreq.CommandType = CommandType.StoredProcedure;
                    credreq.Parameters.Add(new SqlParameter("@StudentID", student));
                    credreq.Parameters.Add(new SqlParameter("@credit_hours", credit));
                    credreq.Parameters.Add(new SqlParameter("@type", wa));
                    credreq.Parameters.Add(new SqlParameter("@comment", comment));
                    connect.Open();
                    credreq.ExecuteNonQuery();
                    connect.Close();
                    Response.Write("added");
                }
            }
            else
            {
                if (wa == "Add course")
                {
                    if (SV == "-- Select Your Course --")
                    { Response.Write("Please Choose a Course"); }
                    else
                    {
                        int student = Login.idmoment;
                        int course = Int16.Parse(SV);
                        String comment = commentmoment.Text;
                        SqlCommand coursereq = new SqlCommand("Procedures_StudentSendingCourseRequest", connect);
                        coursereq.CommandType = CommandType.StoredProcedure;
                        coursereq.Parameters.Add(new SqlParameter("@StudentID", student));
                        coursereq.Parameters.Add(new SqlParameter("@courseID", course));
                        coursereq.Parameters.Add(new SqlParameter("@type", wa));
                        coursereq.Parameters.Add(new SqlParameter("@comment", comment));
                        connect.Open();
                        coursereq.ExecuteNonQuery();
                        connect.Close();
                        Response.Write("added");
                        ddl.SelectedIndex = 0;

                    }
                }
            }
        }
    }
}

