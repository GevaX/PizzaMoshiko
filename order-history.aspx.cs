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

        if (IsPostBack)
        {
            foreach (string key in Request.Form.Keys)
            {
                if (key.StartsWith("reorder_"))
                {
                    string id = Request.Form[key];
                    int orderId = int.Parse(id);
                    DateTime orderDate = DateTime.Now;

                    sql = "INSERT INTO Orders (UserName, FullName, PizzaType, Size, ExtraToppings, Quantity, DeliveryMethod, Address, PaymentMethod, OrderDate) " +
                         "SELECT UserName, FullName, PizzaType, Size, ExtraToppings, Quantity, DeliveryMethod, Address, PaymentMethod, '" + orderDate + "' " +
                         "FROM Orders WHERE OrderID = " + orderId + ";";

                    int newOrderId = MyAdoHelper.InsertAndGetId(fileName, sql);

                    Response.Redirect("order-summary.aspx?id=" + newOrderId);

                    return;
                }
            }
        }

        if (Session["userName"] != null)
        {
            sql = "SELECT * FROM Orders WHERE UserName = '" + Session["userName"] + "'";
            DataTable dt = MyAdoHelper.ExecuteDataTable(fileName, sql);

            foreach (DataRow row in dt.Rows)
            {
                string orderId = row["OrderID"].ToString();
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

                orders += "<button type='submit' class='reorder' name='reorder_" + orderId + "' id='reorder_" + orderId +
                          "' value='" + orderId + "'>Reorder this order</button>";

                orders += "</div>";
            }
        }
        
    }
}