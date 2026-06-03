using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EComProject
{
    public partial class PLCart2 : System.Web.UI.Page
    {
        string id = global.messageSender;
        BLCart2 bl = new BLCart2();
        string uid = "1";
        string uname, phoneno, uaddress, uemail;
        string stotal = global.stotalSender;
        string totalbil = global.totalbillSender;

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox2.Enabled = false;
            if (!IsPostBack) 
            {
                bl.userData(id, out uname, out phoneno, out uaddress, out uemail);
                TextBox1.Text = uname;
                TextBox2.Text = uemail;
                TextBox3.Text = phoneno;
                TextBox4.Value = uaddress;
            var context = Session["CheckoutContext"] as CheckoutContext;

            if (context == null || !context.IsCartValid)
            {
                Response.Redirect("Cart.aspx");
            }


            }

        


        TLabel.Text = stotal;
            Total.Text = totalbil;
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            bl.updateData(id, TextBox3.Text, TextBox1.Text, TextBox4.Value, TextBox2.Text);
            bl.userData(id, out uname, out phoneno, out uaddress, out uemail);
            TextBox1.Text = uname;
            TextBox2.Text = uemail;
            TextBox3.Text = phoneno;
            TextBox4.Value = uaddress;
        }

        protected void Cart2Redirect(object sender, EventArgs e)
        {

            var context = Session["CheckoutContext"] as CheckoutContext;

            var addressHandler = new AddressHandler();
            var paymentHandler = new PaymentHandler();

            addressHandler.SetNext(paymentHandler);

            addressHandler.HandleRequest(context);

            Session["CheckoutContext"] = context;

            if (TextBox1.Text != "" || TextBox2.Text != "" || TextBox3.Text != "" || TextBox4.Value != "" )
            {
                context.IsAddressValid = true;
                Response.Redirect("PLCart3.aspx");

            }
            
            else
            {
                Response.Write("<script>alert('Invalid Transaction attempt ')</script>");

            }

        }
    }
}