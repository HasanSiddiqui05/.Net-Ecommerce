using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLAddProduct
    {
        DAAddProduct da = new DAAddProduct();
        
        public void addproduct(string name, string cate, string sid, string desc, string price, string quan, string img)
        {
            da.insertData(name, cate, sid, desc, price, quan, img);
        }
    }
}
