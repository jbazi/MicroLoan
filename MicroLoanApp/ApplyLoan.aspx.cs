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
    public partial class ApplyLoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EntrepreneurID"] == null)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "You must login to the website or create an entrepreneur profile to in order to apply for a loan";
                cmdSubmit.Enabled = false;
            }
            else
            {
                lblMessage.Visible = false;
                cmdSubmit.Enabled = true;
            }

        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            double loadAmount = Convert.ToDouble(txtLoanAmount.Text);
            string loadDesc = txtLoanDescription.Text;
            DateTime loanAppliedDate = DateTime.Now;

            string ApplyloanSQL= @"INSERT INTO [Loan]
           (
           EntrepreneurID
           ,LoanAmount
           ,LoanDescription
           ,LoanAppliedDate
           ,IsActive
           )
     VALUES
            (@EntrepreneurID
            ,@LoanAmount
            ,@LoanDescription
            ,@LoanAppliedDate
            ,@IsActiveLoan
        )
            ";
            //Creating SQL Connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MicroLoanConnection"].ConnectionString);

            //Connect and save data to the database
            SqlCommand command = new SqlCommand(ApplyloanSQL);
            command.CommandType = CommandType.Text;
            command.Connection = conn;
            conn.Open();
            command.Parameters.AddWithValue("@EntrepreneurID", Session["EntrepreneurID"].ToString());
            command.Parameters.AddWithValue("@LoanAmount", loadAmount);
            command.Parameters.AddWithValue("@LoanDescription", loadDesc);
            command.Parameters.AddWithValue("@LoanAppliedDate", loanAppliedDate);
            command.Parameters.AddWithValue("@IsActiveLoan", true);
            command.ExecuteNonQuery();
            conn.Close();

            lblMessage.Text = string.Concat("Your loan application of $",loadAmount," has been successfully received. Thank you. You can apply for a different loan if you so desire.");
            lblMessage.Visible = true;

            txtLoanDescription.Text = "";
            txtLoanAmount.Text = "";
        }
    }
}