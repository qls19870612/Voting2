using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewcandidate : System.Web.UI.Page
{
    SqlConnection con;
    string user_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            user_id = Request.QueryString["id"].ToString();
        }
        Label1.Text = "";
        Label2.Text = "";
        Label3.Text = "";
        Label4.Text = "";
        Label5.Text = "";
        Label6.Text = "";
 
        Label7.Text = "";
        Label8.Text = "";

        string str = ConfigurationManager.ConnectionStrings["votingdatabase"].ToString();
        con = new SqlConnection(str);
        con.Open();

        string c = "select * from users where id='" + user_id + "'";
        SqlCommand cmd = new SqlCommand(c, con);
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        Label1.Text = dr.GetString(1);
      
        Label2.Text = dr.GetString(0);
        Label3.Text = dr.GetString(2);
        Label4.Text = dr.GetString(3);
        Label5.Text = dr.GetString(4);
        Label6.Text = Convert.ToString(dr.GetDateTime(5));
        
        Label7.Text = dr.GetString(6)=="m"?"男":"女";
       
        Label8.Text = viewcandidate.GetJobFromCode(dr.GetString(7));


    }
 

    public static String GetJobFromCode(String code)
    {
        String job = "IT";
        switch (code)
        {
            case "EDU":
                job = "教育";
                break;
            case "MED":
                job = "医疗";
                break;

        }
        return job;
    }
}