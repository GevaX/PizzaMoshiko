using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagerPage : System.Web.UI.Page
{
    public string userList = "";
    public string sql = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string fileName = "RegistrationDB.mdf";
        sql = "SELECT * FROM Users";
        userList = MyAdoHelper.printDataTable(fileName, sql);
    }
}