using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DACStore
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public void insertData(string uid, string sname, string address, string storedesc, string phoneno)
        {
            string query = ("insert into store values(@uid, @sname, @saddress, @storedesc, @phoneno)");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@uid", uid);
                    cmd.Parameters.AddWithValue("@sname", sname);
                    cmd.Parameters.AddWithValue("@saddress", address);
                    cmd.Parameters.AddWithValue("@storedesc", storedesc);
                    cmd.Parameters.AddWithValue("@phoneno", phoneno);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        public string emailData(string uid)
        {
            string query = ("select email from users where userid = @uid");
            string id;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@uid", uid);
                    connection.Open();
                    id = cmd.ExecuteScalar()?.ToString();
                    connection.Close();
                }
            }
            return id;
        }

        public string storeidData(string d)
        {
            string query = ("Select storeid FROM store WHERE user_id = '" + d + "'");
            string id;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    connection.Open();
                    id = cmd.ExecuteScalar()?.ToString();
                    connection.Close();
                }
            }
            return id;
        }
    }
}
