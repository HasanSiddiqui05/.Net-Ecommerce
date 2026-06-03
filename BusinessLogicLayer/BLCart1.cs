using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLCart1
    {
        DACart1 da = new DACart1();
        public decimal totalbill(decimal price, int quan) 
        {
            decimal totalbill = 0;
            totalbill += price * quan;
            return totalbill;
        }
        public string pQuantity(string pid) 
        {
            return da.getQuantity(pid);
        }
        public void updateQuantity(string pid, int cquan) 
        {
            da.getUpdateQuantity(pid, cquan);
        }
        public void orderDetails(string uid, string cid, string pid, int cquan, string price) 
        {
            da.setOrderDetails(uid, cid, pid, cquan, price);
        }
    }
}
