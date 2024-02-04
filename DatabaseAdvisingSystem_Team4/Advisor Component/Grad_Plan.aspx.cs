using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Globalization;

namespace WebApplication1
{
    public partial class Grad_Plan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
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

        public bool Exist2(string tablepkname, string tablepkvalue, string tablepkname1, string tablepkvalue1, string tablepkname2, string tablepkvalue2)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            using (var conn = new SqlConnection(connstr))
            {
                conn.Open();
                string sql = $"SELECT plan_id FROM Graduation_Plan WHERE {tablepkname} = @pkValue";
                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@pkValue", tablepkvalue);
                    object result = cmd.ExecuteScalar();
                    int plid = (int)result;
                    string sql2= $"SELECT COUNT(*) FROM GradPlan_Course WHERE {tablepkname1} = @pkValue2 AND {tablepkname1} = @pkValue2";
                    using (var cmd2 = new SqlCommand(sql2, conn))
                    {
                        cmd.Parameters.AddWithValue("@pkValue2", tablepkvalue1);
                        object result2 = cmd.ExecuteScalar();
                        return (int)result2 > 0;
                    }
                    
                }
            }
        }
        public int can(string tableName)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            using (var conn = new SqlConnection(connstr))
            {
                
                conn.Open();
                string sql = $"SELECT count(*) FROM {tableName}";
                using (var cmd = new SqlCommand(sql, conn))
                {
                   
                    object result = cmd.ExecuteScalar();
                    return (int)result;
                }
            }
        }
        public bool Exists1(string tableName, string tablepkname, string tablepkvalue, string tablepkname1, string tablepkvalue1)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            using (var conn = new SqlConnection(connstr))
            {
                conn.Open();
                string sql = $"SELECT COUNT(*) FROM {tableName} WHERE {tablepkname} = @pkValue AND {tablepkname1} = @pkvalue2";
                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@pkValue", tablepkvalue);
                    cmd.Parameters.AddWithValue("@pkValue2", tablepkvalue1);
                    object result = cmd.ExecuteScalar();
                    return (int)result > 0;
                }
            }
        }
        protected void newgrad(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            string semcod = semcode.Text;
            string egd = EGD.Text;
            string sch = SCH.Text;
            string studid = StudID.Text;
            string dateFormat = "dd/MM/yyyy";
            string ad = ""+Advisor.curid;
            if (semcode.Text == "" || EGD.Text == "" || SCH.Text == "" || StudID.Text == "") { Response.Write("Please fill all the boxes"); }
            else if (!int.TryParse(SCH.Text,out int r)) { Response.Write("Semester Credit Hours must be a number"); }
            else if(!(DateTime.TryParseExact(egd, dateFormat, CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime result2))){ Response.Write("Wrong date format must be dd/MM/yyyy");}
            else if (!int.TryParse(StudID.Text, out int r2)) { Response.Write("ID is not a number"); }
            else if(!Exists("Student", "student_id", studid)) { Response.Write("ID doesn't exist"); }
            else if(!Exists1("Student", "student_id", studid, "advisor_id", ad)) { Response.Write("This student isnt associated with you"); }
            else if(Exists1("Graduation_Plan","student_id", studid, "semester_code", semcod)) { Response.Write("This grad plan does exists"); }
            else
            {
                int countb = can("Graduation_Plan");
                SqlCommand registerproc = new SqlCommand("Procedures_AdvisorCreateGP", connect);
                registerproc.CommandType = CommandType.StoredProcedure;
                registerproc.Parameters.Add(new SqlParameter("@Semester_code", semcod));
                registerproc.Parameters.Add(new SqlParameter("@expected_graduation_date", egd));
                registerproc.Parameters.Add(new SqlParameter("@sem_credit_hours", sch));
                registerproc.Parameters.Add(new SqlParameter("@advisor_id", Advisor.curid));
                registerproc.Parameters.Add(new SqlParameter("@student_id", studid));


                connect.Open();
                registerproc.ExecuteNonQuery();
                connect.Close();
                int counta = can("Graduation_Plan");
                if (countb < counta)
                    Response.Write("The graduation plan has been added");
                else
                    Response.Write("The student doesnt have enough credit hours");

            }

        }
        protected void newcougrad(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            string studid = StudID2.Text;
            string semcod = Semcode2.Text;
            string counam = CouNam.Text;
            string ad = "" + Advisor.curid;

            if (StudID2.Text == "" || Semcode2.Text == "" || CouNam.Text == "") { Response.Write("Please fill all the boxes"); }
            else if (!int.TryParse(StudID2.Text, out int r2)) { Response.Write("ID is not a number"); }
            else if (!Exists("Student", "student_id", studid)) { Response.Write("ID doesn't exist"); }
            else if (!Exists1("Student", "student_id", studid, "advisor_id", ad)) { Response.Write("This student isnt associated with you"); }
            else if (!Exists1("Graduation_Plan", "student_id", studid, "semester_code", semcod)) { Response.Write("This grad plan doesnt exists"); }
            else if (!Exists("Course", "name", counam)) { Response.Write("This Course doesn't exist"); }
            else
            {
                try
                {
                    SqlCommand registerproc = new SqlCommand("Procedures_AdvisorAddCourseGP", connect);
                    registerproc.CommandType = CommandType.StoredProcedure;
                    registerproc.Parameters.Add(new SqlParameter("@student_id", studid));
                    registerproc.Parameters.Add(new SqlParameter("@Semester_code", semcod));
                    registerproc.Parameters.Add(new SqlParameter("@course_name", counam));

                    connect.Open();
                    registerproc.ExecuteNonQuery();
                    connect.Close();
                    Response.Write("The course has been added");
                }
                catch (SqlException) { Response.Write("This course already exists"); }


            }
        }
        protected void updategrad(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            string egd = EGD2.Text;
            string studid = StudID3.Text;
            string dateFormat = "dd/MM/yyyy";
            string ad = "" + Advisor.curid;

            if (EGD2.Text == "" || StudID3.Text == "" ) { Response.Write("Please fill all the boxes"); }
            else if (!int.TryParse(StudID3.Text, out int r)) { Response.Write("ID is not a number"); }
            else if (!Exists("Student", "student_id", studid)) { Response.Write("ID doesn't exist"); }
            else if (!Exists1("Student", "student_id", studid, "advisor_id", ad)) { Response.Write("This student isnt associated with you"); }
            else if (!(DateTime.TryParseExact(egd, dateFormat, CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime result2))) { Response.Write("Wrong date format must be dd/MM/yyyy"); }
            else if (!Exists("Graduation_Plan", "student_id", studid)) { Response.Write("ID doesn't have a grad plan"); }
            else
            {
                SqlCommand registerproc = new SqlCommand("Procedures_AdvisorUpdateGP", connect);
                registerproc.CommandType = CommandType.StoredProcedure;
                registerproc.Parameters.Add(new SqlParameter("@expected_grad_date", egd));
                registerproc.Parameters.Add(new SqlParameter("@studentID", studid));
                connect.Open();
                registerproc.ExecuteNonQuery();
                connect.Close();
                Response.Write("The dates has been updated");

            }
        }

        protected void deletecou(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            string studid = StudID4.Text;
            string semcod = Semcode4.Text;
            string couId = CouID4.Text;
            string ad = "" + Advisor.curid;

            if (StudID4.Text == "" || Semcode4.Text == "" || CouID4.Text == "") { Response.Write("Please fill all the boxes"); }
            else if (!int.TryParse(StudID4.Text, out int r)) { Response.Write("ID is not a number");}
            else if (!int.TryParse(CouID4.Text, out int r2)) { Response.Write("ID is not a number");}
            else if (!Exists("Student", "student_id", studid)) { Response.Write("ID doesn't exist");}
            else if (!Exists1("Student", "student_id", studid, "advisor_id", ad)) { Response.Write("This student isnt associated with you"); }
            else if (!Exists1("Graduation_Plan", "student_id", studid, "semester_code", semcod)) { Response.Write("This grad plan doesnt exists");}
            else if (!Exists("Course", "course_id", couId)) { Response.Write("This Course doesn't exist");}
            else
            {
                int countb = can("GradPlan_Course");
                SqlCommand registerproc = new SqlCommand("Procedures_AdvisorDeleteFromGP", connect);
                registerproc.CommandType = CommandType.StoredProcedure;
                registerproc.Parameters.Add(new SqlParameter("@studentID", studid));
                registerproc.Parameters.Add(new SqlParameter("@sem_code", semcod));
                registerproc.Parameters.Add(new SqlParameter("@courseID", couId));

                connect.Open();
                registerproc.ExecuteNonQuery();
                connect.Close();
                int counta = can("GradPlan_Course");
                if (countb > counta)
                    Response.Write("The course has been deleted");
                else
                    Response.Write("This course doesnt exist in this grad plan ");
                

            }
        }
    }
}