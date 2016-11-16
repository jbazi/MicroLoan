<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApplyLoan.aspx.cs" Inherits="MicroLoanApp.ApplyLoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
<table style="border: 1px; border-style: solid; border-color: Black; width: 80%">
        <tr>
            <td>
                Loan Amount<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="*" ControlToValidate="txtLoanAmount"  ForeColor="Red" />
            </td>
            <td>
                <asp:TextBox ID="txtLoanAmount" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
              What is the purpose of this loan? Please describe<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="*" ControlToValidate="txtLoanDescription" ForeColor="Red" />
            </td>
            <td>
                <asp:TextBox ID="txtLoanDescription" runat="server" TextMode="MultiLine" Height="50px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="cmdSubmit" runat="server" Text="Apply Loan" 
                    onclick="cmdSubmit_Click" />
            </td>
        </tr>
 </table>
</asp:Content>
