using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class worker : System.Web.UI.Page
{
    public string orderList = "";
    string fileName = "Database.mdf";
    string sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string username = Request.Form["username"];
            string enteredPassword = Request.Form["password"];

            sql = "SELECT password_hash FROM Workers WHERE username = '" + username + "'";
            string storedHash = (string)MyAdoHelper.GetFieldValue(fileName, sql);
            sql = "SELECT salt FROM Workers WHERE username = '" + username + "'";
            string storedSalt = (string)MyAdoHelper.GetFieldValue(fileName, sql);

            if (PasswordHelper.VerifyPassword(enteredPassword, storedHash, storedSalt))
            {
                Session["workerName"] = username;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Login failed. Please try again.');", true);
            }
        }

        sql = "SELECT * FROM Orders";
        orderList = MyAdoHelper.printOrderTable(fileName, sql);
    }
}