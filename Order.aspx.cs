using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    public int orderID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string userName = Session["userName"].ToString();
            string fullName = "";
            string pizzaType = Request.Form["pizza"];
            string size = Request.Form["size"];
            string extraToppings = Request.Form["toppings"];
            int quantity = int.Parse(Request.Form["quantity"]);
            string deliveryMethod = Request.Form["deliveryMethod"];
            string address = Request.Form["address"];
            string paymentMethod = Request.Form["payment"];
            DateTime orderDate = DateTime.Now;

            string fileName = "Database.mdf";
            // Get full user's name
            string sql = "SELECT fname, lname FROM Users WHERE username = '" + userName + "'" ;
            DataTable dt = MyAdoHelper.ExecuteDataTable(fileName, sql);

            if (dt.Rows.Count > 0)
            {
                string firstName = dt.Rows[0]["fname"].ToString();
                string lastName = dt.Rows[0]["lname"].ToString();
                fullName = firstName + " " + lastName;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "failurePopup",
                    "showPopup('Error', 'An unexpected error occurred', 'error');", true);
            }

            sql = "INSERT INTO Orders (UserName, FullName, PizzaType, Size, ExtraToppings, Quantity, DeliveryMethod, Address, PaymentMethod, OrderDate) " +
             "VALUES('" + userName + "', '" + fullName + "', '" + pizzaType + "', '" + size + "', '" + extraToppings + "', '" + quantity + "', '" + deliveryMethod + "', '" + address + "', '" + paymentMethod + "', '" + orderDate + "')";
            orderID = MyAdoHelper.InsertAndGetId(fileName, sql);

            if (orderID > 0)
            {
                // Show success popup
                ScriptManager.RegisterStartupScript(this, this.GetType(), "successPopup",
                    "showPopup('Success', 'Your order has been placed successfully!', 'success');", true);
            }
            else
            {
                // Show failure popup
                ScriptManager.RegisterStartupScript(this, this.GetType(), "failurePopup",
                    "showPopup('Error', 'Failed to place your order. Please try again.', 'error');", true);
            }
        }
    }
}