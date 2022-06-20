using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select UserName,Photo from RegistrationDetails where UserName='"+txtname.Text+"' and Password='"+txtpwd.Text+"'";
        cmd.Connection = con;
        SqlDataReader sdr;
        sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            Session["uname"] = sdr[0].ToString();
            Session["img"] = sdr[1].ToString();
            Response.Redirect("User/chat.aspx");
        }
    }
    protected void btnLogin1_Click(object sender, EventArgs e)
    {
        string clientid = "64581359306-ugmm396ae2d8c4cmo3q4lko7830nq3ph.apps.googleusercontent.com";
        //your client secret  
        string clientsecret = "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";
        //your redirection url  
        string redirection_url = "http://localhost:52381/Project/API.aspx";
        string url = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile&include_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
        Response.Redirect(url);
    }
   
    
}
