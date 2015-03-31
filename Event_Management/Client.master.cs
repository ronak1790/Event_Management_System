using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client : System.Web.UI.MasterPage
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        binddata();
        NewsDisplay();

        if (Session["uname"] == null || (Session["urole"] == null || Session["urole"].ToString() != "1"))
            ul.Visible = false;
        else
            ul.Visible = true;
    }

    // Function to bind data in data controls..


   
   

    public void binddata()
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("getcatSubCat", con); // name of your stored procedure,
        da.Fill(ds);

        ds.Relations.Add("InnerVal", ds.Tables[0].Columns["cat_id"], ds.Tables[1].Columns["cat_id"]);   // making a relation between two tables.
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        con.Close();
    }
    public void NewsDisplay()
    {
        
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT news_id, news_title, Left(news_description,200) as Description , convert(varchar,news_date,103) as NewsDate FROM news order by news_date", con);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        dl.DataSource = ds.Tables[0];
        dl.DataBind();
        con.Close();
    }
   
}
