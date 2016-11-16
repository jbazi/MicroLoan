<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewLoans.aspx.cs" Inherits="MicroLoanApp.ViewLoans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>

<p>Pending Loans</p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        BorderWidth="1px" EmptyDataText="There are no pending loans right now">
    <Columns>
      <asp:BoundField DataField="LoanID" ShowHeader="true" 
            HeaderText="LoanID" Visible="false" />
    <asp:BoundField DataField="EntrepreneurFirstName" ShowHeader="true" 
            HeaderText="Entrepreneur FirstName" />
    <asp:BoundField DataField="EntrepreneurLastName" ShowHeader="true" 
            HeaderText="Entrepreneur Last Name" />
    <asp:BoundField DataField="EntrepreneurDescription" ShowHeader="true" 
            HeaderText="Entrepreneur Description" />
    <asp:BoundField DataField="LoanAmount" ShowHeader="true" HeaderText="Loan Amount" DataFormatString="{0:c}" />
    <asp:BoundField DataField="LoanDescription" ShowHeader="true" 
            HeaderText="Loan Description" />
    <asp:BoundField DataField="LoanAppliedDate" ShowHeader="true" 
            HeaderText="Loan Applied Date" />
 
        <asp:TemplateField HeaderText="Approve Loan">
        <ItemTemplate>
            <asp:CheckBox ID="chkApprove" runat="server"  />
            <asp:Label ID="lblLoanID" runat="server" Visible="false" Text='<%# Eval("LoanID") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
      
    </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
      <asp:Button ID="cmdSubmit" runat="server" Text="Approve Selected Loans" 
        onclick="cmdSubmit_Click" />
        <p>&nbsp;</p>
        <p>Approved Loans</p>
  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
    CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        BorderWidth="1px" EmptyDataText="There are no pending loans right now">
    <Columns>
      <asp:BoundField DataField="LoanID" ShowHeader="true" 
            HeaderText="LoanID" Visible="false" />
    <asp:BoundField DataField="EntrepreneurFirstName" ShowHeader="true" 
            HeaderText="Entrepreneur FirstName" />
    <asp:BoundField DataField="EntrepreneurLastName" ShowHeader="true" 
            HeaderText="Entrepreneur Last Name" />
    <asp:BoundField DataField="EntrepreneurDescription" ShowHeader="true" 
            HeaderText="Entrepreneur Description" />
    <asp:BoundField DataField="LoanAmount" ShowHeader="true" HeaderText="Loan Amount" DataFormatString="{0:c}" />
    <asp:BoundField DataField="LoanDescription" ShowHeader="true" 
            HeaderText="Loan Description" />
    <asp:BoundField DataField="LoanAppliedDate" ShowHeader="true" 
            HeaderText="Loan Applied Date" />
              <asp:BoundField DataField="LoanApprovedDate" ShowHeader="true" 
            HeaderText="Loan Approved Date" />
      
    </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
</asp:Content>

