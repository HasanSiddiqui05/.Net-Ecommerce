using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace DataAccessLayer
{
    public class DARegistration
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");
        

        public void insertData(string name, string phoneno, string email, string address, string role, string password)
        {
            string query = ("INSERT INTO users VALUES ('" + name + "', '" + phoneno + "', '" + email + "', '" + address + "', '" + role + "', '" + password + "')");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        public bool IsDataUnique(string tableName, string columnName, string dataValue)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = $"SELECT COUNT(*) FROM {tableName} WHERE {columnName} = @DataValue";
                
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@DataValue", dataValue);
                    
                    int count = (int)command.ExecuteScalar();
                    
                    return count == 0;
                }
            }
        }

        public void createCartData(string uid)
        {
            string query1 = ("insert into cart values (@Uid)");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query1, connection))
                {
                    cmd.Parameters.AddWithValue("@Uid", uid);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }
    }
}
