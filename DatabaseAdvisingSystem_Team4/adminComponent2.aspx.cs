using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using Microsoft.SqlServer.Server;
using System.Globalization;

namespace DatabaseAdvisingSystem_Team4
{
    public partial class adminComponent2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            //if (IsPostBack)
            //{
            //    // Set the TextBox value to an empty string
            //    warning.Text = string.Empty;
            //    courseid.Text = string.Empty;
            //    semcode.Text = string.Empty;
            //    makeupcourseid.Text = string.Empty;
            //    paymentID.Text = string.Empty;
            //    studentID_status.Text = string.Empty;
            //    addMakeupdropdown.SelectedValue = "0";
            //    makeupdate.Text = string.Empty;
            //    paymentID.Text = string.Empty;
            //    //studentID_status.Text = string.Empty;


            //}

        }

        protected void Procedures_AdminDeleteCourse( object sender, EventArgs e) //2.3(m) M2, A) M3
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connstr);

            if (courseid.Text == "" || !int.TryParse(courseid.Text, out int result))
            {
                warning.Style["color"] = "red";
                warning.Text = "Please enter a valid courseID";
                return;
            }
            int courseID = Int16.Parse(courseid.Text);

            SqlCommand deleteCourseProc = new SqlCommand("Procedures_AdminDeleteCourse", conn);
            deleteCourseProc.CommandType = CommandType.StoredProcedure;
            deleteCourseProc.Parameters.Add(new SqlParameter("@courseID", courseID));


                conn.Open();
                int rowsAffected = deleteCourseProc.ExecuteNonQuery();
                conn.Close();

            if (rowsAffected == 0)
            {
                warning.Style["color"] = "red";
                warning.Text = "Please enter an existing courseID";

            }
            else
            {
                warning.Style["color"] = "green";
                warning.Text = "Course Successfully Deleted";

            }

        }


        protected void Procedures_AdminDeleteSlots(object sender, EventArgs e) //2.3(P) M2, B) M3
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connstr);

            string sem_code = semcode.Text;
            int chars = sem_code.Length; 

            SqlCommand deleteSemproc = new SqlCommand("Procedures_AdminDeleteSlots", conn);
            deleteSemproc.CommandType = CommandType.StoredProcedure;
            deleteSemproc.Parameters.Add(new SqlParameter("@current_semester", sem_code));

            conn.Open();
            int rowsAffected = deleteSemproc.ExecuteNonQuery();
            conn.Close();


            if (rowsAffected == 0 )
            {
                warning.Style["color"] = "red";
                warning.Text = "Please enter a valid/Existing Slot ID";
            }
            else
            {
                warning.Style["color"] = "green";
                warning.Text = "Slots Successfully Deleted";
            }

        }

        protected void Procedures_AdminAddExam(object sender, EventArgs e) //2.3(P) M2, B) M3
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connstr);


            if (makeupcourseid.Text == "" || !int.TryParse(makeupcourseid.Text, out int result) || !Exists("Course", "course_id", Int16.Parse(makeupcourseid.Text)))
            {
                warning.Style["color"] = "red"; 
                warning.Text = "Please enter a valid courseID";
                return;
            }


            int crsid = Int16.Parse(makeupcourseid.Text);
			int type= int.Parse(addMakeupdropdown.Text); 
            string date = makeupdate.Text;
            string dateFormat = "dd/MM/yyyy";
            string examType = "";

            if (type == 1)
            {
                examType = "First_Makeup";
            }
            else
            {
                examType = "Second_Makeup";
            }



            SqlCommand addMakeupproc = new SqlCommand("Procedures_AdminAddExam", conn);
            addMakeupproc.CommandType = CommandType.StoredProcedure;
            addMakeupproc.Parameters.Add(new SqlParameter("@courseID", crsid));
            addMakeupproc.Parameters.Add(new SqlParameter("@Type", examType));
            addMakeupproc.Parameters.Add(new SqlParameter("@date", date));

                if (!(DateTime.TryParseExact(date, dateFormat, CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime result2)))
                {
                    warning.Style["color"] = "red";
                    warning.Text = "Invalid Date Format Entered";
                }
                else if (type == 0)
                {
                    warning.Style["color"] = "red";
                    warning.Text = "Please choose an Exam Type";
                }
            else if (ExistsMakeupExam(crsid, examType, date))
            {
                warning.Style["color"] = "red";
                warning.Text = "Record already exists";
            }
            else
                {
                    warning.Style["color"] = "green";
                    warning.Text = "Makeup Successfully Added";
                    conn.Open();
                    addMakeupproc.ExecuteNonQuery();
                    conn.Close();
                }
        }

        protected void Procedures_AdminIssueInstallment(object sender, EventArgs e) //2.3(P) M2, B) M3
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connstr);

            if (paymentID.Text == "" || !int.TryParse(paymentID.Text, out int result) || !Exists("Payment", "payment_id", Int16.Parse(paymentID.Text)))
            {
                warning.Style["color"] = "red"; 
                warning.Text = "Please enter a valid Payment ID";
                return;
            }

            int paymentid = Int16.Parse(paymentID.Text);

            try{



            SqlCommand issueInstallmentproc = new SqlCommand("Procedures_AdminIssueInstallment", conn);
            issueInstallmentproc.CommandType = CommandType.StoredProcedure;
            issueInstallmentproc.Parameters.Add(new SqlParameter("@payment_id", paymentid));

                warning.Style["color"] = "green";   
                warning.Text = "Installment Successfully Issued";
                conn.Open();
                issueInstallmentproc.ExecuteNonQuery();
                conn.Close();

			}
            catch (Exception)
            {
                warning.Style["color"] = "red";
				warning.Text = "Installment Already Issued";
			}          
			}

        protected void Procedure_AdminUpdateStudentStatus(object sender, EventArgs e) //2.3(P) M2, B) M3
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection conn = new SqlConnection(connstr);

            if (studentID_status.Text == "" || ! (int.TryParse(studentID_status.Text, out int result))|| !Exists("Student","student_id", Int16.Parse(studentID_status.Text)))
            {
                warning.Style["color"] = "red";
                warning.Text = "Please enter a valid Student ID";
                return;
            }

            int studentID = Int16.Parse(studentID_status.Text);

            SqlCommand updateStudentStatusproc = new SqlCommand("Procedure_AdminUpdateStudentStatus", conn);
            updateStudentStatusproc.CommandType = CommandType.StoredProcedure;
            updateStudentStatusproc.Parameters.Add(new SqlParameter("@student_id", studentID));

                warning.Style["color"] = "green";
                warning.Text = "Status Updated Successfully";
                conn.Open();
                updateStudentStatusproc.ExecuteNonQuery();
                conn.Close();

            
        }
        //helper method that checks if a certain pk in a certain table exists
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

        public bool Exists(string tableName, string tablepkname, string tablepkvalue)
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

		public bool ExistsMakeupExam(int crsid, string type,string date)
		{
			string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
			using (var conn = new SqlConnection(connstr))
			{
				conn.Open();
				string sql = $"SELECT COUNT(*) FROM MakeUp_Exam WHERE course_id = {crsid} and type=@type and date=@date";
				using (var cmd = new SqlCommand(sql, conn))
				{
					cmd.Parameters.AddWithValue("@date", date);
					cmd.Parameters.AddWithValue("@type", type);
					object result = cmd.ExecuteScalar();
					return (int)result > 0;
				}
			}
		}

		protected void ViewpageRedirect(object sender, EventArgs e)
        {
            Response.Redirect("viewingPage.aspx");
        }

		protected void redirectAdminComp1(object sender, EventArgs e)
		{
			Response.Redirect("options.aspx");
		}
	}
}