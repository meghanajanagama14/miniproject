using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_FindFriends : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }

    private void bind()
    {

    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string s = null;
    protected void lnkView_Click(object sender, EventArgs e)
    {
        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
        LinkButton btn = (LinkButton)grdrow.Cells[1].FindControl("lnkView");
        string status = btn.Text;
        string name = grdrow.Cells[0].Text;
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        if (status == "Add Request")
        {
            s = "insert into FriendsRequest values('" + Session["uname"].ToString() + "','" + name + "','Request Sent')";
            s += "update RegistrationDetails set Status='Request sent' where UserName='" + Session["uname"].ToString() + "'";
            cmd.CommandText = s;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }
    }
    //}
    //private void getStatus()
    //{
    //    con.Close();
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.CommandType = CommandType.Text;
    //    cmd.CommandText = "select Tos from RegistrationDetails where UserName!='" + Session["uname"].ToString() + "'";
    //    cmd.Connection = con;
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from RegistrationDetails where Status!='Accept' and UserName=@uname and UserName!='" + Session["uname"].ToString() + "' ";

        cmd.Parameters.AddWithValue("@uname", TextBox1.Text);
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}