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
    <h3>You will hear back from us within 15 business days.</h3>
    <p>Please take a moment to write down your Concern ID for reference: <!--CONCERN ID GOES HERE--></p>
    <p>Click below to return to the report page</p>
    <p><asp:Button ID="ButtonBack" runat="server" OnClick="ButtonBack_Click" Text="Back" /></p>
    </form>
</body>
</html>
