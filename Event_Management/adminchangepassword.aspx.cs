using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Data.SqlClient;


public partial class adminchangepassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null || Session["urole"] == null)
            Response.Redirect("Adminlogin.aspx");
       
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Data Source=RONAK-PC\\SQLEXPRESS;Initial Catalog=event-management;Integrated Security=True";
        con.Open();
        
        
        SqlCommand cmd = new SqlCommand();

        string str = "update loginmaster set admin_password = '" + txtnewpassword.Text + "'  where admin_username= '" + Session["uname"].ToString() +"'";
        cmd = new SqlCommand(str, con);
        cmd.ExecuteNonQuery();
        con.Close();

        Label1.Visible = true;
        Label1.Text = "Your Password Sucessfully changed.";






    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtuname.Text = " ";
        txtoldpassword.Text = " ";
        txtnewpassword.Text = " ";
    }



    //protected void btnlogin_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (IsValid)
    //        {

    //            SqlCommand cmd = new SqlCommand("HMSFetchPassword", con);
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            SqlDataReader dr;
    //            con.Open();
    //            cmd.Parameters.Add("@Pwd", this.txtoldpass.Text);
    //            dr = cmd.ExecuteReader();
    //            if (dr.Read() == null)
    //            {
    //                if (txtoldpass.Text == txtnewpass.Text)
    //                {
    //                    cmd.CommandText = "HMSSP_UpdatePassword";
    //                    cmd.CommandType = CommandType.StoredProcedure;
    //                    cmd.Parameters.Add("@Pwd", this.txtoldpass.Text);
    //                    // cmd.ExecuteNonQuery();
    //                    lblmessage.Visible = true;
    //                    lblmessage.Text = "Your Password Sucessfully changed.";

    //                }
    //                else
    //                {
    //                    lblmessage.Visible = true;
    //                    lblmessage.Text = "Please enter correct Password ";
    //                }
    //                dr.Close();
    //                con.Close();
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(ex.Message);
    //    }
    //}





























}

