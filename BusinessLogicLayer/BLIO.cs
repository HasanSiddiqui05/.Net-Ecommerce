using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLIO
    {
        DAIO da = new DAIO();
        public void riderID(string rid, string oid) 
        {
            da.updateOrder(rid, oid);
        }
    }
}
