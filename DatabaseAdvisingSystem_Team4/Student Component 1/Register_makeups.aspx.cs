using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI
{
    public partial class Register_makeups : System.Web.UI.Page
    {
        DropDownList ddl = new DropDownList();
        DropDownList ddl1 = new DropDownList();
        DropDownList ddl2 = new DropDownList();
        protected void redirectBack(object sender, EventArgs e)
        {
            Response.Redirect("Home Page.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connectfr);
            SqlCommand idfinder = new SqlCommand("select* from Course", conn);
            idfinder.CommandType = System.Data.CommandType.Text;
            conn.Open();
            SqlDataReader rdr = idfinder.ExecuteReader(CommandBehavior.CloseConnection);
            ddl1.Width = 173;
            ddl1.ID = "dropdown1";
            courseshere.Controls.Add(ddl1);
            ddl1.Items.Clear();
            ddl1.Items.Add("-- Select Your Course --");

            while (rdr.Read())
            {
                int course_id = rdr.GetInt32(rdr.GetOrdinal("course_id"));
                String name = rdr.GetString(rdr.GetOrdinal("name"));
                ddl1.Items.Add(name);
                ddl1.Items.FindByText(name).Value = "" + course_id;
            }



            SqlConnection conn2 = new SqlConnection(connectfr);
            conn2.Open();
            SqlCommand semestercode = new SqlCommand("select* from Semester", conn2);
            semestercode.CommandType = System.Data.CommandType.Text;

            SqlDataReader rdr2 = semestercode.ExecuteReader(CommandBehavior.CloseConnection);
            ddl2.Width = 173;
            ddl2.ID = "dropdown2";

            semester_code.Controls.Add(ddl2);
            ddl2.Items.Clear();
            ddl2.Items.Add("-- Select Your Semster Code --");

            while (rdr2.Read())
            {
                String semcode = rdr2.GetString(rdr2.GetOrdinal("semester_code"));
                ddl2.Items.Add(semcode);
                ddl2.Items.FindByText(semcode).Value = semcode;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            string wa = workaround.Value;
            string SV = ddl1.SelectedValue;
            String SV2 = ddl2.SelectedValue;


            if (wa == "Register first makeup")
            {

                if (SV == "-- Select Your Course --")/*select count before and after condition to make sure the registration was successful*/
                { Response.Write("Please Choose a Course"); }
                else
                {
                    int student = Login.idmoment;
                    
                    String semester_code = SV2;
                    int course = Int16.Parse(SV);

                    SqlCommand first_makeup = new SqlCommand("Procedures_StudentRegisterFirstMakeup", connect);
                    first_makeup.CommandType = CommandType.StoredProcedure;
                    first_makeup.Parameters.Add(new SqlParameter("@StudentID", student));
                    first_makeup.Parameters.Add(new SqlParameter("@studentCurr_sem", semester_code));
                    first_makeup.Parameters.Add(new SqlParameter("@courseID", course));

                    connect.Open();
                    first_makeup.ExecuteNonQuery();
                    connect.Close();
                    Response.Write("Registered successfully!");
                }
            }
            else
            {
                if (wa == "Register second makeup")
                {
                    if (SV == "-- Select Your Course --")
                    { Response.Write("Please Choose a Course"); }
                    else
                    {
                        int student = Login.idmoment;
                        
                        String semester_code = SV2;
                        int course = Int16.Parse(SV);

                        SqlCommand second_makeup = new SqlCommand("Procedures_StudentRegisterSecondMakeup", connect);
                        SqlCommand check_eligibility = new SqlCommand($" select dbo.FN_StudentCheckSMEligibility({course},{student})", connect);
                        connect.Open();

                        object res = check_eligibility.ExecuteScalar();

                        if (res != null && res != DBNull.Value)
                        {
                            bool succ = Convert.ToBoolean(res);
                            if (succ)
                            {

                                second_makeup.CommandType = CommandType.StoredProcedure;
                                second_makeup.Parameters.Add(new SqlParameter("@StudentID", student));
                                second_makeup.Parameters.Add(new SqlParameter("@studentCurr_sem", semester_code));
                                second_makeup.Parameters.Add(new SqlParameter("@courseID", course));
                                second_makeup.ExecuteNonQuery();
                                Response.Write("Registered successfully");
                            }
                            else
                            {
                                Response.Write("you are ineligible to take a second makeup");

                            }


                        }



                        connect.Close();


                    }
                }
            }

            ddl1.SelectedIndex = 0;
            ddl2.SelectedIndex = 0;

        }
    }
}