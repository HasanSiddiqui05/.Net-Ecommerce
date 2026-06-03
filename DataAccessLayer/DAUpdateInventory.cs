using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DAUpdateInventory
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public void getData(string id, out string pname, out string desc, out string cate, out string quan, out string price)
        {
            string query = ("select productid, ProductName, Description, Category, Quantity, Price from products where productid = @PID");

            //select productid, ProductName, Description, Category, Quantity, Price from products where productid = 100
            pname = null;
            desc = null;
            cate = null;
            quan = null;
            price = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@PID", id);
                    connection.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        id = dr.GetValue(0).ToString();
                        pname = dr.GetValue(1).ToString();
                        desc = dr.GetValue(2).ToString();
                        cate = dr.GetValue(3).ToString();
                        quan = dr.GetValue(4).ToString();
                        price = dr.GetValue(5).ToString();
                    }
                }
            }
        }
    }
}
