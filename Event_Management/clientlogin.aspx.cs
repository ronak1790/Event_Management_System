using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class clientlogin : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        con.Open();
        string cmdstr = "select count(*) from joinus where client_username='" + txtuname.Text + "'";
        SqlCommand Checkuser = new SqlCommand(cmdstr, con);
        int temp = Convert.ToInt32(Checkuser.ExecuteScalar().ToString());
        if (temp == 1)
        {
            string cmdstr2 = "select client_password from joinus where  client_username='" + txtuname.Text + "'";
            SqlCommand pass = new SqlCommand(cmdstr2, con);
            string password = pass.ExecuteScalar().ToString();

            if (password == txtpassword.Text)
            {
                Session["uname"] = txtuname.Text;
                Session["urole"] = "1";
                Response.Redirect("bookevent.aspx");

            }

            else
            {
                Label1.Visible = true;
                Label1.Text = "Invalid Password...!!";
            }
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "Invalid Username...!!";
        }
        con.Close();

    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtuname.Text = "";
        txtpassword.Text = "";
    }
    
}