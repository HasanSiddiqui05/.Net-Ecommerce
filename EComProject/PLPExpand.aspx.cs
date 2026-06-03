using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EComProject
{
    public partial class PLPExpand : System.Web.UI.Page
    {
        BLExpand bl = new BLExpand();
        string cid = global.cartidSender;
        string id = global.messageSender;
        string productIdString;

        protected void Page_Load(object sender, EventArgs e)
        {
            productIdString = Request.QueryString["productid"];
            TextBox1.Text = productIdString;
            TextBox1.Visible = false;
        }

        protected void button1_click(object sender, EventArgs e)
        {
            if (id == "")
            {
                Response.Redirect("PLLogin.aspx");
            }
            else 
            { 
                bl.insertIntoCart(cid, productIdString);
            }
        }

        protected void insert_review(object sender, EventArgs e)
        {
            if (id == "")
            {
                Response.Redirect("PLLogin.aspx");
            }
            else
            {
                string rev = TextArea1.Value;
                bl.insertReview(id, productIdString, rev);
                ListView2.DataBind();
            }
        }
    }
}