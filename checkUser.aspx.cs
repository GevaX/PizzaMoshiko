using System;
using System.Web;
using System.Data.SqlClient;

public partial class checkUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string username = Request.QueryString["username"];
        string email = Request.QueryString["email"];
        string fileName = "RegistrationDB.mdf";

        string sql = "";
        if (!string.IsNullOrEmpty(username))
        {
            sql = "SELECT * FROM Users WHERE username = '" + username + "'";
        }
        else if (!string.IsNullOrEmpty(email))
        {
            sql = "SELECT * FROM Users WHERE email = '" + email + "'";
        }

        bool exists = MyAdoHelper.IsExist(fileName, sql);
        Response.Write(exists ? "exists" : "available");
        Response.End();
    }
}
