<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="MicroLoanApp._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome To MicroLoan Application
    </h2>
    <p>
        Helping entrepreneurs in third world countries get loans!
    </p>
    <p>
      Get started! <a href="RegisterEntrepreneur.aspx" > Click here to register as an entrepreneur</a>
    </p>
    <p>
      Get started! <a href="RegisterLender.aspx" > Click here to register as an Lender</a>
    </p>
    <p>
    If you already have a username and password <a href="Login.aspx" >Click here to login</a>
    </p>
  <h1>Testing</h1>
</asp:Content>
