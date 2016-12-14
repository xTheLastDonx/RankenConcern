<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
</head>
<body>
    <header>
        <img id="logo" src="/images/RankenLogo.jpg" alt="Ranken Logo" height ="146" width="400" />
        <h1 class="title">Concern Report System</h1>
 
    </header>
    <form id="form1" runat="server">
    <div>
    <h2>Search by either Concern ID or Name.</h2>

    </div>
        <asp:Label ID="LabelSearch" runat="server" Text="Search method"></asp:Label>
        <br />
        <asp:RadioButtonList ID="RadioButtonListSearchMethod" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonListSearchMethod_SelectedIndexChanged">
            <asp:ListItem Value="Concern ID"></asp:ListItem>
            <asp:ListItem Value="Name"></asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="LabelConcernID" runat="server" Text="Enter Concern ID"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxConcernID" runat="server" AutoPostBack="False" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LabelName" runat="server" Text="Enter Name"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxName" runat="server" AutoPostBack="False" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RankenConcernConnectionString %>" SelectCommand="SELECT [ConcernId], [Name], [Date], [Phone], [Email], [RelationShip], [ConcernReported], [ConcernMade], [ConcernReason] FROM [ConcernTable] WHERE ([ConcernId] = @ConcernId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxConcernID" Name="ConcernId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RankenConcernConnectionString %>" SelectCommand="SELECT [ConcernId], [Name], [Date], [Phone], [Email], [RelationShip], [ConcernReported], [ConcernMade], [ConcernReason] FROM [ConcernTable] WHERE ([Name] = @Name)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxName" Name="Name" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewID" runat="server" AutoGenerateColumns="False" DataKeyNames="ConcernId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ConcernId" HeaderText="ConcernId" InsertVisible="False" ReadOnly="True" SortExpression="ConcernId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="RelationShip" HeaderText="RelationShip" SortExpression="RelationShip" />
                <asp:BoundField DataField="ConcernReported" HeaderText="ConcernReported" SortExpression="ConcernReported" />
                <asp:BoundField DataField="ConcernMade" HeaderText="ConcernMade" SortExpression="ConcernMade" />
                <asp:BoundField DataField="ConcernReason" HeaderText="ConcernReason" SortExpression="ConcernReason" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:GridView ID="GridViewName" runat="server" AutoGenerateColumns="False" DataKeyNames="ConcernId" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewName_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ConcernId" HeaderText="ConcernId" InsertVisible="False" ReadOnly="True" SortExpression="ConcernId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="RelationShip" HeaderText="RelationShip" SortExpression="RelationShip" />
                <asp:BoundField DataField="ConcernReported" HeaderText="ConcernReported" SortExpression="ConcernReported" />
                <asp:BoundField DataField="ConcernMade" HeaderText="ConcernMade" SortExpression="ConcernMade" />
                <asp:BoundField DataField="ConcernReason" HeaderText="ConcernReason" SortExpression="ConcernReason" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:ListView ID="ListViewID" runat="server" DataSourceID="SqlDataSource3" Visible="False" OnSelectedIndexChanged="ListViewID_SelectedIndexChanged">
            <AlternatingItemTemplate>
                <span style="">ConcernDetails:
                <asp:Label ID="ConcernDetailsLabel" runat="server" Text='<%# Eval("ConcernDetails") %>' />
                <br />
                <br />
                </span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="">ConcernDetails:
                <asp:TextBox ID="ConcernDetailsTextBox" runat="server" Text='<%# Bind("ConcernDetails") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
                <br />
                </span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">ConcernDetails:
                <asp:TextBox ID="ConcernDetailsTextBox" runat="server" Text='<%# Bind("ConcernDetails") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
                <br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="">ConcernDetails:
                <asp:Label ID="ConcernDetailsLabel" runat="server" Text='<%# Eval("ConcernDetails") %>' />
                <br />
                <br />
                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">ConcernDetails:
                <asp:Label ID="ConcernDetailsLabel" runat="server" Text='<%# Eval("ConcernDetails") %>' />
                <br />
                <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RankenConcernConnectionString %>" SelectCommand="SELECT [ConcernDetails] FROM [ConcernTable] WHERE ([ConcernId] = @ConcernId)" OnSelecting="SqlDataSource3_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxConcernID" Name="ConcernId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ActionId" DataSourceID="SqlDataSource5">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="ActionIdLabel" runat="server" Text='<%# Eval("ActionId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ActionTakenLabel" runat="server" Text='<%# Eval("ActionTaken") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ResolvingEmployeeLabel" runat="server" Text='<%# Eval("ResolvingEmployee") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IsResolvedLabel" runat="server" Text='<%# Eval("IsResolved") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateOfResolutionLabel" runat="server" Text='<%# Eval("DateOfResolution") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="ActionIdLabel1" runat="server" Text='<%# Eval("ActionId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ActionTakenTextBox" runat="server" Text='<%# Bind("ActionTaken") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ResolvingEmployeeTextBox" runat="server" Text='<%# Bind("ResolvingEmployee") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IsResolvedTextBox" runat="server" Text='<%# Bind("IsResolved") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DateOfResolutionTextBox" runat="server" Text='<%# Bind("DateOfResolution") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="ActionTakenTextBox" runat="server" Text='<%# Bind("ActionTaken") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ResolvingEmployeeTextBox" runat="server" Text='<%# Bind("ResolvingEmployee") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IsResolvedTextBox" runat="server" Text='<%# Bind("IsResolved") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DateOfResolutionTextBox" runat="server" Text='<%# Bind("DateOfResolution") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="ActionIdLabel" runat="server" Text='<%# Eval("ActionId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ActionTakenLabel" runat="server" Text='<%# Eval("ActionTaken") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ResolvingEmployeeLabel" runat="server" Text='<%# Eval("ResolvingEmployee") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IsResolvedLabel" runat="server" Text='<%# Eval("IsResolved") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateOfResolutionLabel" runat="server" Text='<%# Eval("DateOfResolution") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">ActionId</th>
                                    <th runat="server">ActionTaken</th>
                                    <th runat="server">ResolvingEmployee</th>
                                    <th runat="server">IsResolved</th>
                                    <th runat="server">DateOfResolution</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="ActionIdLabel" runat="server" Text='<%# Eval("ActionId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ActionTakenLabel" runat="server" Text='<%# Eval("ActionTaken") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ResolvingEmployeeLabel" runat="server" Text='<%# Eval("ResolvingEmployee") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IsResolvedLabel" runat="server" Text='<%# Eval("IsResolved") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateOfResolutionLabel" runat="server" Text='<%# Eval("DateOfResolution") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RankenConcernConnectionString %>" SelectCommand="SELECT [ActionId], [ActionTaken], [ResolvingEmployee], [IsResolved], [DateOfResolution] FROM [Actions] WHERE ([ConcernId] = @ConcernId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxConcernID" Name="ConcernId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="ListViewName" runat="server" DataSourceID="SqlDataSource4" Visible="False">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="ConcernDetailsLabel" runat="server" Text='<%# Eval("ConcernDetails") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="ConcernDetailsTextBox" runat="server" Text='<%# Bind("ConcernDetails") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="ConcernDetailsTextBox" runat="server" Text='<%# Bind("ConcernDetails") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="ConcernDetailsLabel" runat="server" Text='<%# Eval("ConcernDetails") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">ConcernDetails</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="ConcernDetailsLabel" runat="server" Text='<%# Eval("ConcernDetails") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RankenConcernConnectionString %>" SelectCommand="SELECT [ConcernDetails] FROM [ConcernTable] WHERE ([Name] = @Name)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxName" Name="Name" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <h1>EVERYTHING BELOW THIS NEEDS TO BE HIDDEN!</h1>
        <asp:Label ID="LabelActionTaken" runat="server" Text="Enter your actions taken to resolve the issue here:"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxActionTaken" runat="server" Rows="5" TextMode="MultiLine" Width="635px"></asp:TextBox>
        <br />
        <asp:Label ID="LabelEmployeeName" runat="server" Text="Enter your name here:"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxEmployeeName" runat="server" Width="204px"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Will this action provide a resolution to the problem?"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Button ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" />
        <br />
        <asp:Label ID="LabelSuccess" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
