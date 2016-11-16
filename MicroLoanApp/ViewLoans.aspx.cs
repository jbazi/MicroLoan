using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MicroLoanApp
{
    public partial class ViewLoans : System.Web.UI.Page
    {
        int loanCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Get loans from database and populate loancount parameter
                GetActiveLoansFromDatabase();
                
                //Show a list of loans that have already been approved
                GetApprovedLoansFromDatabase();
                if (Session["LenderID"] == null  )
                {
                    lblError.Visible = true;
                    lblError.Text = "You cannot approve any loans because you have not registered as a lender yet";
                    cmdSubmit.Enabled = false;
                }
                else
                {
                    lblError.Visible = false;
                    cmdSubmit.Enabled = true;
                }

                if (loanCount == 0)
                {
                    cmdSubmit.Visible = false;
                }
            }

        }

        private void GetActiveLoansFromDatabase()
        {
            //Get a list of available loans
            string loanSQL = @"SELECT 
                            L.LoanID
                            ,e.FirstName[EntrepreneurFirstName]
		                    ,e.LastName[EntrepreneurLastName]
		                    ,e.ShortDescription [EntrepreneurDescription]
		                    ,L.LoanAmount
		                    ,L.LoanDescription  
		                    ,Convert(VARCHAR,L.LoanAppliedDate,101)[LoanAppliedDate]
        FROM Loan L
        INNER JOIN Entrepreneur E on e.EntrepreneurID=L.EntrepreneurID
        WHERE L.LenderID IS NULL";

            //Creating SQL Connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MicroLoanConnection"].ConnectionString);

            //Execute database command
            SqlCommand command = new SqlCommand(loanSQL);
            command.CommandType = CommandType.Text;
            command.Connection = conn;
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
            loanCount = ds.Tables[0].Rows.Count;
            //Show informaton to the user
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        private void GetApprovedLoansFromDatabase()
        {
            //Get a list of available loans
            string loanSQL = @"SELECT 
                            L.LoanID
                            ,e.FirstName[EntrepreneurFirstName]
		                    ,e.LastName[EntrepreneurLastName]
		                    ,e.ShortDescription [EntrepreneurDescription]
		                    ,L.LoanAmount
		                    ,L.LoanDescription  
		                    ,Convert(VARCHAR,L.LoanAppliedDate,101)[LoanAppliedDate]
                            ,Convert(VARCHAR,L.LoanApprovedDate,101)[LoanApprovedDate]
        FROM Loan L
        INNER JOIN Entrepreneur E on e.EntrepreneurID=L.EntrepreneurID
        WHERE L.LenderID IS NOT NULL AND LoanApprovedDate IS NOT NULL";

            //Creating SQL Connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);

            //Execute database command
            SqlCommand command = new SqlCommand(loanSQL);
            command.CommandType = CommandType.Text;
            command.Connection = conn;
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
           
            //Show informaton to the user
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            //Loop through the loans table to see if any loans have been selected to be approved

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (((CheckBox)row.FindControl("chkApprove")).Checked)
                {
                    string lblLoanID = ((Label)row.FindControl("lblLoanID")).Text;

                    //Set the LOAN as approved in the database
                    string ApproveLoanSQL = @"UPDATE  Loan
                                            SET LenderID= @LenderID, LoanApprovedDate=GETDATE()
                                            WHERE LoanID=@LoanID";
                    //Creating SQL Connection
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);

                    //Execute database command
                    SqlCommand command = new SqlCommand(ApproveLoanSQL);
                    command.Parameters.AddWithValue("@LenderID", Session["LenderID"]);
                    command.Parameters.AddWithValue("@LoanID", lblLoanID);
                    command.CommandType = CommandType.Text;
                    command.Connection = conn;
                    conn.Open();
                    //Save to DB
                    command.ExecuteNonQuery();
                    conn.Close();
                }
            }

            //Update the active loans view that the user sees
            //All approved loans are now removed so that no one else approves it
            GetActiveLoansFromDatabase();
        }
    }
}