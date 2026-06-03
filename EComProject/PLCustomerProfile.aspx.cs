using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EComProject
{
    public partial class PLCustomerProfile : System.Web.UI.Page
    {
        BLCustomerProfile bl = new BLCustomerProfile();

        string id = global.messageSender;
        string name, phoneno, address, email;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bl.customerData(id, out name,out phoneno, out email, out address);
                TextBox2.Text = name;
                TextBox3.Text = phoneno;
                TextBox5.Text = address;
                TextBox4.Text = email;

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {


        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            bl.updateData(id, TextBox2.Text, TextBox3.Text, TextBox5.Text);
            bl.customerData(id, out name, out phoneno, out email, out address);
            TextBox2.Text = name;
            TextBox3.Text = phoneno;
            TextBox5.Text = address;
            TextBox4.Text = email;
        }
    }
}