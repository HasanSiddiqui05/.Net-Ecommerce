using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EComProject
{
    public partial class PLCart1 : System.Web.UI.Page
    {
        BLCart1 bl =new BLCart1();
        string id = global.messageSender;
        string cid = global.cartidSender;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Text = id;
            TextBox1.Visible = false;

            var context = new CheckoutContext
            {
                User = "exampleUser"
            };

            Session["CheckoutContext"] = context;

        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.Item != null && e.CommandArgument != null)
            {
                ListViewItem currentItem = (ListViewItem)e.Item;
                System.Web.UI.WebControls.Label labelQuantity = currentItem.FindControl("Quantity") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.HiddenField labelpid = currentItem.FindControl("HiddenProductId") as System.Web.UI.WebControls.HiddenField;
                string pid = labelpid?.Value;

                int quantity;
                if (labelQuantity != null && int.TryParse(labelQuantity.Text, out quantity) && !string.IsNullOrEmpty(pid))
                {
                    switch (e.CommandName)
                    {
                        case "Increment":
                            string spquan = bl.pQuantity(pid);
                            if (int.TryParse(spquan, out int pquantity) && quantity < pquantity)
                            {
                                quantity++;
                            }
                            break;

                        case "Decrement":
                            if (quantity > 0)
                                quantity--;
                            break;

                        case "Delete":
                            if (!string.IsNullOrEmpty(cid))
                            {
                                SqlDataSource1.DeleteParameters["product_id"].DefaultValue = pid;
                                SqlDataSource1.DeleteParameters["cart_id"].DefaultValue = cid;
                                SqlDataSource1.Delete();
                            }
                            break;
                    }
                    labelQuantity.Text = quantity.ToString();
                }
            }


            decimal total = 0M;
            foreach (ListViewItem item in ListView1.Items)
            {
                System.Web.UI.WebControls.Label labelPrice = item.FindControl("Label2") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label labelQuantity = item.FindControl("Quantity") as System.Web.UI.WebControls.Label;

                if (labelPrice != null && labelQuantity != null)
                {
                    decimal price = decimal.Parse(labelPrice.Text);
                    int quantity = int.Parse(labelQuantity.Text);
                    //total = bl.totalbill(price, quantity);
                    total += price * quantity;
                }
            }
            TLabel.Text = total.ToString();

            decimal totalbill = total + 1000;

            Total.Text = totalbill.ToString();

            global.stotalSender = total.ToString();
            global.totalbillSender = totalbill.ToString();
        }

        protected void Cart1Redirect(object sender, EventArgs e)
        {
            decimal total = 0;
            foreach (ListViewItem item in ListView1.Items)
            {
                System.Web.UI.WebControls.Label labelPrice = item.FindControl("Label2") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label labelQuantity = item.FindControl("Quantity") as System.Web.UI.WebControls.Label;

                if (labelPrice != null && labelQuantity != null)
                {
                    decimal price = decimal.Parse(labelPrice.Text);
                    int quantity = int.Parse(labelQuantity.Text);
                    //total = bl.totalbill(price, quantity);
                    total += price * quantity;
                }
                total += 1000;
            }

            if (total < 1010)
            {
                Label5.Text = "There is no product in the cart";
                Label5.ForeColor = System.Drawing.Color.Red;
                Label5.Visible = true;
            }
            else
            {
                foreach (ListViewItem item in ListView1.Items)
                {

                    System.Web.UI.WebControls.HiddenField labelpid = item.FindControl("HiddenProductId") as System.Web.UI.WebControls.HiddenField;
                    string pid = labelpid.Value;
                    System.Web.UI.WebControls.Label labelQuantity = item.FindControl("Quantity") as System.Web.UI.WebControls.Label;
                    int cquan = int.Parse(labelQuantity.Text);
                    if (cquan > 0) 
                    {
                        bl.updateQuantity(pid, cquan);
                    }
                }
                
                foreach (ListViewItem item in ListView1.Items)
                {
                    System.Web.UI.WebControls.HiddenField labelpid = item.FindControl("HiddenProductId") as System.Web.UI.WebControls.HiddenField;
                    string pid = labelpid.Value;
                    System.Web.UI.WebControls.Label labelQuantity = item.FindControl("Quantity") as System.Web.UI.WebControls.Label;
                    int cquan = int.Parse(labelQuantity.Text);
                    System.Web.UI.WebControls.Label labelprice = item.FindControl("Label2") as System.Web.UI.WebControls.Label;
                    string price = labelprice.Text;
                    if (cquan > 0) 
                    {
                        bl.orderDetails(id, cid, pid, cquan, price);
                        
                        var context = Session["CheckoutContext"] as CheckoutContext;

                        var cartHandler = new CartHandler();
                        var addressHandler = new AddressHandler();
                        var paymentHandler = new PaymentHandler();

                        cartHandler.SetNext(addressHandler).SetNext(paymentHandler);

                        cartHandler.HandleRequest(context);

                        Session["CheckoutContext"] = context;
                        context.IsCartValid = true;

                        if (context.IsCartValid)
                        {
                            Response.Redirect("PLCart2.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid Transaction attempt ')</script>");

                        }


                    }
                }
            }
        }

    }
}