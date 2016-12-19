<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <link href="StyleSheet.css"  rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img id="logo" src="RankenLogo.jpg" alt="Ranken Logo" height ="146" width="400" />
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
        <asp:Button ID="ButtonSearch" class="Button" runat="server" OnClick="ButtonSearch_Click" Text="Search" />
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
        <asp:Label ID="LabelSelectFromTable" runat="server" Font-Size="X-Large" Text="Please select a concern from the table below." Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="GridViewID" runat="server" AutoGenerateColumns="False" DataKeyNames="ConcernId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False" OnSelectedIndexChanged="GridViewID_SelectedIndexChanged">
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
            <FooterStyle BackColor="#ed171f" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#ed171f" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFDDDD" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
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
            <FooterStyle BackColor="#ed171f" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#ed171f" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFDDDD" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <br />
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
        <asp:ListView ID="ListViewName" runat="server" DataSourceID="SqlDataSource4" Visible="False">
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
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RankenConcernConnectionString %>" SelectCommand="SELECT [ConcernDetails] FROM [ConcernTable] WHERE ([ConcernId] = @ConcernId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewName" Name="ConcernId" PropertyName="SelectedDataKey.Values[ConcernId]" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <hr />
        <asp:Label ID="LabelActionsTaken" runat="server" Font-Size="X-Large" Text="Actions taken:" Visible="False"></asp:Label>
        
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ActionId" DataSourceID="SqlDataSource5" Visible="False">
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
                        <td>No actions taken yet.</td>
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
                                    <th runat="server">Action ID</th>
                                    <th runat="server">Action Taken</th>
                                    <th runat="server">Resolving Employee</th>
                                    <th runat="server">Concern Resolved?</th>
                                    <th runat="server">Resolution Date</th>
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
        <asp:ListView ID="ListView2" runat="server" DataKeyNames="ActionId" DataSourceID="SqlDataSource6" Visible="False" OnSelectedIndexChanged="ListView2_SelectedIndexChanged">
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
                        <td>No actions taken yet.</td>
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
                                    <th runat="server">Action ID</th>
                                    <th runat="server">Action Taken</th>
                                    <th runat="server">Resolving Employee</th>
                                    <th runat="server">Concern Resolved?</th>
                                    <th runat="server">Resolution Date</th>
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
        <br />
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RankenConcernConnectionString %>" SelectCommand="SELECT [ActionId], [ActionTaken], [ResolvingEmployee], [IsResolved], [DateOfResolution] FROM [Actions] WHERE ([ConcernId] = @ConcernId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxConcernID" Name="ConcernId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:RankenConcernConnectionString %>" SelectCommand="SELECT [ActionId], [ActionTaken], [ResolvingEmployee], [IsResolved], [DateOfResolution] FROM [Actions] WHERE ConcernId = @ConcernId" OnSelecting="SqlDataSource6_Selecting1">
          <selectparameters>
              <asp:controlparameter name="ConcernId" controlid="GridViewName" propertyname="SelectedDataKey.Values[ConcernId]" Type="String"/>
          </selectparameters>
        </asp:SqlDataSource>
        <asp:Label ID="LabelActionTaken" runat="server" Text="Enter your actions taken to resolve the issue here:"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxActionTaken" runat="server" Rows="5" TextMode="MultiLine" Width="635px" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="LabelEmployeeName" runat="server" Text="Enter your name here:"></asp:Label>
        <br />
        <asp:TextBox ID="TextBoxEmployeeName" runat="server" Width="204px" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Will this action provide a resolution to the problem?"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Enabled="False">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Button ID="ButtonSubmit" CssClass="Button" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" Enabled="False" />
        <br />
        <asp:Label ID="LabelSuccess" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
