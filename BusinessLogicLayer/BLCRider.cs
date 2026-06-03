using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLCRider
    {
        DACRider da = new DACRider();

        public void insertRider(string uid, string nv, string vno, string year, string lno) 
        {
            da.insertData(uid, nv, vno, year, lno);
        }

        public void riderData(string uid, out string phoneno, out string address, out string email) 
        {
            da.getData(uid, out phoneno, out address, out email);
        }
        public string riderID(string id) 
        {
            return da.rideridData(id);
        }
    }
}
