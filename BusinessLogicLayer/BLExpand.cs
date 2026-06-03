using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLExpand
    {
        DAPExpand da =new DAPExpand();

        public void insertIntoCart(string cid, string pid) 
        {
            da.insertData(cid, pid);
        }

        public void insertReview(string uid, string pid, string review) 
        {
            da.insertReviewData(uid, pid, review);
        }
    }
}
