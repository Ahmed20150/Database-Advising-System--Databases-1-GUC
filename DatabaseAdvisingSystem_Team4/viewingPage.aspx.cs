using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseAdvisingSystem_Team4
{
    public partial class viewingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void redirectBack(object sender, EventArgs e)
        {
            Response.Redirect("adminComponent2.aspx");
        }

        protected void redirectViewPayments(object sender, EventArgs e)
        {
            Response.Redirect("student_Payment.aspx");
        }
        protected void redirectViewActiveStudents(object sender, EventArgs e)
        {
            Response.Redirect("active_students.aspx");
        }

        protected void redirectViewGradPlansandAdvisors(object sender, EventArgs e)
        {
            Response.Redirect("grad_plans_and_advisors.aspx");
        }

        protected void redirectViewTranscripts(object sender, EventArgs e)
        {
            Response.Redirect("transcripts.aspx");
        }
        protected void redirectViewOfferedCourseswithSem(object sender, EventArgs e)
        {
            Response.Redirect("OfferedCourses_with_Sem.aspx");
        }







    }
}