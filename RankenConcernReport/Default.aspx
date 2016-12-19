<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Concern Report</title>
    <link href="StyleSheet.css"  rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img id="logo" src="RankenLogo.jpg" alt="Ranken Logo" height ="146" width="400" />
        <h1 class="title">Concern Report System</h1>
 
    </header>
    <form id="form1" runat="server">
    <div>
        <span style="float:left; font-size: 2em; font-weight: bold">Please fill out the information below.</span>
        <asp:Button ID="Button1" style="float: right" runat="server" OnClick="Button1_Click" Text="Admin Login" />
    </div>
        <div style="clear: both;"></div>
        <div>
        <asp:Label ID="LabelName" runat="server" Text="Name"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LabelRelation" runat="server" Text="Relationship to Ranken"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownListRelationship" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListRelationship_SelectedIndexChanged">
            <asp:ListItem Value="Student"></asp:ListItem>
            <asp:ListItem Value="Parent"></asp:ListItem>
            <asp:ListItem Value="Employee"></asp:ListItem>
            <asp:ListItem Value="Faculty"></asp:ListItem>
            <asp:ListItem Value="Other"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <!--Everything in this section is only visible when the reporter is an employee.-->

        <asp:Label ID="LabelEmployee" runat="server" Text="Employee Name"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownListEmployeeNames" runat="server" Enabled="False" OnSelectedIndexChanged="DropDownListEmployeeNames_SelectedIndexChanged">
            <asp:ListItem Value="Don Pohl"></asp:ListItem>
            <asp:ListItem Value="Erica Ellard"></asp:ListItem>
        </asp:DropDownList>
        <br />

        <!--This section is only visible when people require follow-up-->

        <br />
        <asp:CheckBox ID="CheckBoxFollowUp" runat="server" Text="Does your concern require follow-up?" AutoPostBack="True" OnCheckedChanged="CheckBoxFollowUp_CheckedChanged" />
        <br />
        <asp:Label ID="LabelContactInfo" runat="server" Text="Contact Info" Visible="False" Font-Size="Large"></asp:Label>
        <br />
        <asp:Label ID="LabelPhone" runat="server" Text="Phone"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxPhone" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxEmail" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LabelHowWasConcernMade" runat="server" Text="How was the concern initially made?"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownListConcernMade" runat="server">
            <asp:ListItem Value="Phone"></asp:ListItem>
            <asp:ListItem Value="Email"></asp:ListItem>
            <asp:ListItem Value="Letter"></asp:ListItem>
            <asp:ListItem Value="In Person"></asp:ListItem>
            <asp:ListItem Value="Through HLC"></asp:ListItem>
            <asp:ListItem Value="Through This Form"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="LabelReasonForConcern" runat="server" Text="Reason For Concern"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxReasonForConcern" runat="server" EnableTheming="True" MaxLength="100" Rows="2" Width="906px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LabelDetailsOfConcern" runat="server" Text="Concern Details"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxConcernDetails" runat="server" Rows="5" TextMode="MultiLine" Width="906px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LabelSubmit" runat="server" Text="Submit your concern by clicking the button below"></asp:Label>
        <br />
    
        <asp:Button ID="ButtonSubmit" CssClass="Button" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
        <br />
        <asp:Label ID="LabelError" runat="server"></asp:Label>
        <br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RankenConcernConnectionString %>" SelectCommand="SELECT * FROM ConcernTable" InsertCommand="INSERT INTO ConcernTable(Name, Date, Phone, Email, ConcernReported, ConcernMade, ConcernReason, ConcernDetails) VALUES ('@Name'  , '@Date' , '@Phone' , '@Email' ,'@ConcernReported' , '@ConcernMade' ,'@ConcernReason' , '@ConcernDetails')" ></asp:SqlDataSource>
        </div>

    </form>
</body>
</html>
