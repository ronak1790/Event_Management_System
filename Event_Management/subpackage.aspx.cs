using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class subpackage : System.Web.UI.Page
{

    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {
        DetailDisplay();
        displayAmt();
        displaypackageitem();

        Session["Pid"] = Request.QueryString["id"].ToString();
    }
    public void DetailDisplay()
    {

        con.Open();

        SqlCommand cmd = new SqlCommand("select SubCat_Name, Package_Id,Package_Name,Package_Desc from PackageMst inner join  subcategory on subcategory.SubCat_Id = PackageMst.SubCat_Id where Package_Id = " + Request.QueryString["id"].ToString(), con);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        dl.DataSource = ds.Tables[0];
        dl.DataBind();
        con.Close();
    }
    public void displayAmt()
    {

        con.Open();

        SqlCommand cmd = new SqlCommand("select PackageAmt_Id as Id ,Person,Package_Amt from PackageAmtMst where Package_Id = " + Request.QueryString["id"].ToString(), con);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        gv.DataSource = ds.Tables[0];
        gv.DataBind();
        con.Close();
    }

    public void displaypackageitem()
    {

        con.Open();

        SqlCommand cmd = new SqlCommand("select pa.id as id ,S.SubItem_Name,SI.SubItem2_Name from SubItem2Mst SI inner join Packageassign pa on pa.SubItem2_Id = SI.SubItem2_Id inner join SubItemMst S on S.SubItem_Id = SI.SubItem_Id where pa.Package_Id = " + Request.QueryString["id"].ToString(), con);
        cmd.CommandTimeout = 0;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        gv2.DataSource = ds.Tables[0];
        gv2.DataBind();
        con.Close();
    }
}