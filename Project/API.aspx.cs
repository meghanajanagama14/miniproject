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
public partial class API : System.Web.UI.Page
{
    //your client id  
    string clientid = "64581359306-ugmm396ae2d8c4cmo3q4lko7830nq3ph.apps.googleusercontent.com";
    //your client secret  
    string clientsecret = "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";
    //your redirection url  
    string redirection_url = "http://localhost:52381/Project/API.aspx";
    string url = "https://accounts.google.com/o/oauth2/token";
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    public class Tokenclass
    {
        public string access_token
        {
            get;
            set;
        }
        public string token_type
        {
            get;
            set;
        }
        public int expires_in
        {
            get;
            set;
        }
        public string refresh_token
        {
            get;
            set;
        }
    }
    public class Userclass
    {
        public string id
        {
            get;
            set;
        }
        public string name
        {
            get;
            set;
        }
        public string given_name
        {
            get;
            set;
        }
        public string family_name
        {
            get;
            set;
        }
        public string link
        {
            get;
            set;
        }
        public string picture
        {
            get;
            set;
        }
        public string gender
        {
            get;
            set;
        }
        public string locale
        {
            get;
            set;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["code"] != null)
            {
                GetToken(Request.QueryString["code"].ToString());
            }
        }
    }
    public void GetToken(string code)
    {
        string poststring = "grant_type=authorization_code&code=" + code + "&client_id=" + clientid + "&client_secret=" + clientsecret + "&redirect_uri=" + redirection_url + "";
        var request = (HttpWebRequest)WebRequest.Create(url);
        request.ContentType = "application/x-www-form-urlencoded";
        request.Method = "POST";
        UTF8Encoding utfenc = new UTF8Encoding();
        byte[] bytes = utfenc.GetBytes(poststring);
        Stream outputstream = null;
        try
        {
            request.ContentLength = bytes.Length;
            outputstream = request.GetRequestStream();
            outputstream.Write(bytes, 0, bytes.Length);
        }
        catch { }
        var response = (HttpWebResponse)request.GetResponse();
        var streamReader = new StreamReader(response.GetResponseStream());
        string responseFromServer = streamReader.ReadToEnd();
        JavaScriptSerializer js = new JavaScriptSerializer();
        Tokenclass obj = js.Deserialize<Tokenclass>(responseFromServer);
        GetuserProfile(obj.access_token);
    }
    public void GetuserProfile(string accesstoken)
    {
        string url = "https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=" + accesstoken + "";
        WebRequest request = WebRequest.Create(url);
        request.Credentials = CredentialCache.DefaultCredentials;
        WebResponse response = request.GetResponse();
        Stream dataStream = response.GetResponseStream();
        StreamReader reader = new StreamReader(dataStream);
        string responseFromServer = reader.ReadToEnd();
        reader.Close();
        response.Close();
        JavaScriptSerializer js = new JavaScriptSerializer();
        Userclass userinfo = js.Deserialize<Userclass>(responseFromServer);
        imgprofile.ImageUrl = userinfo.picture;
        lblid.Text = userinfo.id;
        lblgender.Text = userinfo.gender;
        lbllocale.Text = userinfo.locale;
        lblname.Text = userinfo.name;
        hylprofile.NavigateUrl = userinfo.link;
    }
    public void insert()
    {
        con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into RegistrationDetails values( '" + lblname.Text + "','null','null','null','" + lblgender.Text + "','null','null','null','Add Request')";
        cmd.Connection = con;
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i > 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Added')</script>");
            login();
        }
    }
    public void login()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select UserName,Photo from RegistrationDetails where UserName='" + lblname.Text + "'";
        cmd.Connection = con;
        SqlDataReader sdr;
        sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            Session["uname"] = sdr[0].ToString();
            Session["img"] = sdr[1].ToString();
            Response.Redirect("User/StatusUpdate.aspx");
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        insert();
    }
}