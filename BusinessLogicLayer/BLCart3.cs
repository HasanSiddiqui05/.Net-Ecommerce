using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLCart3
    {
        DACart3 da =new DACart3();

        public void updateCart(string cid) 
        {
            da.updateCart(cid);
        }
        public void insertOrder(string cid, string uid, string total, DateTime odate) 
        {
            da.insertIntoOrder(cid, uid, total, odate);
        }
        public string orderId(string cid, string uid) 
        {
            return da.idData(cid, uid);
        }
        public void completeOrderDetails(string oid, string cid) 
        {
            da.comOrderDetail(oid, cid);
        }
    }
}
