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
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class Adminlogin : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
       
        con.Open();
        string cmdstr = "select count(*) from loginmaster where admin_userrole=0 and admin_username='" + txtuname.Text + "'";
        SqlCommand Checkuser = new SqlCommand(cmdstr, con);
        int temp = Convert.ToInt32(Checkuser.ExecuteScalar().ToString());
        if (temp == 1)
        {
            string cmdstr2 = "select admin_password from loginmaster where admin_userrole=0 and admin_username='" + txtuname.Text + "'";
            SqlCommand pass = new SqlCommand(cmdstr2, con);
            string password = pass.ExecuteScalar().ToString();

            if (password == txtpwd.Text)
            {
                Session["uname"] = txtuname.Text;
                Session["urole"] = "0";
                Response.Redirect("adminhome.aspx");

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


    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtuname.Text = "";
        txtpwd.Text = "";
    }
}
