using DatabaseAdvisingSystem;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DatabaseAdvisingSystem
{
    public partial class choose_instructor_for_a_certain_course : System.Web.UI.Page
    {
        DropDownList ddl1 = new DropDownList();
        DropDownList ddl2 = new DropDownList();
        DropDownList ddl3 = new DropDownList();

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
            SqlCommand Instructor = new SqlCommand("select* from Instructor", conn2);
            Instructor.CommandType = System.Data.CommandType.Text;

            SqlDataReader rdr2 = Instructor.ExecuteReader(CommandBehavior.CloseConnection);
            ddl2.Width = 173;
            ddl2.ID = "dropdown2";

            instructor_id.Controls.Add(ddl2);
            ddl2.Items.Clear();
            ddl2.Items.Add("-- Select Your Instructor --");

            while (rdr2.Read())
            {
                int instructorid = rdr2.GetInt32(rdr2.GetOrdinal("instructor_id"));
                String name = rdr2.GetString(rdr2.GetOrdinal("name"));

                ddl2.Items.Add(name);
                ddl2.Items.FindByText(name).Value = "" + instructorid;
            }

            SqlConnection conn3 = new SqlConnection(connectfr);
            conn3.Open();
            SqlCommand semestercode = new SqlCommand("select* from Semester", conn3);
            semestercode.CommandType = System.Data.CommandType.Text;

            SqlDataReader rdr3 = semestercode.ExecuteReader(CommandBehavior.CloseConnection);
            ddl3.Width = 173;
            ddl3.ID = "dropdown3";

            semester_code.Controls.Add(ddl3);
            ddl3.Items.Clear();
            ddl3.Items.Add("-- Select Your Semster Code --");

            while (rdr3.Read())
            {
                String semcode = rdr3.GetString(rdr3.GetOrdinal("semester_code"));
                ddl3.Items.Add(semcode);
                ddl3.Items.FindByText(semcode).Value = semcode;
            }







        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);

            string SV = ddl1.SelectedValue;
            String SV2 = ddl2.SelectedValue;
            String SV3 = ddl3.SelectedValue;





            if (SV == "-- Select Your Course --")
            { Response.Write("Please Choose a Course"); }
            else if (SV2 == "-- Select Your Instructor --")
            {
                Response.Write("Please Choose an Instructor");
            }
            else if (SV3 == "-- Select Your Semster Code --")
            {
                Response.Write("Please Choose the semester code");
            }
            else
            {
                int course_id = Int16.Parse(SV);
                int instructor_id = Int16.Parse(SV2);
                String semester_code = SV3;

                SqlCommand choose_inst = new SqlCommand("Procedures_Chooseinstructor", connect);
                connect.Open();
                choose_inst.CommandType = CommandType.StoredProcedure;
                choose_inst.Parameters.Add(new SqlParameter("@StudentID", GUI.Login.idmoment));
                choose_inst.Parameters.Add(new SqlParameter("@current_semester_code", semester_code));
                choose_inst.Parameters.Add(new SqlParameter("@courseID", course_id));
                choose_inst.Parameters.Add(new SqlParameter("@instrucorID", instructor_id));
                choose_inst.ExecuteNonQuery();
                Response.Write("Done successfully");
                connect.Close();



            }



                ddl1.SelectedIndex = 0;
                ddl2.SelectedIndex = 0;
                ddl3.SelectedIndex = 0;

            }
        
    }
}

