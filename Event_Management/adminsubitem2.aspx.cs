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



public partial class adminsubitem2 : System.Web.UI.Page
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
            binditem();
            bindsubItem();
            bindsitem();
        }
    }

    public void binditem()
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from ItemMst";
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();

        dropitem.DataSource = ds;
        dropitem.DataTextField = "Item_Name";
        dropitem.DataValueField = "Item_Id";
        dropitem.DataBind();
    }

    public void bindsitem()
    {
        DataTable ds = new DataTable();
        
        SqlDataAdapter da = new SqlDataAdapter();

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from SubItemMst where Item_id = " + dropitem.SelectedValue;
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();

        ddsitem.DataSource = ds;
        ddsitem.DataTextField = "SubItem_Name";
        ddsitem.DataValueField = "SubItem_Id";
        ddsitem.DataBind();
    }

    void bindsubItem()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            

            string qry = "select si2.subitem2_id, I.Item_Name,subitem_name,subitem2_name,SubItem_price , SI.SubItem_Id , I.Item_Id , SI2.subItem2_desc from SubItem2Mst SI2 inner join SubItemMst SI on SI.subitem_Id = SI2.SubItem_Id inner join ItemMst I on I.Item_Id = SI.Item_Id order by SubItem2_Id";

            
            SqlDataAdapter da = new SqlDataAdapter(qry, con);
            da.SelectCommand.CommandType = CommandType.Text;
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                gv.DataSource = ds;
                gv.DataBind();

                lbltotal.Text = "Total Number Of Sub Item is " + ds.Tables[0].Rows.Count;
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



    void ResetsubItem()
    {
        txtsubitemname.Text = "";
        txtsubitemdesc.Text = "";
        txtsubitemprice.Text = "";
        //txtordersubitem.Text = "";
        //chkactsubitem.Checked = False;
        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[6];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@ID", LocateIndex);
        pdiv[2] = new SqlParameter("@Sname", txtsubitemname.Text.Trim());
        pdiv[3] = new SqlParameter("@Sdesc", txtsubitemdesc.Text.Trim());
        pdiv[4] = new SqlParameter("@Sprice", txtsubitemprice.Text.Trim());
        pdiv[5] = new SqlParameter("@subItem_id", ddsitem.SelectedValue);

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SubItemTwo_addupdate";
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

            bindsubItem();
            ResetsubItem();
        }
    }
    protected void btnDivCancel_Click(object sender, EventArgs e)
    {
        ResetsubItem();
    }
    protected void ibgvEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibDiv = (ImageButton)sender;
        GridViewRow row = (GridViewRow)ibDiv.NamingContainer;
        int lidDiv = Convert.ToInt32(gv.DataKeys[row.RowIndex].Value);


        dropitem.SelectedValue = ((Label)(gv.Rows[row.RowIndex].Cells[1].FindControl("lblitemid"))).Text;

        bindsitem(); 
        ddsitem.SelectedValue = ((Label)(gv.Rows[row.RowIndex].Cells[2].FindControl("lblsubitemid"))).Text;

        string subitemname = ((Label)(gv.Rows[row.RowIndex].Cells[5].FindControl("lblsubitemname"))).Text;
        txtsubitemname.Text = subitemname;

        string itemdesc = ((Label)(gv.Rows[row.RowIndex].Cells[7].FindControl("lblitemdesc"))).Text;
        txtsubitemdesc.Text = itemdesc;

        string itemprice = ((Label)(gv.Rows[row.RowIndex].Cells[6].FindControl("lblitemprice"))).Text;
        txtsubitemprice.Text = itemprice;

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
            string Qry = "delete from SubItem2Mst where SubItem2_Id=" + id;
            SqlCommand cmd = new SqlCommand(Qry, con);
            cmd.ExecuteNonQuery();
            lblDivMsg.Text = "Record Deleted";
            con.Close();
            bindsubItem();
        }
        catch { }
        finally
        { }

    }


    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bindsubItem();
    }
    //protected void ddsitem_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    bindsitem(ddsitem.SelectedValue);
    //}
    protected void dropitem_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindsitem();
    }
}