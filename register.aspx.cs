using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Xml;


public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string username = Request.Form["username"];
            string email = Request.Form["email"];
            string password = Request.Form["password"];
            string firstName = Request.Form["fname"];
            string lastName = Request.Form["lname"];
            string gender = Request.Form["gender"];
            int age = int.Parse(Request.Form["age"]);
            string topping = Request.Form["topping"];
            string crust = Request.Form["crust"];
            string cheese = Request.Form["cheese"];
            string spicy = Request.Form["spicy"];

            // Password hasing
            string salt = PasswordHelper.GenerateSalt();
            string hashedPassword = PasswordHelper.HashPassword(password, salt);

            string sql = "INSERT INTO Users(username, email, password_hash, salt, fname, lname, gender, age, favorite_topping, crust_preference, cheese_level, spicy_level) " +
             "VALUES('" + username + "', '" + email + "', '" + hashedPassword + "', '" + salt + "', '" + firstName + "', '" + lastName + "', '" + gender + "', " + age + ", '" + topping + "', '" + crust + "', '" + cheese + "', '" + spicy + "')";
            string fileName = "Database.mdf";

            try
            {
                int rowsAffected = MyAdoHelper.RowsAffected(fileName, sql);

                if (rowsAffected > 0)
                {
                    Session["userName"] = username;
                    Session["userFullName"] = firstName + " " + lastName;
                    // Show success popup
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "successPopup",
                        "showPopup('Success', 'Your registered successfully!', 'success');", true);
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

                string safeMessage = HttpUtility.JavaScriptStringEncode(ex.Message);
                // Show a failure popup with the error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "failurePopup",
                    "showPopup('Error', 'An unexpected error occurred: " + safeMessage + "', 'error');", true);
            }
        }
    }
}