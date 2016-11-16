using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace MicroLoanApp
{
    public partial class RegisterEntrepreneur : System.Web.UI.Page
    {
        
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            string FirstName=txtFirstName.Text;
            string LastName=txtLastName.Text;
            //string JobTitle=txtt
            string ShortDescription=txtDescription.Text;
            string Gender=RadioButtonList1.SelectedValue;
            string DateOfBirth=txtDob.Text;
            string Street=txtStreet.Text;
            string City=txtCity.Text;
            string Province=txtProvince.Text;
            string Country = txtCountry.Text;
            string Email=txtEmail.Text;
            string  Username=txtUserName.Text;
            string Password=txtPassword.Text;
            
            //Creating SQL Connection
            SqlConnection conn=new SqlConnection(ConfigurationManager.ConnectionStrings["MicroLoanConnection"].ConnectionString);

            //Create Insert into statement
            string InsertInto = @"INSERT INTO Entrepreneur
           ([FirstName]
           ,[LastName]
           ,[JobTitle]
           ,[ShortDescription]
           ,[Gender]
           ,[DateOfBirth]
           ,[Street]
           ,[City]
           ,[Provice]
           ,[Country]
           ,[Email]
           ,[Username]
           ,[Password])
     VALUES(
            @FirstName
           ,@LastName
           ,@JobTitle
           ,@ShortDescription
           ,@Gender
           ,@DateOfBirth
           ,@Street
           ,@City
           ,@Provice
           ,@Country
           ,@Email
           ,@Username
           ,@Password
            )
Select @@IDENTITY

";
            
            //Connect and save data to the database
           SqlCommand command = new SqlCommand(InsertInto);
           command.CommandType = CommandType.Text;
           command.Connection = conn;
           conn.Open();
           command.Parameters.AddWithValue("@FirstName", FirstName);
           command.Parameters.AddWithValue("@LastName",LastName);
           command.Parameters.AddWithValue("@JobTitle","Entrepreneur");
           command.Parameters.AddWithValue("@ShortDescription",ShortDescription);
           command.Parameters.AddWithValue("@Gender",Gender);
           command.Parameters.AddWithValue("@DateOfBirth",txtDob.Text);
           command.Parameters.AddWithValue("@Street",Street);
           command.Parameters.AddWithValue("@City",City);
           command.Parameters.AddWithValue("@Provice",Province);
           command.Parameters.AddWithValue("@Country",Country);
           command.Parameters.AddWithValue("@Email",Email);
           command.Parameters.AddWithValue("@Username",Username);
           command.Parameters.AddWithValue("@Password",Password);
           int EntrepreneurID= Convert.ToInt32(command.ExecuteScalar());
            conn.Close();
           
            //Populate the session parameter
            Session["EntrepreneurID"] = EntrepreneurID;

            //Redirect to apply loan page
            Session["WelcomeMessage"] = string.Concat("Welcome ", FirstName, LastName, ". You are now logged in as Entrepreneur");
            Response.Redirect("ApplyLoan.aspx");
        }
    }
}