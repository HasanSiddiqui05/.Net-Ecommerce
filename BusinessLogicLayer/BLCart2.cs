using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{

    public class BLCart2
    {
        DACart2 da = new DACart2();
        public void userData(string uid, out string uname, out string phoneno, out string uaddress, out string uemail)
        {
            da.getData(uid, out uname, out phoneno, out uaddress, out uemail);
        }
        public void updateData(string uid, string phone, string uname, string address, string uemail) 
        {
            da.getupdateData(uid, phone, uname, address, uemail);
        }
    }
}
