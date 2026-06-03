using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace DataAccessLayer
{
    public class DASellerProfile
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        public void getData(string uid, out string sname, out string sdesc, out string phoneno, out string address, out string email)
        {
            string query = ("select storename, storedesc, s.phoneno, s_address, email from store s join users u on u.userid = s.user_id where u.userid = @ID");
            sdesc = null;
            sname = null;
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
                        sname = dr.GetValue(0).ToString();
                        sdesc = dr.GetValue(1).ToString();   
                        phoneno = dr.GetValue(2).ToString();
                        address = dr.GetValue(3).ToString();
                        email = dr.GetValue(4).ToString();
                    }

                }
            }
        }

        public void getupdateData(string uid, string phone, string sname, string address, string sdesc) 
        {
            string query2 = ("UPDATE store SET storename = @Sname, s_address = @Address, storedesc = @Sdesc, set phoneno = @phoneno where user_id = '" + uid + "'");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                using (SqlCommand cmd2 = new SqlCommand(query2, connection))
                {
                    cmd2.Parameters.AddWithValue("@ID", uid);
                    cmd2.Parameters.AddWithValue("@Sname", sname);
                    cmd2.Parameters.AddWithValue("@Address", address);
                    cmd2.Parameters.AddWithValue("@Sdesc", sdesc);
                    cmd2.Parameters.AddWithValue("@phoneno", phone);
                    connection.Open();
                    cmd2.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }
    }
}
