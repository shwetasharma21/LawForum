using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class HomePage : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    private UInt64 user_id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        String name = getUname();
        if (name == null)
        {
            Response.Redirect("WelcomePage.aspx");
        }
        else
        {
            LblHomeMsgUserName.Text = "Welcome " + name;
        }
    }
    public String getUname()
    {
        try
        {
            user_id = UInt64.Parse(Session["user_id"].ToString());
            con = SqlHelper.getInstance();
            con.Open();
            cmd = new SqlCommand("select user_name from Users where user_id=" + user_id, con);
            dr = cmd.ExecuteReader();
            dr.Read();
            return dr[0].ToString();
        }
        catch
        {
            return null;
        }
    }
    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session["user_id"] = 0;
        Response.Redirect("WelcomePage.aspx");
    }
}