using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class order_summary : System.Web.UI.Page
{
    public string order;
    public string status;
    public int orderId;
    string sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "failurePopup",
                    "showPopup('Error', 'No order ID attached.', 'error');", true);
            return;
        }

        if (!int.TryParse(Request.QueryString["id"], out orderId))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "failurePopup",
                    "showPopup('Error', 'Invalid order ID format.', 'error');", true);
            return;
        }

        string fileName = "Database.mdf";
        sql = "Select UserName FROM Orders WHERE OrderID = '" + orderId + "'";

        string dbUser = (string)MyAdoHelper.GetFieldValue(fileName, sql);
        if (dbUser != (string)Session["userName"])
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "failurePopup",
                    "showPopup('Error', 'No permission to view resource.', 'error');", true);
            return;
        }

        sql = "SELECT * FROM Orders WHERE OrderID = '" + orderId + "'";
        DataTable dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
        foreach (DataRow row in dt.Rows)
        {
            status = (string)row["Status"];
            order += "<div class='order-item'>";
            order += "<h3>Order ID: " + row["OrderID"] + "</h3>";
            order += "<ul>";
            order += "<li><strong>User Name:</strong> " + row["UserName"] + "</li>";
            order += "<li><strong>Pizza Type:</strong> " + row["PizzaType"] + "</li>";
            order += "<li><strong>Size:</strong> " + row["Size"] + "</li>";
            if((string)row["ExtraToppings"] != "")
            {
                order += "<li><strong>Extra Toppings:</strong> " + row["ExtraToppings"] + "</li>";
            }
            order += "<li><strong>Quantity:</strong> " + row["Quantity"] + "</li>";
            order += "<li><strong>Delivery Method:</strong> " + row["DeliveryMethod"] + "</li>";
            if ((string)row["Address"] != "")
                order += "<li><strong>Address:</strong> " + row["Address"] + "</li>";
            order += "<li><strong>Payment Method:</strong> " + row["PaymentMethod"] + "</li>";
            order += "<li><strong>Order Date:</strong> " + row["OrderDate"] + "</li>";
            order += "<br /><li><strong>Order Status:</strong> " + row["Status"] + "</li>";
            order += "</ul>";
            order += "</div>";
        }
    }
}