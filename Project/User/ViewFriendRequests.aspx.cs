using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ViewFriendRequests : System.Web.UI.Page
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
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select FriendsRequest.Froms,RegistrationDetails.Photo from RegistrationDetails inner join FriendsRequest  on RegistrationDetails.UserName=FriendsRequest.Tos where FriendsRequest.Tos='" + Session["uname"].ToString() + "' and FriendsRequest.Status='Request Sent'";
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
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "update FriendsRequest set Status='Accept' where Tos='" + Session["uname"].ToString() + "' and FriendsRequest.Status='Request Sent'";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Response.Redirect("ViewFriendRequests.aspx");
    }
}