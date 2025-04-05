using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagerPage : System.Web.UI.Page
{
    public string userList = "";
    public string orderList = "";
    public string workerList = "";
    private string sql = "";
    public string cMsg;
    protected void Page_Load(object sender, EventArgs e)
    {
        cMsg = (string)Application["msg"];
        string fileName = "Database.mdf";

        // User List
        sql = "SELECT * FROM Users";
        userList = MyAdoHelper.printUserTable(fileName, sql);

        // Order list
        sql = "SELECT * FROM Orders";
        orderList = MyAdoHelper.printDataTable(fileName, sql);

        // Worker List
        sql = "SELECT * FROM Workers";
        workerList = MyAdoHelper.printDataTable(fileName,sql);

        // Global Message setter
        if (Request.Form["submit"] != null)
        {
            string msg = Request.Form["msg"];
            Application["msg"] = msg;
            cMsg = msg;
        }
        else if (Request.Form["delete"] != null)
        {
            Application["msg"] = "";
            cMsg = "";
        }
        // Delete User
        if (Request.Form["deleteacc"] != null)
        {
            string id = Request.Form["id"];
            int userId = int.Parse(id);
            sql = "DELETE FROM Users WHERE id = '" + userId + "'";
            MyAdoHelper.DoQuery(fileName, sql);
        }

        // Add Worker
        if (Request.Form["worker"] != null)
        {
            string username = Request.Form["username"];
            string email = Request.Form["email"];
            string password = Request.Form["password"];

            // Password hasing
            string salt = PasswordHelper.GenerateSalt();
            string hashedPassword = PasswordHelper.HashPassword(password, salt);

            sql = "INSERT INTO Workers(username, email, password_hash, salt) " +
             "VALUES('" + username + "', '" + email + "', '" + hashedPassword + "', '" + salt + "')";

            try
            {
                int rowsAffected = MyAdoHelper.RowsAffected(fileName, sql);

                if (rowsAffected > 0)
                {
                    // Show success popup
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "successPopup",
                        "showPopup('Success', 'Worker registered successfully!', 'success');", true);
                }
                else
                {
                    // Show failure popup if no rows were affected
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "failurePopup",
                        "showPopup('Error', 'Failed to create account. Please try again.', 'error');", true);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);

                // Show a failure popup with the error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "failurePopup",
                    "showPopup('Error', 'An unexpected error occurred: " + ex.Message + "', 'error');", true);
            }
        }

        // Change worker password
        if (Request.Form["worker-password"] != null)
        {
            string username = Request.Form["usernameP"];
            string password = Request.Form["passwordP"];

            // Password hasing
            string salt = PasswordHelper.GenerateSalt();
            string hashedPassword = PasswordHelper.HashPassword(password, salt);

            sql = "UPDATE Workers SET password_hash = '" + hashedPassword + "', salt = '" + salt + "' WHERE username = '" + username + "'";

            try
            {
                int rowsAffected = MyAdoHelper.RowsAffected(fileName, sql);

                if (rowsAffected > 0)
                {
                    // Show success popup
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "successPopup",
                        "showPopup('Success', 'Changed worker password successfully!', 'success');", true);
                }
                else
                {
                    // Show failure popup if no rows were affected
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "failurePopup",
                        "showPopup('Error', 'Failed to update password. Please try again.', 'error');", true);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);

                // Show a failure popup with the error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "failurePopup",
                    "showPopup('Error', 'An unexpected error occurred: " + ex.Message + "', 'error');", true);
            }
        }
    }
}