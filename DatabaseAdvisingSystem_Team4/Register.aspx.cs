using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace GUI
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void backgo(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void signup(object sender, EventArgs e)
        {
            string connectfr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();
            SqlConnection connect = new SqlConnection(connectfr);
            string first_name = First_name.Text;
            string password = Password.Text;
            string last_name = Last_name.Text;
            string major = Major.Text;
            string email = Email.Text;
            string faculty = Faculty.Text;
            if (Semester.Text == "")
            {Response.Write("Please fill all the boxes");}
            else{int semester = Int16.Parse(Semester.Text);
                if (First_name.Text==""||Last_name.Text==""||Major.Text==""||Faculty.Text==""||Email.Text==""||Password.Text==""){Response.Write("Please fill all the boxes");}
                else{SqlCommand registerproc = new SqlCommand("Procedures_StudentRegistration", connect);
                    registerproc.CommandType = CommandType.StoredProcedure;
                    registerproc.Parameters.Add(new SqlParameter("@first_name", first_name));
                    registerproc.Parameters.Add(new SqlParameter("@password", password));
                    registerproc.Parameters.Add(new SqlParameter("@last_name", last_name));
                    registerproc.Parameters.Add(new SqlParameter("@email", email));
                    registerproc.Parameters.Add(new SqlParameter("@major", major));
                    registerproc.Parameters.Add(new SqlParameter("@faculty", faculty));
                    registerproc.Parameters.Add(new SqlParameter("@Semester", semester));

                    SqlParameter result = registerproc.Parameters.Add("@Student_id", SqlDbType.Int);

                    result.Direction = ParameterDirection.Output;
                    connect.Open();
                    registerproc.ExecuteNonQuery();
                    connect.Close();
                    Response.Write("Welcome to the Advising system " + first_name + ", Your Student id is: ");
                    Response.Write(result.Value.ToString());
                    //SqlCommand registerfunk = new SqlCommand("FN_Studentregister", connect);
                    //registerfunk.CommandType = CommandType.Scalar
                    //registerfunk.Parameters.Add(new SqlParameter(@Student_ID, First_name));
                    //registerfunk.Parameters.Add(new SqlParameter(@password, password));
                }
            }
        }
    }
}