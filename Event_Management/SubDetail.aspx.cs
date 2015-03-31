using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SubDetail : System.Web.UI.Page
{

    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DetailDisplay();
            Package();
        }
    }

    public void DetailDisplay()
    {

        con.Open();

        SqlCommand cmd = new SqlCommand("select subcat_id,  subcat_Photos, cat_name + ' : ' +  subcat_name as subcat_name,  subcat_description from subcategory inner join category on category.cat_id = subcategory.cat_id  where  subcat_id= " + Request.QueryString["id"].ToString(), con);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        dl.DataSource = ds.Tables[0];
        dl.DataBind();
        con.Close();
    }


    public void Package()
    {

        con.Open();

        SqlCommand cmd = new SqlCommand("select package_id , package_name from PackageMst where Active_Package = 1 and SubCat_Id = " + Request.QueryString["id"].ToString(), con);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        dlpackage.DataSource = ds.Tables[0];
        dlpackage.DataBind();
        con.Close();
    }

    

}