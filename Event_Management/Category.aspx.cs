using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Category : System.Web.UI.Page
{

    public SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    static string LocateFlag = "INSERT";
    static int LocateIndex = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindCategory();
        }
    }


    void bindCategory()
    {
        try
        {
            DataSet ds = new DataSet();
            cn.Open();
            string qry = "Select  * from Category order by Id";
            SqlDataAdapter da = new SqlDataAdapter(qry, cn);
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
            cn.Close();
        }
        catch { }
        finally
        {

        }
    }



    void ResetCategory()
    {
        txtCagegory.Text = "";
        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[3];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@ID", LocateIndex);
        pdiv[2] = new SqlParameter("@CName", txtCagegory.Text.Trim());

        cn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Category_addupdate";
        cmd.Parameters.AddRange(pdiv);
        object obj = cmd.ExecuteScalar();
        cn.Close();
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
        int lidDiv = Convert.ToInt32(gv.DataKeys[row.RowIndex].Value);
        string Category = ((Label)(gv.Rows[row.RowIndex].Cells[0].FindControl("lblCategory"))).Text;
        txtCagegory.Text = Category;
        LocateFlag = "UPDATE";
        LocateIndex = lidDiv;
    }
    protected void ibgvDel_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            cn.Open();
            ImageButton ibDel = (ImageButton)sender;
            GridViewRow row = (GridViewRow)ibDel.NamingContainer;
            int id = Convert.ToInt32(gv.DataKeys[row.RowIndex].Value);
            string Qry = "delete from Category where ID=" + id;
            SqlCommand cmd = new SqlCommand(Qry, cn);
            cmd.ExecuteNonQuery();
            lblDivMsg.Text = "Record Deleted";
            cn.Close();
            bindCategory();
        }
        catch { }
        finally
        {

        }

    }


}
