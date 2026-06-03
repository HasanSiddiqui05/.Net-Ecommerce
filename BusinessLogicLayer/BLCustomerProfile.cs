using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLCustomerProfile
    {
        DACustomerProfile da = new DACustomerProfile();

        public void customerData(string uid, out string name, out string phoneno, out string email, out string address)
        {
            da.getData(uid, out name, out phoneno, out email, out address);
        }
        public void updateData(string uid, string name, string phone, string address)
        {
            da.getupdateData(uid, name, phone, address);
        }
    }
}
