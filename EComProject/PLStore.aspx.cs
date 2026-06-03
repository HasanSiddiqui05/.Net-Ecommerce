using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EComProject
{
    public partial class PLStore : System.Web.UI.Page
    {
        BLStore bl = new BLStore();
        protected void Page_Load(object sender, EventArgs e)
        {
            //GridView1.DataSource = bl.printData();
            //GridView1.DataBind();
        }

        protected void SqlDataSource1_Selecting1(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string name = GridView1.SelectedRow.Cells[1].Text;
            TextBox2.Text = name;
        }
    }
}