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

public partial class adminpackageassign : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["uname"] == null || Session["urole"] == null)
            Response.Redirect("Adminlogin.aspx");
        if (!IsPostBack)
        {
            bindcategory();
            bindsubcategory();
            bindpackge();
            binditem();
            bindsitem();
            bindsubitem();
            bindpacakgeassign();

        }
    }
    public void bindcategory()
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from Category";
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();

        ddcategory.DataSource = ds;
        ddcategory.DataTextField = "Cat_Name";
        ddcategory.DataValueField = "Cat_Id";
        ddcategory.DataBind();
    }

    public void bindsubcategory()
    {
        DataTable ds = new DataTable();

        SqlDataAdapter da = new SqlDataAdapter();

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from SubCategory where Cat_id = " + ddcategory.SelectedValue;
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
        cmd.CommandText = "select * from PackageMst where subcat_id = " + ddsubcategory.SelectedValue;
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();

        lbpackage.DataSource = ds;
        lbpackage.DataTextField = "Package_Name";
        lbpackage.DataValueField = "Package_Id";
        lbpackage.DataBind();
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

        dditem.DataSource = ds;
        dditem.DataTextField = "Item_Name";
        dditem.DataValueField = "Item_Id";
        dditem.DataBind();
    }
    public void bindsitem()
    {
        DataTable ds = new DataTable();

        SqlDataAdapter da = new SqlDataAdapter();

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from SUBItemMst where Item_id = " + dditem.SelectedValue;
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();

        ddsubitem.DataSource = ds;
        ddsubitem.DataTextField = "SubItem_Name";
        ddsubitem.DataValueField = "subItem_Id";
        ddsubitem.DataBind();
    }
    public void bindsubitem()
    {
        DataTable ds = new DataTable();

        SqlDataAdapter da = new SqlDataAdapter();

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from SubItem2Mst where subitem_id = " + ddsubitem.SelectedValue;
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();

        lbsubitem2.DataSource = ds;
        lbsubitem2.DataTextField = "SubItem2_Name";
        lbsubitem2.DataValueField = "SubItem2_Id";
        lbsubitem2.DataBind();
    }

    void bindpacakgeassign()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();

            string qry = "select pa.id , c.cat_name , SUBCAT_NAME, Package_name, I.Item_Name,subitem_name,subitem2_name,SubItem_price from Packageassign pa inner join SubItem2Mst SI2 on pa.SubItem2_Id = si2.SubItem2_Id inner join SubItemMst SI on SI.subitem_Id = SI2.SubItem_Id  inner join ItemMst I on I.Item_Id = SI.Item_Id inner join packagemst P on P.Package_id = pa.Package_id INNER JOIN subcategory SC ON SC.SUBCAT_ID = p.SUBCAT_ID INNER JOIN category c ON C.cat_id = SC.cat_id  ";
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


    protected void btnDivAdd_Click(object sender, EventArgs e)
    {


        if (lbpackage.SelectedIndex > -1)
        {
            if (lbsubitem2.SelectedIndex > -1)
            {

                SqlParameter[] pdiv = new SqlParameter[2];
                pdiv[0] = new SqlParameter("@PId", lbpackage.SelectedValue);
                pdiv[1] = new SqlParameter("@SubIId", lbsubitem2.SelectedValue);

                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Packageassign_addupdate";
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
                    bindpacakgeassign();
                    //Resetpackageamt();
                }
            }
            else
            {
                lblDivMsg.Text = "Please select SubItem";
            }

        }
        else
        {
            lblDivMsg.Text = "Please select package";
        }
    }
    protected void btnDivCancel_Click(object sender, EventArgs e)
    {
        //Resetpackageamt();
    }

    protected void ibgvDel_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            con.Open();
            ImageButton ibDel = (ImageButton)sender;
            GridViewRow row = (GridViewRow)ibDel.NamingContainer;
            int id = Convert.ToInt32(gv.DataKeys[row.RowIndex].Value);
            string Qry = "delete from Pacakgeaassign where Id=" + id;
            SqlCommand cmd = new SqlCommand(Qry, con);
            cmd.ExecuteNonQuery();
            lblDivMsg.Text = "Record Deleted";
            con.Close();
            bindpacakgeassign();
        }
        catch {
        }
        finally
        {

        }

    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bindpacakgeassign();
    }

    protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindsubcategory();
        bindpackge();
    }
    protected void ddsubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindpackge();
    }
    protected void dditem_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindsitem();
        bindsubitem();
    }
    protected void ddsubitem_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindsubitem();
    }
}
