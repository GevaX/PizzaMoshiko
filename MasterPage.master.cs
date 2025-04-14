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
        if (Request.Url.AbsolutePath.Contains("register.aspx") || Request.Url.AbsolutePath.Contains("login.aspx"))
        {
            form1.Attributes["novalidate"] = "novalidate";
        }
        else
        {
            form1.Attributes.Remove("novalidate");
        }
    }
}
