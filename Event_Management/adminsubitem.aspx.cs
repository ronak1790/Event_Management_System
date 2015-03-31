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



public partial class adminsubitem : System.Web.UI.Page
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

    void bindsubItem()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();

            string qry = "Select SubItem_Id , SubItem_Name , I.Item_Id, Item_name , SubItem_desc,Order_SubItem,Act_SubItem from SubItemMst SI inner join ItemMst I on I.Item_Id = SI.Item_Id  order by SubItem_Id";

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
        txtsitem.Text = "";
        txtsubitemdesc.Text = "";
        txtordersubitem.Text = "";
        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[7];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@ID", LocateIndex);
        pdiv[2] = new SqlParameter("@IId", dropitem.SelectedValue.Trim());
        pdiv[3] = new SqlParameter("@SItemname", txtsitem.Text.Trim());
        pdiv[4] = new SqlParameter("@SItemdesc", txtsubitemdesc.Text.Trim());       
        pdiv[5] = new SqlParameter("@ordersubitem", txtordersubitem.Text.Trim());
        pdiv[6] = new SqlParameter("@actsubitem", chkactsubitem.Checked);

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SubItem_addupdate";
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


        dropitem.SelectedValue = ((Label)(gv.Rows[row.RowIndex].Cells[0].FindControl("lblitemid"))).Text;

        string subitemname = ((Label)(gv.Rows[row.RowIndex].Cells[1].FindControl("lblsubitemname"))).Text;
        txtsitem.Text = subitemname;

        string itemdesc = ((Label)(gv.Rows[row.RowIndex].Cells[2].FindControl("lblsubitemdesc"))).Text;
        txtsubitemdesc.Text = itemdesc;

        string itemorder = ((Label)(gv.Rows[row.RowIndex].Cells[3].FindControl("lblitemorder"))).Text;
        txtordersubitem.Text = itemorder;

        chkactsubitem.Checked = ((CheckBox)(gv.Rows[row.RowIndex].Cells[3].FindControl("chksubitem"))).Checked;


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
            string Qry = "delete from SubItemMst where SubItem_Id=" + id;
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

}