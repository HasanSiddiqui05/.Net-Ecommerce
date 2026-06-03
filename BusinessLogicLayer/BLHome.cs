using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLHome
    {
        private DAHome da = new DAHome();

        

        public string cartid(string id)
        {
            return da.idData(id);
        }

    }
}
