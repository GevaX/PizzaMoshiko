using System;
using System.Web;
using System.Data.SqlClient;

public partial class updateStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        string newStatus = Request.QueryString["status"];
        string[] validStatuses = {
            "pending", "confirmed", "in progress", "ready for pickup",
            "out for delivery", "completed", "canceled", "failed", "delivered"
        };

        if (string.IsNullOrEmpty(id) || string.IsNullOrEmpty(newStatus) || Array.IndexOf(validStatuses, newStatus) == -1)
        {
            Response.Write("invalid input");
            Response.End();
            return;
        }

        string fileName = "Database.mdf";
        string sql = "UPDATE Orders SET Status = '" + newStatus + "' WHERE OrderID = " + id;

        MyAdoHelper.DoQuery(fileName, sql);
        Response.Write("success");
        Response.End();
    }
}