using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DAHome
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public string idData(string uid)
        {
            string query = ("select cartid from cart where cart_user_id = @Uid");
            string id;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Uid", uid);
                    connection.Open();
                    id = cmd.ExecuteScalar()?.ToString();
                    connection.Close();
                }
            }
            return id;
        }

        
    }
}
