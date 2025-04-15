using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string msg;
    protected void Page_Load(object sender, EventArgs e)
    {
        msg = (string)Application["msg"];

        string path = Request.Url.AbsolutePath.ToLower();
        if (path.Contains("register.aspx") || path.Contains("login.aspx"))
        {
            form1.Attributes["novalidate"] = "novalidate";
        }
        else
        {
            form1.Attributes.Remove("novalidate");
        }
    }
}
