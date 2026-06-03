using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EComProject
{
    public partial class PLUI : System.Web.UI.Page
    {
        string sid = global.storeidSender;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertData")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string id = GridView1.Rows[rowIndex].Cells[0].Text;
                string productname = GridView1.Rows[rowIndex].Cells[1].Text;
                string product_desc = GridView1.Rows[rowIndex].Cells[2].Text;
                string cate = GridView1.Rows[rowIndex].Cells[3].Text;
                string quantity = GridView1.Rows[rowIndex].Cells[4].Text;
                string price = GridView1.Rows[rowIndex].Cells[5].Text;

                ViewState["SelectedProductId"] = id;

                TextBox1.Text = productname;
                TextBox2.Text = product_desc;
                TextBox3.Text = quantity;
                TextBox4.Text = price; 
                DropDownList1.SelectedValue = cate;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "showModal();", true);
            }
            else if (e.CommandName == "DeleteData")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                int productId = Convert.ToInt32(GridView1.Rows[rowIndex].Cells[0].Text);

                SqlDataSource2.DeleteParameters["productid"].DefaultValue = productId.ToString();
                SqlDataSource2.Delete();

                BindGridView();
            }
        }

        protected void SaveChanges_Click(object sender, EventArgs e)
        {

            string productName = TextBox1.Text;
            string description = TextBox2.Text;
            string category = DropDownList1.SelectedValue;
            int quantity;
            decimal price;

            if (int.TryParse(TextBox3.Text, out quantity) && decimal.TryParse(TextBox4.Text, out price))
            {

                int productId = Convert.ToInt32(ViewState["SelectedProductId"]);

                SqlDataSource3.UpdateParameters["ProductName"].DefaultValue = productName;
                SqlDataSource3.UpdateParameters["Description"].DefaultValue = description;
                SqlDataSource3.UpdateParameters["Category"].DefaultValue = category;
                SqlDataSource3.UpdateParameters["Quantity"].DefaultValue = quantity.ToString();
                SqlDataSource3.UpdateParameters["Price"].DefaultValue = price.ToString();
                SqlDataSource3.UpdateParameters["productid"].DefaultValue = productId.ToString();


                SqlDataSource3.Update();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "$('#exampleModalLong').modal('hide');", true);

                BindGridView();
            }
        }

        private void BindGridView()
        {
            TextBox6.Text = sid; 
            TextBox6.Visible = false;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }
    }
}