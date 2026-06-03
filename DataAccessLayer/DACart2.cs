using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DACart2
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public void getData(string uid, out string uname, out string phoneno, out string uaddress, out string uemail)
        {
            string query = ("select name, email, phoneno, u_address from users where userid = @ID");
            uname = null;
            uemail = null;
            phoneno = null;
            uaddress = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@ID", uid);
                    connection.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        uname = dr.GetValue(0).ToString();
                        uemail = dr.GetValue(1).ToString();
                        phoneno = dr.GetValue(2).ToString();
                        uaddress = dr.GetValue(3).ToString();
                    }
                }
            }
        }
        public void getupdateData(string uid, string phone, string uname, string address, string uemail)
        {
            string query1 = ("update users set name = @Name, phoneno = @Phoneno, u_address = @U_address where userid = @Uid");
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query1, connection))
                {
                    cmd.Parameters.AddWithValue("@Uid", uid);
                    cmd.Parameters.AddWithValue("@Name", uname);
                    cmd.Parameters.AddWithValue("@Phoneno", phone);
                    cmd.Parameters.AddWithValue("@U_address", address);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }
    }
}
