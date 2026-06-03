using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EComProject
{
    public partial class PLCart3 : System.Web.UI.Page
    {
        string stotal = global.stotalSender;
        string totalbill = global.totalbillSender;
        string cid = global.cartidSender;
        string uid = global.messageSender;
        string oid;
        BLCart3 bl = new BLCart3();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                DateTime odate = DateTime.Now;
                bl.insertOrder(cid, uid, totalbill, odate);
                var context = Session["CheckoutContext"] as CheckoutContext;

                if (context == null || !context.IsCartValid || !context.IsAddressValid)
                {
                    Response.Redirect("Cart.aspx");
                }
            }
            TLabel.Text = stotal;
            Total.Text = totalbill;
        }

        protected void Cart3Redirect(object sender, EventArgs e)
        {
            oid = bl.orderId(cid, uid);
            bl.updateCart(cid);
            bl.completeOrderDetails(oid, cid);

            var context = Session["CheckoutContext"] as CheckoutContext;

            var paymentHandler = new PaymentHandler();

            paymentHandler.HandleRequest(context);

            Session["CheckoutContext"] = context;

            if (context.IsPaymentProcessed) { 
                Response.Redirect("PLCart4.aspx");

            }
            else
            {
                Response.Write("<script>alert('Invalid Transaction attempt ')</script>");
            }

        }
    }
}