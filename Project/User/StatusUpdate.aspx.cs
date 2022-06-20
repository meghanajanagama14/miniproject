using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_StatusUpdate : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            bind();
    }
    private void bind()
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from UpdateStatus";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    Boolean check2;
    protected void btnstatus_Click(object sender, EventArgs e)
    {
        Session["kk"] = null;
        Boolean s = checkwords();
        if (s!=true)
            {
                con.Close();
                con.Open();
                SqlCommand cmd1 = new SqlCommand("insert into UpdateStatus values('" + Session["uname"] + "','" + txtnamestatus.Text + "')", con);
                cmd1.ExecuteNonQuery();
                txtnamestatus.Text = "";
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Status Updated')</script>");
                bind();
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Bad Words Filtering.. U can not send this Status')</script>");
            }
    }
    string s;
    private Boolean checkwords()
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select words from words";
        cmd.Connection = con;
        SqlDataReader sdr;
        sdr = cmd.ExecuteReader();
        while(sdr.Read())
        {
            s = sdr[0].ToString();
            if (txtnamestatus.Text.Contains(s)==true)
            {
                check2 = true;
            }
        }
        return check2;
    }
}