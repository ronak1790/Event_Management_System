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
using System.IO;
using Ionic.Utils.Zip;

public partial class adminregistrationpage : System.Web.UI.Page
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
            string qry = "Select  * from joinus order by client_id";
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
