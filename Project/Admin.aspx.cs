using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtname.Focus();
    }
    
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtname.Text == "admin" && txtpwd.Text == "123")
        {
            Response.Redirect("Admin/Home.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Failed')</script>");
        }
    }


}