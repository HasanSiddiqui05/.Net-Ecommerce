using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public class DACustomerProfile
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public void getData(string uid, out string name, out string phoneno, out string email, out string address)
        {
            string query = ("select name, phoneno, email, u_address from users where userid = @ID");
            name = null;
            phoneno = null;
            email = null;
            address = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@ID", uid);
                    connection.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        name = dr.GetValue(0).ToString();
                        phoneno = dr.GetValue(1).ToString();
                        email = dr.GetValue(2).ToString();
                        address = dr.GetValue(3).ToString();
                    }

                }
            }
        }

        public void getupdateData(string uid, string name, string phoneno, string address)
        {
            string query2 = ("update users set name = @name, phoneno = @phone, address = @address where userid = @uid");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                using (SqlCommand cmd2 = new SqlCommand(query2, connection))
                {
                    cmd2.Parameters.AddWithValue("@uid", uid);
                    cmd2.Parameters.AddWithValue("@name", name);
                    cmd2.Parameters.AddWithValue("@address", address);
                    cmd2.Parameters.AddWithValue("@phoneno", phoneno);
                    connection.Open();
                    cmd2.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }
    }
}
