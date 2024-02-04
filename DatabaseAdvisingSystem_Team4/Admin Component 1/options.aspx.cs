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

namespace WebApplication1
{
    public partial class options : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void listing_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminuse.aspx");
        }

        protected void addsem_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connstr);




            string startdate = sdate.Text;
            string enddate = edate.Text;
            string semscode = semcode.Text;

            if (sdate.Text == "" || edate.Text == "" || semcode.Text == "") { Response.Write("Please fill all the boxes"); }
            else if (Exists2("Semester", "semester_code", semscode))
            {
                Response.Write("semester code already exists");
            }
            else
            {
                SqlCommand addsem = new SqlCommand("AdminAddingSemester", conn);
                addsem.CommandType = CommandType.StoredProcedure;

                addsem.Parameters.Add(new SqlParameter("@start_date", startdate));
                addsem.Parameters.Add(new SqlParameter("@end_date", enddate));
                addsem.Parameters.Add(new SqlParameter("@semester_code", semscode));

                conn.Open();
                addsem.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void addc_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connstr);

            string major1 = major.Text;
            int semester1 = Int16.Parse(semester.Text);
            int credit_hours = Int16.Parse(credithour.Text);
            string name1 = name.Text;
            int id_offered = Int16.Parse(offer.Text);

            if (major.Text == "" || semester.Text == "" || credithour.Text == "" || name.Text == "" || offer.Text == "" ||
                !int.TryParse(semester.Text, out int result) || !int.TryParse(credithour.Text, out int result1) || !int.TryParse(offer.Text, out int result2))
            {
                Response.Write("please enter valid input");

            }
            else if ( Exists2("Course", "name", name1))
            {
                Response.Write("please enter valid inputs");
            }
            else {
                Response.Write("Please fill all the boxes");
                SqlCommand addcour = new SqlCommand("Procedures_AdminAddingCourse", conn);
                addcour.CommandType = CommandType.StoredProcedure;

                addcour.Parameters.Add(new SqlParameter("@major", major1));
                addcour.Parameters.Add(new SqlParameter("@semester", semester1));
                addcour.Parameters.Add(new SqlParameter("@credit_hours", credit_hours));
                addcour.Parameters.Add(new SqlParameter("@name", name1));
                addcour.Parameters.Add(new SqlParameter("@is_offered", id_offered));


                conn.Open();
                addcour.ExecuteNonQuery();
                conn.Close();
            }
        }
   




        protected void linkcts_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connstr);




            int courseid = Int16.Parse(course.Text);
            int instructorsid = Int16.Parse(instructor.Text);
            int slotid = Int16.Parse(slot.Text);


            if (!int.TryParse(course.Text, out int result) || !int.TryParse(instructor.Text, out int result1) || !int.TryParse(slot.Text, out int result2))
            {
                Response.Write("please enter valid input");

            }
            else if (!Exists("Slot", "slot_id", slotid))
            {
                Response.Write("already exists");

            }
            else
            {
                SqlCommand addlink = new SqlCommand("Procedures_AdminLinkInstructor", conn);
                addlink.CommandType = CommandType.StoredProcedure;

                addlink.Parameters.Add(new SqlParameter("@cours_id", courseid));
                addlink.Parameters.Add(new SqlParameter("@instructor_id", instructorsid));
                addlink.Parameters.Add(new SqlParameter("@slot_id", slotid));

                conn.Open();
                addlink.ExecuteNonQuery();
                conn.Close();
            }
        }
        protected void libksa_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connstr);




            int student21 = Int16.Parse(student1.Text);
            int advisor21 = Int16.Parse(advisor1.Text);

            if (!int.TryParse(student1.Text, out int result) || !int.TryParse(advisor1.Text, out int result1))
            {
                Response.Write("please enter valid input");

            }
            else if (!Exists("Student", "student_id", student21))
            {
                Response.Write("already exists");

            }
            else { 

                SqlCommand addlink1 = new SqlCommand("Procedures_AdminLinkStudentToAdvisor", conn);
            addlink1.CommandType = CommandType.StoredProcedure;

            addlink1.Parameters.Add(new SqlParameter("@studentID", student21));
            addlink1.Parameters.Add(new SqlParameter("@advisorID", advisor21));


            conn.Open();
            addlink1.ExecuteNonQuery();
            conn.Close();
        }
    }

        protected void linksci_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connstr);




            int courseid = Int16.Parse(course2.Text);
            int instructorid = Int16.Parse(instructor2.Text);
            int studentid = Int16.Parse(student2.Text);
            String semcode = semester2.Text;


            if (!int.TryParse(course2.Text, out int result) || !int.TryParse(instructor2.Text, out int result1) || !int.TryParse(student2.Text, out int result2))
            {
                Response.Write("please enter valid input");

            }
            else if (!Exists("Student", "student_id", studentid))
            {
                Response.Write("already exists");

            }
            else
            {
                SqlCommand addlink2 = new SqlCommand("Procedures_AdminLinkStudent", conn);
                addlink2.CommandType = CommandType.StoredProcedure;

                addlink2.Parameters.Add(new SqlParameter("@cours_id", courseid));
                addlink2.Parameters.Add(new SqlParameter("@instructor_id", instructorid));
                addlink2.Parameters.Add(new SqlParameter("@studentID", studentid));
                addlink2.Parameters.Add(new SqlParameter("@semester_code", semcode));


                conn.Open();
                addlink2.ExecuteNonQuery();
                conn.Close();
            }
        }


        public bool Exists(string tableName, string tablepkname, int tablepkvalue)
        {
            int rowCount = 0;
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connstr);

            using (conn)
            {
                conn.Open();

                string count = $" select COUNT(*) from {tableName} where {tablepkname}={tablepkvalue}";

                using (SqlCommand command = new SqlCommand(count, conn))
                {
                    rowCount = (int)command.ExecuteScalar();
                }
            }

            if (rowCount > 0)
            {
                return true;
            }

            return false;
        }

        public bool Exists2(string tableName, string tablepkname, string tablepkvalue)
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





    }
   

}
