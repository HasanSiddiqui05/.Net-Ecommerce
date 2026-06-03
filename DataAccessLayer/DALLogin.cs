using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace DataAccessLayer
{
    public class DALLogin
    {

        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public DataTable logindata(string name, string role, string pass)
        {
            DataTable dt = new DataTable(); 
            string query = ("Select * FROM users WHERE email = '" + name + "' AND role = '" + role + "' AND password = '" + pass + "'");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader()) 
                    {
                        dt.Load(dr);
                    }
                    connection.Close();
                }
            }
            return dt;
        }

        public string idData(string name, string role, string pass) 
        {
            string query = ("Select userid FROM users WHERE email = '" + name + "' AND role = '" + role + "' AND password = '" + pass + "'");
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

        public bool IsStoreNew(string email)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query2 = $"select COUNT(*) from store s join users u on s.user_id = u.userid where u.email like @DataValue";
                connection.Open();

                using (SqlCommand command = new SqlCommand(query2, connection))
                {
                    command.Parameters.AddWithValue("@DataValue", email);
                    int count = (int)command.ExecuteScalar();
                    return count == 0;
                }
            }
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

        public bool IsRiderNew(string email)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query2 = $"select COUNT(*) from rider r join users u on r.rider_userid = u.userid where u.email like @DataValue";
                connection.Open();

                using (SqlCommand command = new SqlCommand(query2, connection))
                {
                    command.Parameters.AddWithValue("@DataValue", email);
                    int count = (int)command.ExecuteScalar();
                    return count == 0;
                }
            }
        }

        public string rideridData(string d)
        {
            string query = ("select riderid from rider where rider_userid = @ID");
            string id;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@ID", d);
                    connection.Open();
                    id = cmd.ExecuteScalar()?.ToString();
                    connection.Close();
                }
            }
            return id;
        }

        public string getcartidData(string d)
        {
            string query = ("Select cartid FROM cart WHERE cart_user_id = '" + d + "'");
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
