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
using System.Data.OleDb;
using System.Data.SqlClient;


public partial class admincategory : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null || Session["urole"] == null)
            Response.Redirect("Adminlogin.aspx");
        if (!IsPostBack)
        {
            bindCategory();
        }
    }

    static string LocateFlag = "INSERT";
    static int LocateIndex = -1;

    void bindCategory()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            string qry = "Select  * from category order by cat_orderby";
            SqlDataAdapter da = new SqlDataAdapter(qry, con);
            da.SelectCommand.CommandType = CommandType.Text;
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                gv1.DataSource = ds;
                gv1.DataBind();
                lbltotal.Text = "Total no  of category is : " + ds.Tables[0].Rows.Count;

            }
            else
            {
                gv1.DataBind();
            }
            con.Close();
        }
        catch { }
        finally
        {

        }
    }



    void ResetCategory()
    {
        txtCategory.Text = "";
        txtdesc.Text = "";
        txtorderlevel.Text = "";
        chkIsActive.Checked = false;
        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[6];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@ID", LocateIndex);
        pdiv[2] = new SqlParameter("@CName", txtCategory.Text.Trim());
        pdiv[3] = new SqlParameter("@Cdesc", txtdesc.Text.Trim());
        pdiv[4] = new SqlParameter("@Orderlevel", txtorderlevel.Text.Trim());
        pdiv[5] = new SqlParameter("@isactive", chkIsActive.Checked);

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Category_addupdate";
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

            bindCategory();
            ResetCategory();
        }
    }
    protected void btnDivCancel_Click(object sender, EventArgs e)
    {
        ResetCategory();
    }
    protected void ibgvEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibDiv = (ImageButton)sender;
        GridViewRow row = (GridViewRow)ibDiv.NamingContainer;
        int lidDiv = Convert.ToInt32(gv1.DataKeys[row.RowIndex].Value);
        txtCategory.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[0].FindControl("lblcatname"))).Text;
        txtdesc.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[1].FindControl("lblcatdesc"))).Text;
        txtorderlevel.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[2].FindControl("lblcatorderby"))).Text;
        chkIsActive.Checked = ((CheckBox)(gv1.Rows[row.RowIndex].Cells[3].FindControl("chkcategory"))).Checked;


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

            SqlParameter[] pdiv = new SqlParameter[1];
            pdiv[0] = new SqlParameter("@Id", Convert.ToInt32(gv1.DataKeys[row.RowIndex].Value));

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "category_Delete";
            cmd.Parameters.AddRange(pdiv);
            object obj = cmd.ExecuteScalar();
            con.Close();
            if (obj.ToString() == "-1")
            {
                lblDivMsg.Text = "Category relation exist, Category cannot be deleted.";
            }
            else
            {
                lblDivMsg.Text = "Operation Completed Successfully";
                bindCategory();
                ResetCategory();
            }
        }
        catch { }
        finally
        {
        }
    }


    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        bindCategory();

    }

}
