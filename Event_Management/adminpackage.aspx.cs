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

public partial class adminpackage : System.Web.UI.Page
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
            bindpackage();
            binddropsubcategory();
        }
    }

    public void binddropsubcategory()
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

        dropdwcategory.DataSource = ds;
        dropdwcategory.DataTextField = "SubCat_Name";
        dropdwcategory.DataValueField = "SubCat_Id";
        dropdwcategory.DataBind();
    }

    void bindpackage()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();

            string qry = "select Package_id, Package_Name,Package_Desc,S.subcat_id,S.subcat_name,Active_Package from PackageMst P inner join subcategory S on S.subcat_id = P.Subcat_id order by Package_Id";

            SqlDataAdapter da = new SqlDataAdapter(qry, con);
            da.SelectCommand.CommandType = CommandType.Text;
            da.Fill(ds);
            con.Close();
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
        {

        }
    }



    void Resetpackage()
    {
        txtpackagename.Text = "";
        chkactpackage.Checked = false;   
        txtpackagedesc.Text = "";
        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[6];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@ID", LocateIndex);
        pdiv[2] = new SqlParameter("@CId", dropdwcategory.SelectedValue.Trim());
        pdiv[3] = new SqlParameter("@packagename", txtpackagename.Text.Trim());

        pdiv[4] = new SqlParameter("@packagedesc", txtpackagedesc.Text.Trim());
        pdiv[5] = new SqlParameter("@actpackage", chkactpackage.Checked);

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Package_addupdate";
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

            bindpackage();
            Resetpackage();
        }
    }
    protected void btnDivCancel_Click(object sender, EventArgs e)
    {
        Resetpackage();
    }
    protected void ibgvEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibDiv = (ImageButton)sender;
        GridViewRow row = (GridViewRow)ibDiv.NamingContainer;

        int lidDiv = Convert.ToInt32(gv.DataKeys[row.RowIndex].Value);

        dropdwcategory.SelectedValue = ((Label)(gv.Rows[row.RowIndex].Cells[0].FindControl("lblCategoryId"))).Text;

        txtpackagename.Text = ((Label)(gv.Rows[row.RowIndex].Cells[1].FindControl("lblpackagename"))).Text;
       
        txtpackagedesc.Text = ((Label)(gv.Rows[row.RowIndex].Cells[4].FindControl("lblpackagedesc"))).Text;
        

        chkactpackage.Checked = ((CheckBox)(gv.Rows[row.RowIndex].Cells[5].FindControl("chkpackage"))).Checked;


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
            string Qry = "delete from PackageMst where Package_Id=" + id;
            SqlCommand cmd = new SqlCommand(Qry, con);
            cmd.ExecuteNonQuery();
            lblDivMsg.Text = "Record Deleted";
            con.Close();
            bindpackage();
        }
        catch { }
        finally
        {

        }

    }


    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bindpackage();
    }
}
