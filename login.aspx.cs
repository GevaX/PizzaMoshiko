using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    public string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string email = Request.Form["email"];
            string enteredPassword = Request.Form["password"];

            string fileName = "RegistrationDB.mdf";
            string sql = "SELECT password_hash FROM Users WHERE email = '" + email +"'";
            string storedHash = (string)MyAdoHelper.GetFieldValue(fileName, sql);
            sql = "SELECT salt FROM Users WHERE email = '" + email + "'";
            string storedSalt = (string)MyAdoHelper.GetFieldValue(fileName, sql);

            if (PasswordHelper.VerifyPassword(enteredPassword,storedHash,storedSalt))
            {
                sql = "SELECT username FROM Users WHERE email = '" + email + "'";
                string username = (string)MyAdoHelper.GetFieldValue(fileName, sql);
                sql = "SELECT isManager FROM Users WHERE email = '" + email + "'";
                if ((bool)MyAdoHelper.GetFieldValue(fileName, sql) == true)
                {
                    Session["isManager"] = true;
                }
                Session["userName"] = username;
                Response.Redirect("Default.aspx");
            }
            else
            {
                msg = "Invalid username or password";
            }
        }
    }
}