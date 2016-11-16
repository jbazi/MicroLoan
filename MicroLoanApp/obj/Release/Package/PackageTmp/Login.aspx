<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="MicroLoanApp.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <style type="text/css">
    .auto-style1 {
      width: 256px;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    <table>
        <tr>
            <td class="auto-style1">
                UserName
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                    ControlToValidate="txtUserName" ForeColor="Red" />
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                Password
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:RadioButtonList ID="rdLogin" runat="server">
                    <asp:ListItem Value="entr" Text="Login as Entrepreneur" Selected="True"/>
                    <asp:ListItem Value="lend" Text="Login as Lender"/>
                </asp:RadioButtonList>
            </td>
        </tr>

      <tr>
        <td class="auto-style1">
          
          <asp:Button ID ="btnReprocessImages" runat ="server" Text ="Testing" OnClick ="cmdTest_Click" CausesValidation="False"/>
          &nbsp;&nbsp;
          <asp:Label ID="lblLabel" runat="server" ></asp:Label>
        </td>
      </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="cmdSubmit" runat="server" Text="Login" 
                    onclick="cmdSubmit_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
