using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DACart3
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public void comOrderDetail(string oid, string cid)
        {
            string query1 = ("update order_details set details_orderid = @Oid where details_cart_id = @Cid and details_orderid is null");
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query1, connection))
                {
                    cmd.Parameters.AddWithValue("@Oid", oid);
                    cmd.Parameters.AddWithValue("@Cid",cid);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        public void insertIntoOrder(string cid, string uid, string total, DateTime odate) 
        {
            string query1 = ("insert into orders values (@Uid, @Cid, @total, 'CashOnDelivery', @Odate, null)");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query1, connection))
                {
                    cmd.Parameters.AddWithValue("@Uid", cid);
                    cmd.Parameters.AddWithValue("@Cid", uid);
                    cmd.Parameters.AddWithValue("@total", total);
                    cmd.Parameters.AddWithValue("@Odate", odate);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        public void updateCart(string cid)
        {
            string query1 = ("delete from items_in_cart where cart_id = @Cid and cquantity != 0");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query1, connection))
                {
                    cmd.Parameters.AddWithValue("@Cid", cid);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        public string idData(string cid, string uid)
        {
            string query = ("select MAX(orderid) from orders where orders_cartid = @Cid and order_user_id = @Uid");
            string oid;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Cid", cid);
                    cmd.Parameters.AddWithValue("@Uid", uid);
                    connection.Open();
                    oid = cmd.ExecuteScalar()?.ToString();
                    connection.Close();
                }
            }
            return oid;
        }
    }
}
