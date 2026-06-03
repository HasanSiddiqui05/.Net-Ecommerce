using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EComProject
{
    public partial class PLHome : System.Web.UI.Page
    {
        private BLHome bl = new BLHome();

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = global.messageSender;
            string cid;
            cid = bl.cartid(id);
            global.cartidSender = cid;
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public List<string> GetItemName(string prefixtext)
        {
            string connectionString = @"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True";
            string query = "SELECT ProductName FROM products WHERE ProductName LIKE '"+ prefixtext +"' + '%'";

            List<string> ItemName = new List<string>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Add parameter to prevent SQL injection
                    connection.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        // Add the retrieved product name to the list
                        ItemName.Add(dr["ProductName"].ToString());
                    }
                    connection.Close();
                }
            }
            return ItemName;
        }


    }
}