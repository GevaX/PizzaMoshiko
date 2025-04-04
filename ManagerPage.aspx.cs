using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagerPage : System.Web.UI.Page
{
    public string userList = "";
    public string orderList = "";
    public string sql = "";
    public string cMsg;
    protected void Page_Load(object sender, EventArgs e)
    {
        cMsg = (string)Application["msg"];
        string fileName = "Database.mdf";
        sql = "SELECT * FROM Users";
        userList = MyAdoHelper.printUserTable(fileName, sql);
        sql = "SELECT * FROM Orders";
        orderList = MyAdoHelper.printDataTable(fileName, sql);

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
    }
}