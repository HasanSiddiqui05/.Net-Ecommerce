using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLUpdateInventory
    {
        DAUpdateInventory da = new DAUpdateInventory();
        public void getProductData(string id, out string pname, out string desc, out string cate, out string quan, out string price)
        {
            da.getData(id, out pname, out desc, out cate, out quan, out price);
        }
    }
}
