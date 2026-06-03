using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EComProject
{
    public partial class checking : System.Web.UI.Page
    {
        BLUpdateInventory bl = new BLUpdateInventory();
        string id = global.messageSender;
        string sid = global.storeidSender;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = "1";
                TextBox1.Visible = false;
            }

            string pname, pdesc, pcate, quan, price;
            bl.getProductData("109", out pname, out pdesc, out pcate, out quan, out price);

            TextBox2.Text = pname;
            TextBox10.Text = pdesc;
            TextBox3.Text = quan;
            TextBox4.Text = price;
            DropDownList1.SelectedValue = pcate; // Assuming Category is a dropdown list
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            string pid = clickedButton.CommandArgument;

            string pname, pdesc, pcate, quan, price;
            bl.getProductData("109", out pname, out pdesc, out pcate, out quan, out price);

            TextBox2.Text = pname;
            TextBox10.Text = pdesc;
            TextBox3.Text = quan;
            TextBox4.Text = price;
            DropDownList1.SelectedValue = pcate; // Assuming Category is a dropdown list
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
               
            }
        }

    }
}