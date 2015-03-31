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

public partial class clientforgetpassword : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

       
    }
    static string LocateFlag = "INSERT";
    static int LocateIndex = -1;

    void ResetCategory()
    {
        txtuname.Text = "";
        txtemail.Text = "";
    }


    public string getpassword(string username, string email)
    
    {
        SqlParameter[] pdiv = new SqlParameter[2];
        pdiv[0] = new SqlParameter("@Username",username);
        pdiv[1] = new SqlParameter("@email",email);
     
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "[forgetpassword_addupdate]";
        cmd.Parameters.AddRange(pdiv);
        object obj = cmd.ExecuteScalar();
        con.Close();

        if (obj.ToString() == "-1")
        {
            lblDivMsg.Text = "Username not found";
            return "-1";
        }
        return obj.ToString();
       
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        CreateMail(txtuname.Text, txtemail.Text,getpassword(txtuname.Text,txtemail.Text) );
        lblDivMsg.Text = "Your password has been send to your email address..!!";
    }
   

   
    static char directorySeparator = Path.DirectorySeparatorChar;

    public static string EmailTemplatePath
    {
        get
        {
            return HttpContext.Current.Request.PhysicalApplicationPath + directorySeparator;
        }
    }

    public static bool CreateMail(string client_username,string client_email,string password)
    {
        XmlDocument XD = new XmlDocument();
        XD.Load(EmailTemplatePath + "Sendpassword.xml");
        //fetch subject and contents
        string Subject = XD.DocumentElement.SelectSingleNode("subject").InnerText;
        StringBuilder Body = new StringBuilder(
            XD.DocumentElement.SelectSingleNode("body").InnerText);
        //set contents
        Body = Body.Replace("[CDATE]", DateTime.Now.ToString("dd/MM/yyyy")).Replace("[USERNAME]", client_username).Replace("[EMAILID]", client_email).Replace("[PASSWORD]",password);
        //send email        
        return Send("ronak1790@gmail.com", client_email, Body.ToString(), Subject, "");
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






}
