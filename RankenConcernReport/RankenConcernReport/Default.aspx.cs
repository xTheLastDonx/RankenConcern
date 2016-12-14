using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CheckBoxFollowUp_CheckedChanged(object sender, EventArgs e)
    {
        TextBoxPhone.Enabled = CheckBoxFollowUp.Checked;
        TextBoxEmail.Enabled = CheckBoxFollowUp.Checked;
    }

    protected void DropDownListRelationship_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListRelationship.SelectedValue == "Employee")
        {
            DropDownListEmployeeNames.Enabled = true;
        }
        else
        {
            DropDownListEmployeeNames.Enabled = false;
        }
    }

    protected void DropDownListEmployeeNames_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ConcernDatabase.mdf;Integrated Security=True"))
        {
            SqlCommand concern = new SqlCommand("INSERT INTO ConcernTable(Name, Date, Phone, Email, Relationship, ConcernReported, ConcernMade, ConcernReason, ConcernDetails) VALUES  (@Name, @Date, @Phone, @Email, @Relationship, @ConcernReported, @ConcernMade, @ConcernReason, @ConcernDetails)");
            concern.CommandType = CommandType.Text;
            concern.Connection = connection;
            var dateAndTime = DateTime.Today;

            concern.Parameters.AddWithValue("@Name", TextBoxName.Text);
            concern.Parameters.AddWithValue("@Date", dateAndTime.Date);
            concern.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
            concern.Parameters.AddWithValue("@Phone", TextBoxPhone.Text);
            concern.Parameters.AddWithValue("@Relationship", DropDownListRelationship.SelectedValue);
            concern.Parameters.AddWithValue("@ConcernReported", DropDownListEmployeeNames.SelectedValue);
            concern.Parameters.AddWithValue("@ConcernMade", DropDownListConcernMade.SelectedValue);
            concern.Parameters.AddWithValue("@ConcernReason", TextBoxReasonForConcern.Text);
            concern.Parameters.AddWithValue("@ConcernDetails", TextBoxConcernDetails.Text);

            connection.Open();
            concern.ExecuteNonQuery();
        }

        Response.Redirect("Success.aspx");
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void SqlDataSource1_Selecting1(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}