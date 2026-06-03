using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using BusinessLogicLayer;

namespace EComProject
{
    public partial class PLSellerProfile : System.Web.UI.Page
    {
        BLSellerProfile bl = new BLSellerProfile();
        string id = global.messageSender;
        string sname, sdesc, phoneno, address, email;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                bl.sellerData(id, out sname, out sdesc, out phoneno, out address, out email);
                TextBox1.Text = sname;
                TextBox2.Text = sdesc;
                TextBox3.Text = phoneno;
                TextBox4.Text = address;
                TextBox5.Text = email;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
           
            
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            bl.updateData(id, TextBox3.Text, TextBox1.Text, TextBox4.Text, TextBox2.Text);
            bl.sellerData(id, out sname, out sdesc, out phoneno, out address, out email);
            TextBox1.Text = sname;
            TextBox2.Text = sdesc;
            TextBox3.Text = phoneno;
            TextBox4.Text = address;
            TextBox5.Text = email;
        }
    }
}