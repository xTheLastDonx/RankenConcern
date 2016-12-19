<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Security" %>

<script runat="server">
    void Logon_Click(object sender, EventArgs e)
    {
        if ((Username.Text == "Admin") &&
                (UserPass.Text == "admin"))
        {
            FormsAuthentication.RedirectFromLoginPage
               (Username.Text, Persist.Checked);
        }
        else
        {
            Msg.Text = "Invalid credentials. Please try again.";
        }
    }

    protected void ButtonContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
</script>
<html>
<head id="Head1" runat="server">
  <title>Login</title>
    <link href="StyleSheet.css"  rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img id="logo" src="RankenLogo.jpg" alt="Ranken Logo" height ="146" width="400" />
           <h1 class="title">Concern Report System</h1>
    </header>  
  <form id="form1" runat="server">
    <h1>Welcome to Ranken's Concern Report System</h1>
    <h3>If you would like to submit a concern please click the button below.</h3>
        
        <a href="Default.aspx" class="Button" id="Continue">Continue</a>
      <br />
      <br />
        <hr />
    <h3>Admin Login</h3>
    <table>
      <tr>
        <td>
          Username:</td>
        <td>
          <asp:TextBox ID="Username" runat="server" /></td>
        <td>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            ControlToValidate="Username"
            Display="Dynamic" 
            ErrorMessage="Cannot be empty." 
            runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          Password:</td>
        <td>
          <asp:TextBox ID="UserPass" TextMode="Password" 
             runat="server" />
        </td>
        <td>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
            ControlToValidate="UserPass"
            ErrorMessage="Cannot be empty." 
            runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          Remember me?</td>
        <td>
          <asp:CheckBox ID="Persist" runat="server" /></td>
      </tr>
    </table>
    <asp:Button ID="Submit1" CssClass="Button" OnClick="Logon_Click" Text="Log On" 
       runat="server" />
    <p>
      <asp:Label ID="Msg" ForeColor="red" runat="server" />
    </p>
  </form>
</body>
</html>
