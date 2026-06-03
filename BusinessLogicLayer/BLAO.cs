using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLAO
    {
        DAAO da = new DAAO();

        public void updateStatus(string oid) 
        {
            da.getupdateStatus(oid);
        }
    }
}
