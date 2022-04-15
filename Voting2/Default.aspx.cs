using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["uid"] != null)
        {
            string msg = "注册成功,账号ID:" + Request.QueryString["uid"].ToString() + ". 请登录.";
            Label1.Text = msg;
        }
        else
            Label1.Text = null;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string str = ConfigurationManager.ConnectionStrings["votingdatabase"].ToString();
        con = new SqlConnection(str);
        con.Open();

        SqlCommand cmd = new SqlCommand("select * from users where id='" + username.Value + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            if (password.Value.ToString() == dr.GetString(14))
            {
                FormsAuthentication.SetAuthCookie(username.Value, true);
                Response.Redirect("Elections.aspx");
            }
            else
            {
                Label1.Text = "密码错误请重试";
            }
        }
        else
        {
            Label1.Text = "没有找到具有此用户名的用户。 请注册。";
        }

        con.Close();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin.aspx");
    }
}