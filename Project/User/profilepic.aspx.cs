using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_profilepic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string strname = FileUpload1.FileName.ToString();
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Upload/") + strname);
            con.Open();
            SqlCommand cmd = new SqlCommand("update RegistrationDetails set Photo='" + "../Upload/" + strname + "' where UserName='"+Session["uname"].ToString()+"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("profilepic.aspx");
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Profile Pic Updated')</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Plz upload the image!!!!')</script>");
        }  
    }
}