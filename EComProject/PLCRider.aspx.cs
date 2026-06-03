using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using static System.Net.Mime.MediaTypeNames;

namespace EComProject
{
    public partial class PLCRider : System.Web.UI.Page
    {
        BLCRider bl = new BLCRider();
        string id = global.messageSender;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string phone = null;
            string address = null;
            string email = null;
            bl.riderData(id, out phone, out address, out email);
            TextBox5.Text = phone;
            TextBox6.Text = address;
            TextBox7.Text = email;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nv = TextBox1.Text;
            string vno = TextBox2.Text;
            string year = TextBox3.Text;
            string lno = TextBox4.Text;
            bl.insertRider(id, nv, vno, year, lno);
            string rid = bl.riderID(id);
            global.rideridSender = rid;
        }
    }
}