using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EComProject
{
    public partial class IncomingOrder : System.Web.UI.Page
    {
        BLIO bl = new BLIO();
        string id = global.rideridSender;
        string rid = global.rideridSender;
        //string rid = "1";
        string oid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack && hdnAction.Value == "decline")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "showModal();", true);
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rid != "")
            {
                DropDownList ddl = sender as DropDownList;
                if (ddl != null)
                {
                    ListViewItem item = ddl.NamingContainer as ListViewItem;
                    if (item != null)
                    {
                        Label labelOrderId = item.FindControl("Label1") as Label;
                        if (labelOrderId != null)
                        {
                            string oid = labelOrderId.Text;
                            bl.riderID(rid, oid);
                        }
                    }
                }
                ListView1.DataBind();
            }
            else 
            {
                Response.Redirect("PLLogin.aspx");
            }
        }
    }
}