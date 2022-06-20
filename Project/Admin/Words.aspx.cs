using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Words : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into words values('"+DropDownList1.SelectedItem.Text+"','"+txtwords.Text+"')";
        cmd.Connection = con;
        int g=cmd.ExecuteNonQuery();
        if (g > 0)
        {
           ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Added')</script>");
           txtwords.Text = "";
        }
    }
}