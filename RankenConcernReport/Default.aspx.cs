using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;

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
        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["RankenConcernConnectionString"].ToString())) 
        {
            //ConfigurationManager.ConnectionStrings["SearchConnectionString"].ToString();
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

        //exporting and formatting data for email

        MailMessage mailMsg = new MailMessage();

        mailMsg.From = new MailAddress("ldoncarlos@ranken.edu");


        mailMsg.To.Add("Eagudmestad@ranken.edu");

        // '  mailMsg.CC.Add("ccorrigan@ranken.edu")

        // ' mailMsg.CC.Add("cshaw@ranken.edu")

        mailMsg.Subject = TextBoxReasonForConcern.Text + "(Ranken Concern)";
    
        mailMsg.IsBodyHtml = true;

        mailMsg.BodyEncoding = Encoding.UTF8;
        if (CheckBoxFollowUp.Checked == true)
        {

            mailMsg.Body = "From: " + TextBoxName.Text + "<br />" + "Email: " + TextBoxEmail.Text + "<br />" + "Phone: " + TextBoxPhone.Text + "<br />" + "Concern Details: <br />" + TextBoxConcernDetails.Text;

        }

        else
        {
            mailMsg.Body = "From: " + TextBoxName.Text + "Concern Details: < br /> " + TextBoxConcernDetails.Text;
        }
        mailMsg.Priority = MailPriority.Normal;


        //MailMessage userResponseMail = new MailMessage();

        //userResponseMail.From = new MailAddress(TextBoxEmail.Text);

        /*
        userResponseMail.To.Add("LoganDonCarlos@hotmail.com");
        userResponseMail.Subject = TextBoxReasonForConcern.Text + "( Ranken Concern)";
        userResponseMail.IsBodyHtml = true;
        userResponseMail.BodyEncoding = Encoding.UTF8;
        userResponseMail.Body = "Thank you " + TextBoxName.Text + ". <br />Your Concern ID is _";
        userResponseMail.Priority = MailPriority.Normal;
        */



        //Smtp configuration

        SmtpClient SmtpClient = new SmtpClient();

        SmtpClient.UseDefaultCredentials = false;

        SmtpClient.Credentials = new NetworkCredential("eagudmesad@ranken.edu", "Hash29Brown!", "mail.ranken.edu");

        SmtpClient.Host = "mail.ranken.edu";

        // '  SmtpClient.EnableSsl = True

        SmtpClient.Send(mailMsg);


        Response.Redirect("Success.aspx");
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void SqlDataSource1_Selecting1(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Logon.aspx");
    }
}