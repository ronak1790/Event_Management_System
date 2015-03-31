using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


public partial class adminuploadphoto : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["uname"] == null || Session["urole"] == null)
            Response.Redirect("Adminlogin.aspx");
        if (!IsPostBack)
        {
            category();
            subcategory(drpcategory.SelectedValue);
           
        }
    }




   
    static string LocateFlag = "INSERT";
    static int LocateIndex = -1;



    public void category()
    {
        DataTable ds = new DataTable();
       
        SqlDataAdapter da = new SqlDataAdapter();

       
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = " select * from category";
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();


        drpcategory.DataSource = ds;
        drpcategory.DataTextField = "cat_name";
        drpcategory.DataValueField = "cat_id";
        drpcategory.DataBind();


    }




    public void subcategory(string category_id )
    {
        DataTable ds = new DataTable();
       
        SqlDataAdapter da = new SqlDataAdapter();

       
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = " select * from subcategory where cat_id="+ category_id;
        cmd.CommandType = CommandType.Text;

        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();


        drpsubcategory.DataSource = ds;
        drpsubcategory.DataTextField = "subcat_name";
        drpsubcategory.DataValueField = "subcat_id";
        drpsubcategory.DataBind();


    }







    public bool ThumbnailCallback()
    {
        return false;
    }

    public bool Upload()
    {
        // Initialize variables
        string sSavePath;
        string sThumbExtension;
        string ssmallThumbExtension;
        int intThumbWidth;
        int intThumbHeight;

        // Set constant values
        sSavePath = "Gallery/";
        sThumbExtension = "_T";

        intThumbWidth = 160;
        intThumbHeight = 120;

        // If file field isn’t empty
        if (filUpload.PostedFile != null)
        {
            // Check file size (mustn’t be 0)
            HttpPostedFile myFile = filUpload.PostedFile;
            int nFileLen = myFile.ContentLength;
            if (nFileLen == 0)
            {
                lblUploadMessage.Visible = true;
                lblUploadMessage.Text = "There wasn't any file uploaded.";
                return false;
            }

            if (filUpload.PostedFile.ContentLength > 1024 * 512)
            {
                lblUploadMessage.Visible = true;
                lblUploadMessage.Text = "files up to 512 Kb can be uploaded";
                return false;
            }

            // Check file extension (must be JPG)
            if ((System.IO.Path.GetExtension(myFile.FileName).ToLower() != ".jpg") && (System.IO.Path.GetExtension(myFile.FileName).ToLower() != ".jpeg"))
            {
                lblUploadMessage.Visible = true;
                lblUploadMessage.Text = "The file must have an extension of JPG or JPG";
                return false;
            }

            // Read file into a data stream
            byte[] myData = new Byte[nFileLen];
            myFile.InputStream.Read(myData, 0, nFileLen);

            // Make sure a duplicate file doesn’t exist.  If it does, keep on appending an incremental numeric until it is unique
            string sFilename = System.IO.Path.GetFileName(myFile.FileName);
            int file_append = 0;
            while (System.IO.File.Exists(Server.MapPath(sSavePath + sFilename)))
            {
                file_append++;
                sFilename = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName) + file_append.ToString() + ".jpg";
            }

            // Save the stream to disk
            System.IO.FileStream newFile = new System.IO.FileStream(Server.MapPath(sSavePath + sFilename), System.IO.FileMode.Create);
            newFile.Write(myData, 0, myData.Length);
            newFile.Close();

            // Check whether the file is really a JPEG by opening it
            System.Drawing.Image.GetThumbnailImageAbort myCallBack = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
            Bitmap myBitmap;
            try
            {
                myBitmap = new Bitmap(Server.MapPath(sSavePath + sFilename));

                // If jpg file is a jpeg, create a thumbnail filename that is unique.
                file_append = 0;
                string sThumbFile = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName) + sThumbExtension + ".jpg";

                while (System.IO.File.Exists(Server.MapPath(sSavePath + sThumbFile)))
                {
                    file_append++;
                    sThumbFile = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName) + file_append.ToString() + sThumbExtension + ".jpg";
                }

                // Save thumbnail and output it onto the webpage
                System.Drawing.Image myThumbnail = myBitmap.GetThumbnailImage(intThumbWidth, intThumbHeight, myCallBack, IntPtr.Zero);
                myThumbnail.Save(Server.MapPath(sSavePath + sThumbFile));



                // Displaying success information
                lblUploadMessage.Visible = true;
                lblUploadMessage.Text = "File uploaded successfully!";

                // Destroy objects
                myThumbnail.Dispose();
                myBitmap.Dispose();

            }
            catch (ArgumentException errArgument)
            {
                // The file wasn't a valid jpg file
                lblUploadMessage.Visible = true;
                lblUploadMessage.Text = "The file wasn't a valid jpg file.";
                System.IO.File.Delete(Server.MapPath(sSavePath + sFilename));
                return false;
            }

        }

        return true;
    }


    protected void btnAddToCategory_Click(object sender, EventArgs e)
    {
        if (Upload())
        {
            string nm = System.IO.Path.GetFileName(filUpload.PostedFile.FileName);

            UpdateGallery(System.IO.Path.GetFileNameWithoutExtension(filUpload.PostedFile.FileName) + "_T" + System.IO.Path.GetExtension(filUpload.PostedFile.FileName).ToLower(), System.IO.Path.GetFileName(filUpload.PostedFile.FileName).ToString(), txtMemo.Text);
        }



        //===================================>>>



        //SqlParameter[] pdiv = new SqlParameter[6];
        //pdiv[0] = new SqlParameter("@flag", LocateFlag);
        //pdiv[1] = new SqlParameter("@ID", LocateIndex);
        //pdiv[2] = new SqlParameter("@TFilename", filUpload.Text.Trim());
        //pdiv[3] = new SqlParameter("@IFileName", filUpload.Text.Trim());
        //pdiv[4] = new SqlParameter("@Description", txtMemo.Text.Trim());
        //pdiv[5] = new SqlParameter("@Cid", drpsubcategory.SelectedValue.Trim());
        //con.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;
        //cmd.CommandTimeout = 0;
        //cmd.CommandType = CommandType.StoredProcedure;
        //cmd.CommandText = "photo_addupdate";
        //cmd.Parameters.AddRange(pdiv);
        //object obj = cmd.ExecuteScalar();
        //con.Close();
        //if (obj.ToString() == "-1")
        //{
        //    lblDivMsg.Text = "Already Exist";
        //}
        //else
        //{
        //    lblDivMsg.Text = "Operation Completed Successfully";

           
        //}


    }

    private void UpdateGallery(string strTFileName, string strIFileName, string strMemo)
    {
        //   Variables declaration
        //string strConnString = System.Configuration.ConfigurationManager.AppSettings.Get("con").ToString();
       
        SqlCommand sqlcmd = new SqlCommand();

        //   Building the query
        string sqlQuery_Photo = "INSERT INTO [Photos] VALUES ('{0}', '{1}', '{2}' ,'{3}' )";

        if (chk.Checked)
             sqlQuery_Photo = sqlQuery_Photo +  " update Subcategory set subcat_Photos = '" + strIFileName  + "' where subcat_id = " + drpsubcategory.SelectedValue +"";


        sqlQuery_Photo = sqlQuery_Photo.Replace("{0}", strTFileName);
        sqlQuery_Photo = sqlQuery_Photo.Replace("{1}", strIFileName);
        sqlQuery_Photo = sqlQuery_Photo.Replace("{2}", strMemo);
        sqlQuery_Photo = sqlQuery_Photo.Replace("{3}", drpsubcategory.SelectedValue);
       
        //   Retrieving search result
        con.Open();
        sqlcmd.Connection = con;

        //   Adding records to table
        sqlcmd.CommandText = sqlQuery_Photo;
        sqlcmd.CommandTimeout = 0;
        sqlcmd.ExecuteNonQuery();

        con.Close();
    }




    protected void drpcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        subcategory(drpcategory.SelectedValue);
    }
}
