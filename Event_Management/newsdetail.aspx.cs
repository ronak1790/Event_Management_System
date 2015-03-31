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


public partial class newsdetail : System.Web.UI.Page
{

    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            NewsDisplay();
        }   
    }

    public void NewsDisplay()
    {
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT news_id, news_title, news_description as Description , convert(varchar,news_date,103) as NewsDate FROM news order by news_date", con);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        dl.DataSource = ds.Tables[0];
        dl.DataBind();
        con.Close();
    }
}
