using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        con.Open();
       
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into RegistrationDetails values( '" + txtuname.Text + "','" + txtpwd.Text + "','" + txtmob.Text + "','" + txtemail.Text + "','"+RadioButtonList1.SelectedItem.Text+"','" + txtdob.Text + "','" + txtAddress.Text + "','null','Add Request')";
        cmd.Connection = con;
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Added')</script>");
            Response.Redirect("User.aspx");
        }
    }
}