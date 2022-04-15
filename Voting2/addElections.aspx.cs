using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addElections : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string str = ConfigurationManager.ConnectionStrings["votingdatabase"].ToString();
        con = new SqlConnection(str);
        con.Open();

        string one = startdate.Value;
        string two = starttime.Value;
        DateTime dt1 = Convert.ToDateTime(one + " " + two);

        one = enddate.Value;
        two = endtime.Value;
        DateTime dt2 = Convert.ToDateTime(one + " " + two);      

 
        
        int[] branch = new int[3];
        int c = 0;
        foreach (ListItem item in CheckBoxList3.Items)
        {
            if (item.Selected)
            {
                branch[c] = 1;
            }
            c++;
        }

        string command = "insert into elections values('"+title.Value+"','"+dt1.ToString()+"','"+dt2.ToString()+"','"+description.Value+"',"+branch[0]+","+branch[1]+","+branch[2]+")";
        SqlCommand cmd = new SqlCommand(command, con);
        try {
            cmd.ExecuteNonQuery();
        }
        catch(SqlException exre)
        {
            Label1.Text = "系统错误，也许已经添加了选举?  ";
        }
        con.Close();
    }
}