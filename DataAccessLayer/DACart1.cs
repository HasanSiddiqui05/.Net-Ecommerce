using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DACart1
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public void getUpdateQuantity(string pid, int cquan)
        {
            string query1 = ("update items_in_cart set cquantity = @CQuan where product_id = @Pid");
            string query2 = ("update products set Quantity = Quantity - @CQuan where productid = @Pid");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query1, connection))
                {
                    cmd.Parameters.AddWithValue("@CQuan", cquan);
                    cmd.Parameters.AddWithValue("@Pid", pid);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }

                using (SqlCommand cmd2 = new SqlCommand(query2, connection))
                {
                    cmd2.Parameters.AddWithValue("@CQuan", cquan);
                    cmd2.Parameters.AddWithValue("@Pid", pid);
                    connection.Open();
                    cmd2.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        public void setOrderDetails(string uid, string cid, string pid, int cquan, string price)
        {
            string query1 = ("insert into order_details values (null, @Uid, @Cid, @Pid, @Cquan, @Price, 'Order Placed by Customer')");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query1, connection))
                {
                    cmd.Parameters.AddWithValue("@Uid", uid);
                    cmd.Parameters.AddWithValue("@Cid", cid);
                    cmd.Parameters.AddWithValue("@Pid", pid);
                    cmd.Parameters.AddWithValue("@CQuan", cquan);
                    cmd.Parameters.AddWithValue("@Price", price);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        public string getQuantity(string pid) 
        {
            string query = ("select Quantity from products where productid = @Pid");
            string quan;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Pid", pid);
                    connection.Open();
                    quan = cmd.ExecuteScalar()?.ToString();
                    connection.Close();
                }
            }
            return quan;
        }
    }
}
