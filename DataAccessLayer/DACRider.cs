using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DACRider
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public void insertData(string uid, string nv, string vno, string year, string lno)
        {
            string query = ("insert into rider values(@uid, @nvehicle, @vehicleno, @licenseyear, @licenseno)");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@uid", uid);
                    cmd.Parameters.AddWithValue("@nvehicle", nv);
                    cmd.Parameters.AddWithValue("@vehicleno", vno);
                    cmd.Parameters.AddWithValue("@licenseyear", year);
                    cmd.Parameters.AddWithValue("@licenseno", lno);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        public void getData(string uid, out string phoneno, out string address, out string email)
        {
            string query = ("select phoneno, u_address, email from users where userid = @ID");
            phoneno = null;
            address = null;
            email = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@ID", uid);
                    connection.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        phoneno = dr.GetValue(0).ToString();
                        address = dr.GetValue(1).ToString();
                        email = dr.GetValue(2).ToString();
                    }

                }
            }
        }

        public string rideridData(string d)
        {
            string query = ("Select riderid FROM rider WHERE rider_userid = '" + d + "'");
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
