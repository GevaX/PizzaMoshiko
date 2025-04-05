using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class order_history : System.Web.UI.Page
{
    public string orders = "";
    string sql = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string fileName = "Database.mdf";
        sql = "SELECT * FROM Orders WHERE UserName = '" + Session["userName"] + "'";

        if (!IsPostBack)
        {
            DataTable dt = MyAdoHelper.ExecuteDataTable(fileName, sql);

            foreach (DataRow row in dt.Rows)
            {
                orders += "<div class='order-item'>";
                orders += "<h3>Order ID: " + row["OrderID"] + "</h3>";
                orders += "<ul>";
                orders += "<li><strong>Pizza Type:</strong> " + row["PizzaType"] + "</li>";
                orders += "<li><strong>Size:</strong> " + row["Size"] + "</li>";
                if ((string)row["ExtraToppings"] != "")
                {
                    orders += "<li><strong>Extra Toppings:</strong> " + row["ExtraToppings"] + "</li>";
                }
                orders += "<li><strong>Quantity:</strong> " + row["Quantity"] + "</li>";
                orders += "<li><strong>Delivery Method:</strong> " + row["DeliveryMethod"] + "</li>";
                if ((string)row["Address"] != "")
                    orders += "<li><strong>Address:</strong> " + row["Address"] + "</li>";
                orders += "<li><strong>Payment Method:</strong> " + row["PaymentMethod"] + "</li>";
                orders += "<li><strong>Order Date:</strong> " + row["OrderDate"] + "</li>";
                orders += "</ul>";

                orders += "<form method='post'>";
                orders += "<input type='submit' class='reorder' name='reorder' value='Reorder this order' />";
                orders += "<input type='hidden' name='id' value='" + row["OrderID"] + "' />";
                orders += "</form>";

                orders += "</div>";
            }
        }

        if (Request.Form["reorder"] != null)
        {
            string id = Request.Form["id"];
            int orderId = int.Parse(id);

            DateTime orderDate = DateTime.Now;

            sql = "SELECT * FROM Orders WHERE OrderID = " + orderId + ";" +
                 "INSERT INTO Orders (UserName, PizzaType, Size, ExtraToppings, Quantity, DeliveryMethod, Address, PaymentMethod, OrderDate) " +
                 "SELECT UserName, PizzaType, Size, ExtraToppings, Quantity, DeliveryMethod, Address, PaymentMethod, '" + orderDate + "' " +
                 "FROM Orders WHERE OrderID = " + orderId + ";";

            MyAdoHelper.DoQuery(fileName, sql);
        }
    }
}