using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EComProject
{
    public partial class PLCart14 : System.Web.UI.Page
    {
        string stotal = global.stotalSender;
        string totalBill = global.totalbillSender;
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime currentDate = DateTime.Now;

            string currentDay = currentDate.DayOfWeek.ToString();
            string currentMonthName = currentDate.ToString("MMMM");
            string formattedDate = currentDate.ToString("dd");
            string formattedDate2 = currentDate.ToString("yyyy");
            
            OrderDate.Text = currentDay +"," + formattedDate + " " + currentMonthName + "," + formattedDate2;

            TLabel.Text = stotal;
            Total.Text = totalBill;
        }

        protected void Cart4Redirect(object sender, EventArgs e)
        {
            Response.Redirect("PLHome.aspx");
        }
    }
}