using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;

namespace DatabaseAdvisingSystem_Team4
{
    public partial class student_Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_Team_4"].ToString();

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand stud_payment = new SqlCommand("SELECT * FROM Student_Payment", conn);

            conn.Open();
            SqlDataReader rdr = stud_payment.ExecuteReader();

            Table tbl = new Table();
            tbl.BorderWidth = Unit.Pixel(1);
            tbl.BorderStyle = BorderStyle.Solid;
            tbl.CellSpacing = 10;
            tbl.CssClass = "styled-table";

            TableRow headerRow = new TableRow();

            headerRow.BackColor = System.Drawing.Color.Red;       

            TableCell idHeaderCell = new TableCell();
            idHeaderCell.Text = "Student ID";
            headerRow.Cells.Add(idHeaderCell);

            TableCell f_nameHeaderCell = new TableCell();
            f_nameHeaderCell.Text = "First Name";
            headerRow.Cells.Add(f_nameHeaderCell);

            TableCell l_nameHeaderCell = new TableCell();
            l_nameHeaderCell.Text = "Last Name";
            headerRow.Cells.Add(l_nameHeaderCell);

            TableCell paymentidCell = new TableCell();
            paymentidCell.Text = "Payment ID";
            headerRow.Cells.Add(paymentidCell);

            TableCell amountCell = new TableCell();
            amountCell.Text = "Amount";
            headerRow.Cells.Add(amountCell);

            TableCell deadlineCell = new TableCell();
            deadlineCell.Text = "Deadline";
            headerRow.Cells.Add(deadlineCell);

            TableCell fundpercCell = new TableCell();
            fundpercCell.Text = "Fund Percentage";
            headerRow.Cells.Add(fundpercCell);

            TableCell numinstallCell = new TableCell();
            numinstallCell.Text = "Number of Installments";
            headerRow.Cells.Add(numinstallCell);

            TableCell semCodeCell = new TableCell();
            semCodeCell.Text = "Semester Code";
            headerRow.Cells.Add(semCodeCell);

            TableCell startdateCell = new TableCell();
            startdateCell.Text = "Start Date";
            headerRow.Cells.Add(startdateCell);

            TableCell statusCell = new TableCell();
            statusCell.Text = "Status ";
            headerRow.Cells.Add(statusCell);

            tbl.Rows.Add(headerRow);    

            while (rdr.Read())
            {
                int student_id = rdr.GetInt32(rdr.GetOrdinal("student_id"));
                String f_name = rdr.GetString(rdr.GetOrdinal("f_name"));
                String l_name = rdr.GetString(rdr.GetOrdinal("l_name"));
                int Payment_ID = rdr.GetInt32(rdr.GetOrdinal("payment_id"));
                int Amount = rdr.GetInt32(rdr.GetOrdinal("amount"));
                DateTime Deadline = (DateTime)rdr.GetSqlDateTime(rdr.GetOrdinal("deadline"));
                decimal Fund_Percentage = (decimal) rdr.GetSqlDecimal(rdr.GetOrdinal("fund_percentage"));  
                int Number_of_Installments = (int) rdr.GetSqlInt32(rdr.GetOrdinal("n_installments"));
                String Semester_Code = rdr.GetString(rdr.GetOrdinal("semester_code"));
                DateTime Start_Date = (DateTime)rdr.GetSqlDateTime(rdr.GetOrdinal("startdate"));
                String Status = rdr.GetString(rdr.GetOrdinal("status"));



                TableRow row1 = new TableRow();

                TableCell cell1 = new TableCell();
                cell1.Text = ""+ student_id;
                row1.Cells.Add(cell1);

                TableCell f_nametablecell1 = new TableCell();
                f_nametablecell1.Text = f_name;
                row1.Cells.Add(f_nametablecell1);

                TableCell l_nametablecell1 = new TableCell();
                l_nametablecell1.Text = l_name;
                row1.Cells.Add(l_nametablecell1);

                TableCell paymentidCell1 = new TableCell();
                paymentidCell1.Text = ""+Payment_ID;
                row1.Cells.Add(paymentidCell1);

                TableCell amountCell1 = new TableCell();
                amountCell1.Text = ""+Amount;
                row1.Cells.Add(amountCell1);

                TableCell deadlineCell1 = new TableCell();
                deadlineCell1.Text = ""+Deadline;
                row1.Cells.Add(deadlineCell1);

                TableCell fundpercCell1 = new TableCell();
                fundpercCell1.Text = ""+ Fund_Percentage;
                row1.Cells.Add(fundpercCell1);

                TableCell numinstallCell1 = new TableCell();
                numinstallCell1.Text = ""+Number_of_Installments;
                row1.Cells.Add(numinstallCell1);

                TableCell semCodeCell1 = new TableCell();
                semCodeCell1.Text = Semester_Code;
                row1.Cells.Add(semCodeCell1);

                TableCell startdateCell1 = new TableCell();
                startdateCell1.Text = ""+ Start_Date;
                row1.Cells.Add(startdateCell1);

                TableCell statusCell1 = new TableCell();
                statusCell1.Text = Status;
                row1.Cells.Add(statusCell1);


                tbl.Rows.Add(row1);
            }

            form1.Controls.Add(tbl);

            Button btn = new Button();
            btn.Text = "Back";
            btn.Click += new EventHandler(redirectBack);
            btn.CssClass = "button";

            form1.Controls.Add(btn);

            rdr.Close();
            conn.Close();



        }

        protected void redirectBack(object sender, EventArgs e)
        {
            Response.Redirect("viewingPage.aspx");
        }
    }
}