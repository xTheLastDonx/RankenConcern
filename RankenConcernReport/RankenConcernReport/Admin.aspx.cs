using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadioButtonListSearchMethod_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonListSearchMethod.SelectedValue == "Concern ID")
        {
            TextBoxConcernID.Enabled = true;
            TextBoxName.Enabled = false;
            TextBoxName.Text = "";
        }
        else
        {
            TextBoxConcernID.Enabled = false;
            TextBoxName.Enabled = true;
            TextBoxConcernID.Text = "";
        }
        GridViewName.Enabled = false;
        GridViewName.Visible = false;
        GridViewID.Enabled = false;
        GridViewID.Visible = false;

    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        if (RadioButtonListSearchMethod.SelectedValue == "Concern ID")
        {
            GridViewID.Enabled = true;

            GridViewID.Visible = true;

            GridViewName.Enabled = false;

            GridViewName.Visible = false;

            ListViewID.Visible = true;

            ListViewName.Visible = false;

            GridViewID.DataBind();
        }
        else
        {
            GridViewID.Enabled = false;

            GridViewID.Visible = false;

            GridViewName.Enabled = true;

            GridViewName.Visible = true;

            ListViewID.Visible = false;

            ListViewName.Visible = true;

            GridViewName.DataBind();
        }

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ConcernDatabase.mdf;Integrated Security=True"))
        {
            SqlCommand action = new SqlCommand("INSERT INTO Actions(ConcernID, ActionTaken, ResolvingEmployee, IsResolved, DateOfResolution) VALUES  (@ConcernID, @ActionTaken, @ResolvingEmployee, @IsResolved, @DateOfResolution)");
            action.CommandType = CommandType.Text;
            action.Connection = connection;
            var dateAndTime = DateTime.Today;

            if (RadioButtonListSearchMethod.SelectedValue == "Concern ID")
            { 
                action.Parameters.AddWithValue("@ConcernID", Convert.ToInt32(GridViewID.SelectedRow.Cells[1].Text)); 
            }
            else
            {
                action.Parameters.AddWithValue("@ConcernID", Convert.ToInt32(GridViewName.SelectedRow.Cells[1].Text));
            }
            action.Parameters.AddWithValue("@ActionTaken", TextBoxActionTaken.Text);
            action.Parameters.AddWithValue("@ResolvingEmployee", TextBoxEmployeeName.Text);
            action.Parameters.AddWithValue("@IsResolved", RadioButtonList1.SelectedValue);
            action.Parameters.AddWithValue("@DateOfResolution", dateAndTime.Date);

            connection.Open();
            action.ExecuteNonQuery();
            LabelSuccess.Visible = true;
            LabelSuccess.Text = "Action submitted successfully.";
            Response.Redirect("Admin.aspx");
        }
    }

    protected void ListViewID_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridViewName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedName = GridViewName.SelectedRow.Cells[2].Text;
        ListView1.DataBind();
    }

    protected void SqlDataSource6_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}