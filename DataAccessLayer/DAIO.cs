using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DAIO
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public void updateOrder(string rid, string oid)
        {
            string query1 = ("update orders set rider_id = @Rid where orderid = @Oid");
            string query2 = ("update order_details set details_status = 'Order accepted by Rider' where details_orderid = @Oid");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query1, connection))
                {
                    cmd.Parameters.AddWithValue("@Rid", rid);
                    cmd.Parameters.AddWithValue("@Oid", oid);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query2, connection))
                {
                    cmd.Parameters.AddWithValue("@Oid", oid);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }
    }
}
