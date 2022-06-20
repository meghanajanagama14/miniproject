using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class User_chat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bind();
        }
    }

    public  void bind()
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select distinct UserName   from RegistrationDetails";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    protected void lnkView_Click(object sender, EventArgs e)
    {
        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
        LinkButton btn = (LinkButton)grdrow.Cells[1].FindControl("lnkView");
        string status = btn.Text;
        string name = grdrow.Cells[0].Text;
        Session["toname"] = name;
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select message    from msg where ToName=@name   or FromName=@name";
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into msg (ToName,FromName,message)values(@ToName,@FromName,@message)";

        cmd.Parameters.AddWithValue("@ToName", Session["toname"].ToString());
        cmd.Parameters.AddWithValue("@FromName", Session["uname"].ToString());
        cmd.Parameters.AddWithValue("@message", TextBox1.Text);
        cmd.Connection = con;
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select  message  from msg where  ToName=@ToName and FromName=@FromName union select  message  from msg where  ToName=@FromName and FromName=@ToName";
            cmd.Parameters.AddWithValue("@ToName", Session["toname"].ToString());
            cmd.Parameters.AddWithValue("@FromName", Session["uname"].ToString());
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
        
        }
    }
}