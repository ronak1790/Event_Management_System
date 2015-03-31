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



public partial class clientaboutus : System.Web.UI.Page
{

    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
                
            AboutusDisplay();
        }
    }

    public void AboutusDisplay()
    {
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT contact_id,contact_name,contact_address,contact_contactno,contact_email FROM companycontact", con);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        dl.DataSource = ds.Tables[0];
        dl.DataBind();
        con.Close();
    }
}