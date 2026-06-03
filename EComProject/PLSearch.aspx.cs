using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EComProject
{
    public partial class PLSearch : System.Web.UI.Page
    {
        string pname;

        protected void Page_Load(object sender, EventArgs e)
        {
            pname = Request.QueryString["productname"];
            TextBox1.Text = pname;
            TextBox1.Visible = false;
        }
    }
}