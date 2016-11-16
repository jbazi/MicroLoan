<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterLender.aspx.cs" Inherits="MicroLoanApp.RegisterLender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="border: 1px; border-style: solid; border-color: Black; width: 80%">
        <tr>
            <td>
                First Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="*" ControlToValidate="txtFirstName"  ForeColor="Red" />
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Last Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="*" ControlToValidate="txtLastName" ForeColor="Red" />
            </td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                About Me   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ErrorMessage="*" ControlToValidate="txtDescription" ForeColor="Red"/>
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
              
            </td>
        </tr>
        <tr>
            <td>
                Gender  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ErrorMessage="*" ControlToValidate="RadioButtonList1" ForeColor="Red" />
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Selected="True">Male</asp:ListItem>
                    <asp:ListItem>FeMale</asp:ListItem>
                </asp:RadioButtonList>
                   
            </td>
        </tr>
        <tr>
            <td>
                Date of Birth   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ErrorMessage="*" ControlToValidate="txtDob" ForeColor="Red" />
            </td>
            <td>
                <asp:TextBox ID="txtDob" runat="server" ></asp:TextBox>
               
            </td>
        </tr>
        <tr>
            <td>
                Street   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage="*" ControlToValidate="txtStreet" ForeColor="Red" />
            </td>
            <td>
                <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
               
            </td>
        </tr>
        <tr>
            <td>
                City  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage="*" ControlToValidate="txtCity" ForeColor="Red" />
            </td>
            <td>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                  
            </td>
        </tr>
        <tr>
            <td>
                Province  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ErrorMessage="*" ControlToValidate="txtProvince" ForeColor="Red" />
            </td> 
            <td>
                <asp:TextBox ID="txtProvince" runat="server"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td>
                Country  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ErrorMessage="*" ControlToValidate="txtCountry" ForeColor="Red" />
            </td>
            </td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                
        </tr>
        <tr>
            <td>
                Email  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                    ErrorMessage="*" ControlToValidate="txtEmail" ForeColor="Red" />
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
               
            </td>
        </tr>
        <tr>
            <td>
                UserName  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                    ErrorMessage="*" ControlToValidate="txtUserName" ForeColor="Red" />
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td>
                Password
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="cmdSubmit" runat="server" Text="Register As Lender" 
                    onclick="cmdSubmit_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
