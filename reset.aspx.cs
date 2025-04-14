using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string username = Request.Form["username"];
            string email = Request.Form["email"];
            string password = Request.Form["password"];

            string sql = "SELECT * FROM Users WHERE email = '" + email + "' and username = '" + username + "'";
            string fileName = "Database.mdf";
            if (MyAdoHelper.IsExist(fileName, sql))
            {
                string salt = PasswordHelper.GenerateSalt();
                string hashedPassword = PasswordHelper.HashPassword(password, salt);
                sql = "UPDATE Users SET password_hash = '" + hashedPassword + "', salt = '" + salt + "' WHERE email = '" + email + "'";
                int rowsAffected = MyAdoHelper.RowsAffected(fileName, sql);

                if (rowsAffected > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Reset password successfully!'); window.location='Default.aspx';", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Action failed. Please try again.');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User not found.');", true);
            }
        }
    }
}