using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EComProject
{
    public partial class PLViewInventory : System.Web.UI.Page
    {
        string sid = global.storeidSender;
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Text = sid;
            TextBox1.Visible = false;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}