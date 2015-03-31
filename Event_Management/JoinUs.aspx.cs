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

public partial class JoinUs : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    static string LocateFlag = "INSERT";
    static int LocateIndex = -1;

    void ResetCategory()
    {
        txtsurname.Text = "";

        LocateIndex = -1;
        LocateFlag = "INSERT";
    }

    static public string getClientID(Control Id)
    {
        return Id.ClientID.ToString();
    }


    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[11];
        pdiv[0] = new SqlParameter("@flag", LocateFlag);
        pdiv[1] = new SqlParameter("@CID", LocateIndex);
        pdiv[2] = new SqlParameter("@CName", txtname.Text.Trim());
        pdiv[3] = new SqlParameter("@Csurname", txtsurname.Text.Trim());
        pdiv[4] = new SqlParameter("@Caddress", txtaddress.Text.Trim());
        pdiv[5] = new SqlParameter("@Ccity", txtcity.Text.Trim());
        pdiv[6] = new SqlParameter("@Ccontactno", txtcontactno.Text.Trim());
        pdiv[7] = new SqlParameter("@Cemail", txtemailid.Text.Trim());
        pdiv[8] = new SqlParameter("@Cwebsite", txtwebsite.Text.Trim());
        pdiv[9] = new SqlParameter("@Cusername", txtuname.Text.Trim());
        pdiv[10] = new SqlParameter("@Cpassword", txtpassword.Text.Trim());

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Joinus_insert";
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

            //bindCategory();
            ResetCategory();
        }
    }
    protected void btnDivCancel_Click(object sender, EventArgs e)
    {
        ResetCategory();
    }








}
