using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;



public partial class photogallary : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RefreshData();
        }

    }


    public void RefreshData()
    {
      
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT [PKPhotoId], [TFilename],[IFilename], [Description] FROM [Photos] order by 1", con);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        dl.DataSource = ds.Tables[0];
        dl.DataBind();
        con.Close();
    }


   

}