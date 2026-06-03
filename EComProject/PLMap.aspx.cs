using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EComProject
{
    public partial class PLMap : System.Web.UI.Page
    {
        string add;

        protected void Page_Load(object sender, EventArgs e)
        {
            add = Request.QueryString["u_address"];
            address.Value = add;
        }
    }
}