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



public partial class adminNews : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null || Session["urole"] == null)
            Response.Redirect("Adminlogin.aspx");
        if (!IsPostBack)
        {
            bindnews();
        }

        string scriptStr = "return showCalendar('" + getClientID(txtNDate) + "', 'mm/dd/y');";
        imgDate.Attributes.Add("onClick", scriptStr);
    }

    static public string getClientID(Control Id)
    {
        return Id.ClientID.ToString();
    }

    static string LocateFlag = "INSERT";
    static int LocateIndex = -1;



    void bindnews()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            string qry = "select news_id,news_description,news_title, CONVERT(varchar,news_date,101) as News_date from news  ";
            SqlDataAdapter da = new SqlDataAdapter(qry, con);
            da.SelectCommand.CommandType = CommandType.Text;
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                gv1.DataSource = ds;
                gv1.DataBind();
                lbltotal.Text = "Total no  of News are : " + ds.Tables[0].Rows.Count;

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



    void Resetnews()
    {
        txtnewstitle.Text = "";
        txtnewsdesc.Text = "";
        txtNDate.Text = "";  
        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[5];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@ID", LocateIndex);
        pdiv[2] = new SqlParameter("@Newstitle", txtnewstitle.Text.Trim());
        pdiv[3] = new SqlParameter("@Newsdesc", txtnewsdesc.Text.Trim());
        pdiv[4] = new SqlParameter("@Newsdate", txtNDate.Text.Trim());

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "News_addupdate";
        cmd.Parameters.AddRange(pdiv);
        object obj = cmd.ExecuteScalar();
        con.Close();
        if (obj.ToString() == "-1")
        {
            lblDivMsg.Text = " News Already Exist";
        }
        else
        {
            lblDivMsg.Text = "Operation Completed Successfully";

            bindnews();
            Resetnews();
        }
    }
    protected void btnDivCancel_Click(object sender, EventArgs e)
    {
        Resetnews();
    }
    protected void ibgvEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibDiv = (ImageButton)sender;
        GridViewRow row = (GridViewRow)ibDiv.NamingContainer;
        int lidDiv = Convert.ToInt32(gv1.DataKeys[row.RowIndex].Value);
        txtnewstitle.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[0].FindControl("lblnewstitle"))).Text;
        txtnewsdesc.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[1].FindControl("lblnewsdesc"))).Text;
        txtNDate.Text = ((Label)(gv1.Rows[row.RowIndex].Cells[2].FindControl("lblnewsdate"))).Text;


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
            string Qry = "delete from news where news_id=" + id;
            SqlCommand cmd = new SqlCommand(Qry, con);
            cmd.ExecuteNonQuery();
            lblDivMsg.Text = "News Deleted";
            con.Close();
            bindnews();
        }
        catch { }
        finally
        {

        }

    }




    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        bindnews();

    }

}