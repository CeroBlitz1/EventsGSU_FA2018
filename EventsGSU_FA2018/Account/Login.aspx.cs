using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace EventsGSU_FA2018.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if (AuthUser(TextBoxUser.Text, TextBoxPassword.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(TextBoxUser.Text, CheckBoxrem.Checked);
            }
            else
            {
                lblmsg.Text = "Invalid User Name or Password";
            }
        }
        private bool AuthUser(string username, string password)
        {
            //var g =  ConfigurationManager.ConnectionStrings["GsuEventsDBEntities"].ConnectionString;

            //using (SqlConnection con = new SqlConnection(g))
            //{
            //    SqlCommand cmd = new SqlCommand("spAuthenticateUser", con);
            //    cmd.CommandType = CommandType.StoredProcedure;

            //    SqlParameter paramUserName = new SqlParameter("@UserName", username);
            //    SqlParameter paramUserPassword = new SqlParameter("@UserPassword", password);

            //    cmd.Parameters.Add(paramUserName);
            //    cmd.Parameters.Add(paramUserPassword);

            //    con.Open();
            //    int ReturnCode = (int)cmd.ExecuteScalar();
            //    return ReturnCode == 1;
            //}
            return true;
        }
    }


}
    
