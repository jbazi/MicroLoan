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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            string EntrLogin = @"SELECT EntrepreneurID,FirstName,LastName
	                             FROM Entrepreneur
	                              WHERE Username=@UserName AND [Password]=@Password";

            string LenderLogin = @"SELECT LenderID,FirstName,LastName
                                 FROM Lender
                                 WHERE Username=@UserName AND [Password]=@Password";

            //Creating SQL Connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
            SqlCommand command ;
            if(rdLogin.SelectedValue=="entr")
                command = new SqlCommand(EntrLogin);
            else
                command = new SqlCommand(LenderLogin);

            command.CommandType = CommandType.Text;
            command.Connection = conn;
            conn.Open();
            command.Parameters.AddWithValue("@Username", txtUserName.Text);
            command.Parameters.AddWithValue("@Password", txtPassword.Text);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(ds);
            conn.Close();
            if (ds.Tables[0].Rows.Count == 0)
            {
                lblError.Text = "Invalid username or password, please try again!";
            }
            else
            {
                if (rdLogin.SelectedValue == "entr")
                {
                    Session["EntrepreneurID"] = ds.Tables[0].Rows[0]["EntrepreneurID"];
                    Session["WelcomeMessage"] = string.Concat("Welcome ", ds.Tables[0].Rows[0]["FirstName"], ds.Tables[0].Rows[0]["LastName"], ". You are now logged in as Entrepreneur");
                    Response.Redirect("ApplyLoan.aspx");
                }
                else
                {
                    Session["LenderID"] = ds.Tables[0].Rows[0]["LenderID"];
                    Session["WelcomeMessage"] = string.Concat("Welcome ", ds.Tables[0].Rows[0]["FirstName"], ds.Tables[0].Rows[0]["LastName"], ". You are now logged in as Lender");
                    Response.Redirect("ViewLoans.aspx");
                }
            }
        }
      
        protected void cmdTest_Click(object sender, EventArgs e)
        {
          string HelloButton = @"SELECT NULL 
                                FROM dbo.Entrepreneur 
                                where EntrepreneurID =1";

          SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
          SqlCommand command = new SqlCommand();
          command.Connection = conn;
          command.CommandText = HelloButton;
          String FirstName;
          try{
            conn.Open();
            FirstName = Convert.ToString(command.ExecuteScalar());
          
          }
            /*
          catch(Exception e){

          }*/
          finally{
            conn.Close();
          }
          //lblLabel.Text =FirstName;
          
        }
      
    }
}