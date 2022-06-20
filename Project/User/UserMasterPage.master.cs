using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_UserMasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //lblname.Text = "Welcome "+" "+Session["uname"].ToString()+"...";
            //con.Close();
            //con.Open();
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "select Photo from RegistrationDetails where UserName='" + Session["uname"].ToString()+ "'";
            //cmd.Connection = con;
            //SqlDataReader sdr=cmd.ExecuteReader();
            //if(sdr.Read())
            //{
            //    ImageButton1.ImageUrl =sdr[0].ToString();
            //}
           
            
        }
    }
}
