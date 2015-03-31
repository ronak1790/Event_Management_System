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


public partial class adminitem : System.Web.UI.Page
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
            bindItem();
        }

    }

    void bindItem()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();

            string qry = "Select  * from ItemMst order by order_Item";

            // String qry = "select Item_Name,Item_Desc,Item_Price,SC.SubCat_Name,SC.SubCat_Id from ItemMst I inner join SubCategoryMst SC on SC.SubCat_Id = I.Item_Id order by SubCat_Id";
            SqlDataAdapter da = new SqlDataAdapter(qry, con);
            da.SelectCommand.CommandType = CommandType.Text;
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                gv.DataSource = ds;
                gv.DataBind();

                lbltotal.Text = "Total Number Of Item is " + ds.Tables[0].Rows.Count;
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



    void ResetItem()
    {
        txtitemname.Text = "";

        txtitemdesc.Text = "";
        txtorderitem.Text = "";
        chkactitem.Checked = false;   
        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[6];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@ID", LocateIndex);
        pdiv[2] = new SqlParameter("@itemname", txtitemname.Text.Trim());

        pdiv[3] = new SqlParameter("@itemdesc", txtitemdesc.Text.Trim());
        pdiv[4] = new SqlParameter("@orderitem", txtorderitem.Text.Trim());
        pdiv[5] = new SqlParameter("@actdet", chkactitem.Checked);

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Item_addupdate";
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

            bindItem();
            ResetItem();
        }
    }
    protected void btnDivCancel_Click(object sender, EventArgs e)
    {
        ResetItem();
    }
    protected void ibgvEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibDiv = (ImageButton)sender;
        GridViewRow row = (GridViewRow)ibDiv.NamingContainer;
        int lidDiv = Convert.ToInt32(gv.DataKeys[row.RowIndex].Value);

        string itemname = ((Label)(gv.Rows[row.RowIndex].Cells[1].FindControl("lblitemname"))).Text;
        txtitemname.Text = itemname;

        //string Sitemname = ((Label)(gv.Rows[row.RowIndex].Cells[2].FindControl("lblsitem"))).Text;
        //txtsitem.Text = Sitemname;

        string itemdesc = ((Label)(gv.Rows[row.RowIndex].Cells[3].FindControl("lblitemdesc"))).Text;
        txtitemdesc.Text = itemdesc;

        string orderitem = ((Label)(gv.Rows[row.RowIndex].Cells[4].FindControl("lblorderitem"))).Text;
        txtorderitem.Text = orderitem;

        bool act = ((CheckBox)(gv.Rows[row.RowIndex].Cells[5].FindControl("chkactitem"))).Checked;
        chkactitem.Checked = act;

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
            string Qry = "delete from ItemMst where Item_Id=" + id;
            SqlCommand cmd = new SqlCommand(Qry, con);
            cmd.ExecuteNonQuery();
            lblDivMsg.Text = "Record Deleted";
            con.Close();
            bindItem();
        }
        catch { }
        finally
        {

        }

    }


    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bindItem();
    }
}
