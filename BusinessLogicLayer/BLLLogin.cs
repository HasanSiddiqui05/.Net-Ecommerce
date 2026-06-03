using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLLLogin
    {
        DALLogin da = new DALLogin();
        public DataTable loginuser(string name, string role, string pass) 
        {
            return da.logindata(name, role, pass);
        }
        public bool storeCreation(string email)
        {
            return da.IsStoreNew(email);
        }
        public string getid(string name, string role, string pass) 
        {
            return da.idData(name, role, pass);
        }
        public string storeid(string id) 
        { 
            return da.storeidData(id);
        }
        public string riderid(string id) 
        {
            return da.rideridData(id);
        }
        public void createCart(string id) 
        {
            da.createCartData(id);
        }
        public string getCart(string id) 
        {
            return da.getcartidData(id);
        }
        public bool riderCreation(string email) 
        {
            return da.IsRiderNew(email);
        }
    }
}
