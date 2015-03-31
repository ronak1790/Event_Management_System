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
using System.IO;

public partial class admindeletephoto : System.Web.UI.Page
{



    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    public static char directorySeparator = Path.DirectorySeparatorChar;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null || Session["urole"] == null)
            Response.Redirect("Adminlogin.aspx");
     
        if (!IsPostBack)
        {
            getallphotos();

        }
    }

    public static string RootPath
    {
        get
        {
            return HttpContext.Current.Request.PhysicalApplicationPath;
        }
    }

    public static void DeleteFile(string path)
    {
        FileInfo file = new FileInfo(path);
        if (file.Exists)
        {
            file.Delete();
        }

    }

    void getallphotos()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            string qry = "Select  * from Photos order by PKPhotoId";
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
        {

        }
    }

    public void deletephotos(string pkid)
    {
        try
        {

            DataTable ds = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
          
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = " delete from Photos where PKPhotoId=" + pkid;
            cmd.CommandType = CommandType.Text;

            da.SelectCommand = cmd;
            da.Fill(ds);
            con.Close();


         


        }
        catch { }
        finally
        {

        }

    }


    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        getallphotos();

    }



    protected void gv_RowEvent(object sender, EventArgs e)
    {
        switch (e.GetType().Name)
        {
            case "GridViewDeleteEventArgs": // Record deletion has been handled by ObjectDataSource
                {

                    //Here as we've to create the object and handle the delete manually we'll
                    //perform the delete and then cancel the event
                    object delId = gv.DataKeys[((GridViewDeleteEventArgs)e).RowIndex].Value;

                    // Get the name of file before deleting the record from database                

                    string fileNameT = gv.Rows[((GridViewDeleteEventArgs)e).RowIndex].Cells[4].Text;
                    string fileNameI = gv.Rows[((GridViewDeleteEventArgs)e).RowIndex].Cells[5].Text;

                    // Delete record and display message
                    if (delId != null )
                    {
                        // Delete it from database

                        lblMsg.Visible = true;
                        // Full path of file to be deleted
                        string fullFileNameT = RootPath + "Gallery\\" + fileNameT;
                        string fullFileNameI = RootPath + "Gallery\\" + fileNameI;
                        // Delete the file                    
                        
                        
                        DeleteFile(fullFileNameT);
                        DeleteFile(fullFileNameI);

                        deletephotos( delId.ToString());


                    }



                    ((GridViewDeleteEventArgs)e).Cancel = true;
                    //Bind data to datagrid

                    getallphotos();

                    break;
                   
                }
        }

       
    }

   
    
}
