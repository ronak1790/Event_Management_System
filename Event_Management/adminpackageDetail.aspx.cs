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

public partial class adminpackageDetail : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    static string LocateFlag = "INSERT";
    static int LocateIndex = -1;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["uname"] == null || Session["urole"] == null)
            Response.Redirect("Adminlogin.aspx");

        if (!IsPostBack)
        {
            bindsubcategory();
            bindpackge();
            bindpacakgeamt();
            Resetpackageamt();
        }
    }

    public void bindsubcategory()
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter();

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from SubCategory";
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();

        ddsubcategory.DataSource = ds;
        ddsubcategory.DataTextField = "SubCat_Name";
        ddsubcategory.DataValueField = "SubCat_Id";
        ddsubcategory.DataBind();
    }
    public void bindpackge()
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter();

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from PackageMst where subcat_id = " + ddsubcategory.SelectedValue ;
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();

        ddpackage.DataSource = ds;
        ddpackage.DataTextField = "Package_Name";
        ddpackage.DataValueField = "Package_Id";
        ddpackage.DataBind();
    }

    void bindpacakgeamt()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();

            string qry = "Select C.Cat_Name,S.subcat_name , S.SubCat_id,  PM.Package_Id , PM.Package_Name,PackageAmt_Id ,Person , Package_Amt from PackageAmtMst P inner join subcategory S on P.SubCat_Id = S.subcat_id inner join PackageMst PM on PM.Package_Id = P.Package_Id inner join Category C on C.Cat_Id = S.cat_id";
            SqlDataAdapter da = new SqlDataAdapter(qry, con);
            da.SelectCommand.CommandType = CommandType.Text;
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                gv.DataSource = ds;
                gv.DataBind();


            }
            else
            {
                gv.DataBind();
            }
            con.Close();
        }
        catch { }
        finally
        { }
    }
    void Resetpackageamt()
    {
        txtperson.Text = "";
        txtpackgeamt.Text = "";
        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[6];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@ID", LocateIndex);
        pdiv[2] = new SqlParameter("@SId", ddsubcategory.SelectedValue.Trim());
        pdiv[3] = new SqlParameter("@PId", ddpackage.SelectedValue.Trim());
        pdiv[4] = new SqlParameter("@person", txtperson.Text.Trim());
        pdiv[5] = new SqlParameter("@packageamt", txtpackgeamt.Text.Trim());


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "PackageAmt_addupdate";
        cmd.Parameters.AddRange(pdiv);

        object obj = cmd.ExecuteScalar();
        con.Close();
        if (obj.ToString() == "-1")
        {
            lblDivMsg.Text = "Already Exist";
        }
        else
        {
            lblDivMsg.Text = "Operation Completed Successfully";
            bindpacakgeamt();
            Resetpackageamt();
        }
    }
    protected void btnDivCancel_Click(object sender, EventArgs e)
    {
        Resetpackageamt();
    }
    protected void ibgvEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibDiv = (ImageButton)sender;
        GridViewRow row = (GridViewRow)ibDiv.NamingContainer;

        int lidDiv = Convert.ToInt32(gv.DataKeys[row.RowIndex].Value);



        ddsubcategory.SelectedValue = ((Label)(gv.Rows[row.RowIndex].Cells[0].FindControl("lblsubcategoryid"))).Text;
        bindpackge();
        ddpackage.SelectedValue = ((Label)(gv.Rows[row.RowIndex].Cells[1].FindControl("lblpackageid"))).Text;
        txtperson.Text = ((Label)(gv.Rows[row.RowIndex].Cells[4].FindControl("lblperson"))).Text;
        txtpackgeamt.Text = ((Label)(gv.Rows[row.RowIndex].Cells[5].FindControl("lblpackageamt"))).Text;





        LocateFlag = "UPDATE";
        LocateIndex = lidDiv;
    }
    protected void ibgvDel_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            con.Open();
            ImageButton ibDel = (ImageButton)sender;
            GridViewRow row = (GridViewRow)ibDel.NamingContainer;
            int id = Convert.ToInt32(gv.DataKeys[row.RowIndex].Value);
            string Qry = "delete from PacakgeaAmtMst where PackageAmt_Id=" + id;
            SqlCommand cmd = new SqlCommand(Qry, con);
            cmd.ExecuteNonQuery();
            lblDivMsg.Text = "Record Deleted";
            con.Close();
            bindpacakgeamt();
        }
        catch { }
        finally
        {

        }

    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bindpacakgeamt();
    }
    protected void ddsubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindpackge();
    }
}
