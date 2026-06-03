using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLCStore
    {
        DACStore da = new DACStore();
        public void createStore(string userid, string storename, string address, string storedesc, string phoneno) 
        {
            da.insertData(userid, storename, address, storedesc, phoneno);
        }
        public string userEmail(string id) 
        {
            return da.emailData(id);
        }
        public string storeID(string sid) 
        {
            return da.storeidData(sid);
        }
    }
}
