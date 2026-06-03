using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DAStore
    {
        string connectionString = (@"Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True");

        //public object viewData()
        //{
        //    SqlDataAdapter adp = new SqlDataAdapter("select * from products", connectionString);
        //    DataTable db = new DataTable();
        //    adp.Fill(db);
        //    return db;
        //}
    }
}
