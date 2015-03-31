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
using System.IO;
using Ionic.Utils.Zip;

public partial class adminbookingdetails : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null || Session["urole"] == null)
            Response.Redirect("Adminlogin.aspx");
        if (!IsPostBack)
        {
            bindClient();
        }
    }

    void bindClient()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            string qry = "select cat_name , subcat_name , Package_name , CLIENT_NAME , CLIENT_SURNAME , CLIENT_CITY, CLIENT_AREA,CLIENT_CONTACTNO , CLIENT_EMAIL , CLIENT_WEBSITE , CLIENT_USERNAME , cITY ,AREA , VENUE , CONVERT(VARCHAR,STARTDATE,103) AS SDATE,CONVERT(VARCHAR,ENDDATE,103) AS ENDDATE , GUESTASPECTED , TIMEOFEVENT from bookevent inner join packagemst P on bookevent.pid = P.package_id inner join subcategory S on S.subcat_id = P.SUBCAT_id inner join category C on C.cat_id = S.cat_id INNER JOIN JOINUS J ON J.CLIENT_USERNAME = BOOKEVENT.LOGINID";
            SqlDataAdapter da = new SqlDataAdapter(qry, con);
            da.SelectCommand.CommandType = CommandType.Text;
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                gv1.DataSource = ds;
                gv1.DataBind();
                lbltotal.Text = "Total no  of clients are : " + ds.Tables[0].Rows.Count;

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








    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        bindClient();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Clients.zip");
        Response.Charset = "";
        Response.ContentType = "application/zip";
        StringWriter stringWrite = new StringWriter();
        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        gv1.RenderControl(htmlWrite);
        ZipFile zip = new ZipFile(Response.OutputStream);
        zip.AddStringAsFile(htmlWrite.InnerWriter.ToString(), "Clients.xls", "");
        zip.Save();
        Response.End();

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        // Confirms that an HtmlForm control is rendered for the 
        //specified ASP.NET server control at run time. 
    }

}