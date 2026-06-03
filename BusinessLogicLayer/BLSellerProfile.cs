using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLSellerProfile
    {
        DASellerProfile da = new DASellerProfile();

        public void sellerData(string uid, out string sname, out string sdesc, out string phoneno, out string address, out string email)
        {
            da.getData(uid, out sname,out sdesc,out phoneno,out address,out email);    
        }
        public void updateData(string uid, string phone, string sname, string address, string sdesc)
        {
            da.getupdateData(uid, phone, sname, address, sdesc);
        }
    }
}
