using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int counter = (int)Application["counter"];
            counter++;
            Application["counter"] = counter;
            Response.Write($"Total visits: {counter}");
        }
    }
}