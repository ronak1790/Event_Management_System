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

public partial class bookevent : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        fillcity();
        if (Session["uname"] == null || (Session["urole"] == null || Session["urole"].ToString() != "1"))
            Response.Redirect("clientlogin.aspx");


        string scriptStr = "return showCalendar('" + getClientID(txtstartdate) + "', 'mm/dd/y');";
        imgstartdate.Attributes.Add("onClick", scriptStr);


        scriptStr = "return showCalendar('" + getClientID(txtenddate) + "', 'mm/dd/y');";
        imgenddate.Attributes.Add("onClick", scriptStr);


    }
    static public string getClientID(Control Id)
    {
        return Id.ClientID.ToString();
    }


    public void fillcity()
    {
        DataTable ds = new DataTable();
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();

        con.ConnectionString = "Data Source=RONAK-PC\\SQLEXPRESS;Initial Catalog=EMS;Integrated Security=True";
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from city";
        cmd.CommandType = CommandType.Text;
        da.SelectCommand = cmd;
        da.Fill(ds);
        con.Close();

        ddlcity.DataSource = ds;
        ddlcity.DataTextField = "cname";
        ddlcity.DataValueField = "city_id";
        ddlcity.DataBind();


    }





    protected void btnDivAdd_Click(object sender, EventArgs e)
    {
        SqlParameter[] pdiv = new SqlParameter[9];
        pdiv[0] = new SqlParameter("@city", "ahmedabad");
        pdiv[1] = new SqlParameter("@area", txtarea.Text.Trim());
        pdiv[2] = new SqlParameter("@venue", venue.Text.Trim());
        pdiv[3] = new SqlParameter("@startdate", txtstartdate.Text.Trim());
        pdiv[4] = new SqlParameter("@enddate", txtenddate.Text.Trim());
        pdiv[5] = new SqlParameter("@guestaspected", guest.Text.Trim());
        pdiv[6] = new SqlParameter("@timeofevent", toe.Text.Trim());
        pdiv[7] = new SqlParameter("@pid", Session["pid"].ToString());
        pdiv[8] = new SqlParameter("@uname", Session["uname"].ToString());



        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandTimeout = 0;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "bookevent_insert";
        cmd.Parameters.AddRange(pdiv);
        object obj = cmd.ExecuteScalar();
        con.Close();

        Response.Redirect("Successfully.aspx");
    }








    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}