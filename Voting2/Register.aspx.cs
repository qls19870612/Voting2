using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class images_Register : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string str = ConfigurationManager.ConnectionStrings["votingdatabase"].ToString();
        con = new SqlConnection(str);
        con.Open();

        string command = "insert into users values('" + rollnum.Value + "','"
            + firstname.Value + "','"  + mobile.Value + "','"
            + email.Value + "','" + state.Value + "','" + birthdate.Value + "','"
            + RadioButtonList1.SelectedValue + "','"+DropDownList5.SelectedValue+"','"+pass.Value+"')";
        Console.WriteLine(String.Format("command:%s", command));
        SqlCommand cmd = new SqlCommand(command,con);
        try {
            cmd.ExecuteNonQuery();
        }
        catch(SqlException sdfe)
        {
            Response.Write("可能些账号已经被注册!");
            Console.WriteLine(String.Format("Error:%s", sdfe.StackTrace));
        }
        con.Close();
        Response.Redirect("Default.aspx?uid=" + rollnum.Value);
    }
 
}