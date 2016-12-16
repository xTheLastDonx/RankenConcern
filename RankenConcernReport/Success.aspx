<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Success.aspx.cs" Inherits="Success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    
    <h1>Report submitted successfully!</h1>
    <h3>If you requested feedback you will hear back from us within 15 business days.</h3>
    <p>Please take a moment to write down your Concern ID for reference: <!--CONCERN ID GOES HERE--></p>
        <p>
            <asp:DetailsView ID="DetailsView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
        </p>

    <p>Click below to return to the report page</p>
    <p><asp:Button ID="ButtonBack" runat="server" OnClick="ButtonBack_Click" Text="Back" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RankenConcernConnectionString %>" SelectCommand="SELECT MAX(ConcernId) AS YourConcernID FROM ConcernTable"></asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
