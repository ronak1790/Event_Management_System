using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Mail;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Text;
using System.IO;
using System.Data.SqlClient;

public partial class registrationform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            city();
            
        }

    }

    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    static string LocateFlag = "INSERT";
    static int LocateIndex = -1;


    void ResetCategory()
    {
        txtname.Text = "";
        txtsurname.Text = "";
       
        
        drpcity.SelectedIndex = 0;
        txtarea.Text = "";

        txtcontactno.Text = "";
        txtemailid.Text = "";
        txtwebsite.Text = "";
        txtuname.Text = "";
        txtpassword.Text = "";

            
        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {


        SqlParameter[] pdiv = new SqlParameter[11];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@CID", LocateIndex);
        pdiv[2] = new SqlParameter("@CName", txtname.Text.Trim());
        pdiv[3] = new SqlParameter("@Csurname", txtsurname.Text.Trim());
        pdiv[4] = new SqlParameter("@Ccity",  drpcity.SelectedValue.Trim());
        pdiv[5] = new SqlParameter("@Carea",  txtarea.Text.Trim());
        pdiv[6] = new SqlParameter("@Ccontactno", txtcontactno.Text.Trim());
        pdiv[7] = new SqlParameter("@Cemail", txtemailid.Text.Trim());
        pdiv[8] = new SqlParameter("@Cwebsite", txtwebsite.Text.Trim());
        pdiv[9] = new SqlParameter("@Cusername", txtuname.Text.Trim());
        pdiv[10] = new SqlParameter("@Cpassword", txtpassword.Text.Trim());

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Joinus_insert";
        cmd.Parameters.AddRange(pdiv);
        object obj = cmd.ExecuteScalar();
        con.Close();
        if (obj.ToString() == "-1")
        {
            lblDivMsg.Text = "Already Exist";
        }
        else
        {
            lblDivMsg.Text = "Operation Completed Successfully";

            
        }

        CreateMail(txtname.Text, txtsurname.Text, drpcity.SelectedItem.Text, txtarea.Text, txtcontactno.Text, txtemailid.Text, txtwebsite.Text, txtuname.Text, txtpassword.Text);
      


    }
    protected void btnDivCancel_Click(object sender, EventArgs e)
    {
        ResetCategory();
    }

    public void city()
    {
        DataTable ds = new DataTable();
      
        SqlDataAdapter da = new SqlDataAdapter();

       
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = " select * from city";
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();


        drpcity.DataSource = ds;
        drpcity.DataTextField = "cname";
        drpcity.DataValueField = "city_id";
        drpcity.DataBind();


    }

    static char directorySeparator = Path.DirectorySeparatorChar;

    public static string EmailTemplatePath
    {
        get
        {
            return HttpContext.Current.Request.PhysicalApplicationPath + directorySeparator;
        }
    }

    public static bool CreateMail(string client_name, string client_surname, string client_city, string client_area, string client_contactno, string client_email, string client_website, string client_username, string client_password)
    {
        XmlDocument XD = new XmlDocument();
        XD.Load(EmailTemplatePath + "SendInquiry.xml");
        //fetch subject and contents
        string Subject = XD.DocumentElement.SelectSingleNode("subject").InnerText;
        StringBuilder Body = new StringBuilder(
            XD.DocumentElement.SelectSingleNode("body").InnerText);
        //set contents
        Body = Body.Replace("[CDATE]", DateTime.Now.ToString("dd/MM/yyyy")).Replace("[FIRSTNAME]", client_name).Replace("[LASTNAME]", client_surname).Replace("[CITY]", client_city).Replace("[AREA]", client_area).Replace("[CONTACTNO]", client_contactno).Replace("[EMAILID]", client_email).Replace("[WEBSITE]", client_website).Replace("[USERNAME]", client_username).Replace("[PASSWORD]", client_password);
        //send email        
        return Send("ronak1790@gmail.com",client_email , Body.ToString(), Subject, "");
    }

    public static bool Send(string From, string ToAddr, string Body, string Subject, string Attachments)
    {
        try
        {

            MailMessage Msg = new MailMessage();
            Msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", "smtp.gmail.com");
            Msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
            Msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", "2");
            Msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
            Msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "noreplyeventmanagement@gmail.com");
            Msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "eventmanagement");
            Msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", "true");

            Msg.To = ToAddr;
            Msg.From = "noreplyeventmanagement@gmail.com";
            Msg.Subject = Subject;
            Msg.BodyFormat = MailFormat.Html;
            Msg.Body = Body;
            Msg.Priority = System.Web.Mail.MailPriority.High;
            System.Web.Mail.SmtpMail.SmtpServer = "smtp.gmail.com";

            SmtpMail.Send(Msg);

        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("Problem with Sending mail Please try after sometime.");
        }
        return true;
    }



  
    protected void but_submit_Click(object sender, EventArgs e)
    {
        CreateMail(txtname.Text, txtsurname.Text, drpcity.SelectedItem.Text, txtarea.Text, txtcontactno.Text, txtemailid.Text, txtwebsite.Text, txtuname.Text, txtpassword.Text);
       // Reset();
       // lblMsg.Visible = true;
    }



}
