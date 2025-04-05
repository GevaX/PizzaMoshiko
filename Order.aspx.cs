using System;
using System.Collections.Generic;
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
            string pizzaType = Request.Form["pizza"];
            string size = Request.Form["size"];
            string extraToppings = Request.Form["toppings"];
            int quantity = int.Parse(Request.Form["quantity"]);
            string deliveryMethod = Request.Form["deliveryMethod"];
            string address = Request.Form["address"];
            string paymentMethod = Request.Form["payment"];
            DateTime orderDate = DateTime.Now;

            string sql = "INSERT INTO Orders (UserName, PizzaType, Size, ExtraToppings, Quantity, DeliveryMethod, Address, PaymentMethod, OrderDate) " +
             "VALUES('" + userName + "', '" + pizzaType + "', '" + size + "', '" + extraToppings + "', '" + quantity + "', '" + deliveryMethod + "', '" + address + "', '" + paymentMethod + "', '" + orderDate + "')";
            string fileName = "Database.mdf";
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