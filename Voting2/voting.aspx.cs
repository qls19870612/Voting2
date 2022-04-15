using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class voting : System.Web.UI.Page
{
    SqlConnection con;
    int election_id;
    string title;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            election_id = Convert.ToInt32(Request.QueryString["id"]);
            title = Request.QueryString["title"].ToString();
        }
        Label1.Text = "";
    }
    protected void vote_Click(object sender, EventArgs e)
    {
     
        string user_branch;
 
        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;

        string firstColData = grdrow.Cells[0].Text;
        string str = ConfigurationManager.ConnectionStrings["votingdatabase"].ToString();
        con = new SqlConnection(str);
        con.Open();

        
        bool authorised = false;
        string str1 = "select it,edu,med from elections where id='"+election_id+"'";
        string str2 = "select branch from users where id='"+Context.User.Identity.Name+"'";

        SqlCommand cmd2 = new SqlCommand(str2, con);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        dr2.Read();
 
            user_branch = dr2.GetString(2);
        dr2.Close();
        SqlCommand cmd1 = new SqlCommand(str1, con);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            
                
            if((dr1.GetInt32(12)==1 && user_branch=="IT")||(dr1.GetInt32(13) == 1 && user_branch == "EDU") ||(dr1.GetInt32(14) == 1 && user_branch == "MED"))
            {
                authorised = true;
            }
                
           
        }
        dr1.Close();
        if (authorised)
        {
            string command = "insert into votes values (" + election_id + ",'" + title + "','" + firstColData + "','" + Context.User.Identity.Name + "')";
            SqlCommand cmd = new SqlCommand(command, con);
            try {
                cmd.ExecuteNonQuery();
            }
            catch(SqlException e1)
            {
                Label1.Text = "已经投票！";
            }
        }
        else
            Label1.Text = "你未达到投票条件!";
        con.Close();

        LinkButton l1 = sender as LinkButton;
        l1.Visible = false;

    }
}