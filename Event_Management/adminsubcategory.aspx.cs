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


public partial class adminsubcategory : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null || (Session["urole"] == null || Session["urole"].ToString() != "0"))
            Response.Redirect("Adminlogin.aspx");
        if (!IsPostBack)
        {
            category();
            bindsubcategory();
        }

    }




    static string LocateFlag = "INSERT";
    static int LocateIndex = -1;

    void bindsubcategory()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();

            string qry = "Subcategory_select";

            SqlDataAdapter da = new SqlDataAdapter(qry, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                gv1.DataSource = ds;
                gv1.DataBind();
                lbltotal.Text = "Total no  of sub category is : " + ds.Tables[0].Rows.Count;

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



    void Resetsubcategory()
    {
        txtsubcategory.Text = "";
        txtdesc.Text = "";
        txtorderlevel.Text = "";
        checksubcat.Checked = false;

        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[7];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@ID", LocateIndex);
        pdiv[2] = new SqlParameter("@Cid", drpcategory.SelectedValue.Trim());
        pdiv[3] = new SqlParameter("@subcatname", txtsubcategory.Text.Trim());
        pdiv[4] = new SqlParameter("@subcatdesc", txtdesc.Text.Trim());

        pdiv[5] = new SqlParameter("@Orderlevel", txtorderlevel.Text.Trim());
        pdiv[6] = new SqlParameter("@isactive", checksubcat.Checked);

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SubCategory_addupdate";
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

            bindsubcategory();
            Resetsubcategory();
        }
    }
    protected void btnDivCancel_Click(object sender, EventArgs e)
    {
        Resetsubcategory();
    }
    protected void ibgvEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibDiv = (ImageButton)sender;
        GridViewRow row = (GridViewRow)ibDiv.NamingContainer;
        int lidDiv = Convert.ToInt32(gv1.DataKeys[row.RowIndex].Value);
        drpcategory.SelectedValue = ((Label)(gv1.Rows[row.RowIndex].Cells[0].FindControl("lblcatid"))).Text;
        txtsubcategory.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[1].FindControl("lblSubcatname"))).Text;

        txtdesc.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[2].FindControl("lblsubcatdesc"))).Text;
        txtorderlevel.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[3].FindControl("lblsubcatorderby"))).Text;
        checksubcat.Checked = ((CheckBox)(gv1.Rows[row.RowIndex].Cells[4].FindControl("chksubcatisactive"))).Checked;


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
            int id = Convert.ToInt32(gv1.DataKeys[row.RowIndex].Value);
            string Qry = "delete from subcategory where subcat_id=" + id;
            SqlCommand cmd = new SqlCommand(Qry, con);
            cmd.ExecuteNonQuery();
            lblDivMsg.Text = "Record Deleted";
            con.Close();


            bindsubcategory();
            Resetsubcategory();




            //con.Open();
            //ImageButton ibDel = (ImageButton)sender;
            //GridViewRow row = (GridViewRow)ibDel.NamingContainer;

            //SqlParameter[] pdiv = new SqlParameter[1];
            //pdiv[0] = new SqlParameter("@Id", Convert.ToInt32(gv1.DataKeys[row.RowIndex].Value));

            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = con;
            //cmd.CommandTimeout = 0;
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "SubCategory_Delete";
            //cmd.Parameters.AddRange(pdiv);
            //object obj = cmd.ExecuteScalar();
            //con.Close();
            //if (obj.ToString() == "-1")
            //{
            //    lblDivMsg.Text = "SubCategory relation exist, SubCategory cannot be deleted.";
            //}
            //else
            //{
            //    lblDivMsg.Text = "Operation Completed Successfully";
            //    bindsubcategory();
            //    Resetsubcategory();
            //}

        }
        catch { }
        finally
        {

        }

    }


    public void category()
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter();

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select cat_id,cat_name from category";
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();


        drpcategory.DataSource = ds;
        drpcategory.DataTextField = "cat_name";
        drpcategory.DataValueField = "cat_id";
        drpcategory.DataBind();


    }

    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        bindsubcategory();

    }



}
