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
using System.Data.OleDb;  

public partial class admincontactus : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null || Session["urole"] == null)
            Response.Redirect("Adminlogin.aspx");
       
        if (!IsPostBack)
        {
            bindcontact();
        }
    }


   
    static string LocateFlag = "INSERT";
    static int LocateIndex = -1;



    void bindcontact()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            string qry = "Select  * from companycontact order by contact_id";
            SqlDataAdapter da = new SqlDataAdapter(qry, con);
            da.SelectCommand.CommandType = CommandType.Text;
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                gv1.DataSource = ds;
                gv1.DataBind();
                lbltotal.Text = "Total no  of Name and Address us  is : " + ds.Tables[0].Rows.Count;

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
        txtcompanyname.Text = "";
        txtaddress.Text = "";
        txtcontactno.Text = "";
        txtemailid.Text = "";  
        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[6];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@CID", LocateIndex);
        pdiv[2] = new SqlParameter("@CName", txtcompanyname.Text.Trim());
        pdiv[3] = new SqlParameter("@Caddress", txtaddress.Text.Trim());
        pdiv[4] = new SqlParameter("@Ccontactno", txtcontactno.Text.Trim());
        pdiv[5] = new SqlParameter("@Cemail", txtemailid.Text.Trim());
      

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "[Contact_insert]";
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

            bindcontact();
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
        txtcompanyname.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[0].FindControl("lblname"))).Text;
        txtaddress.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[1].FindControl("lbladdress"))).Text;
        txtcontactno.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[2].FindControl("lblcontact"))).Text;

        txtemailid.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[2].FindControl("lblemail"))).Text;
      

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
            string Qry = "delete from companycontact where contact_id=" + id;
            SqlCommand cmd = new SqlCommand(Qry, con);
            cmd.ExecuteNonQuery();
            lblDivMsg.Text = "Record Deleted";
            con.Close();
            bindcontact();
          
        }
        catch { }
        finally
        {

        }

    }





    
}