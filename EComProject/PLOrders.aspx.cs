using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EComProject
{
    public partial class PLOrders : System.Web.UI.Page
    {
        string id = global.messageSender;
        string sid = global.storeidSender;
        BLOrders bl = new BLOrders();
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Text = sid;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;
            if (ddl != null)
            {
                ListViewItem item = ddl.NamingContainer as ListViewItem;
                if (item != null)
                {
                    Label labelOrderId = item.FindControl("Label7") as Label;
                    if (labelOrderId != null)
                    {
                        string oid = labelOrderId.Text;
                        bl.updateStatus(oid);

                    }
                }
            }
            ListView1.DataBind();
        }
    }
}