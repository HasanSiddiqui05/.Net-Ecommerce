using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EComProject
{
    public partial class PLCStore : System.Web.UI.Page
    {
        BLCStore bl = new BLCStore();
        string id = global.messageSender;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox5.Enabled = false;
            string email = bl.userEmail(id);
            TextBox5.Text = email;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string storename = TextBox1.Text;
            string storedesc = Request.Form["TextBox2"];
            string phoneno = TextBox3.Text;
            string address = TextBox4.Text;
            bl.createStore(id, storename, address, storedesc, phoneno);
            string sid = bl.storeID(id);
            global.storeidSender = sid;
            Response.Redirect("PLAddProduct.aspx");
        }
        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {

        }
    }
}