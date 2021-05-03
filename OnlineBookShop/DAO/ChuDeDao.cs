using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


using OnlineBookShop.Entities;
using System.Data.SqlClient;
using OnlineBookShop.Support_Class;


namespace OnlineBookShop.DAO
{
    public class ChuDeDao
    {
        OnlineBookShopDbContext db = null;
        public ChuDeDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public void insertChuDe(string tenCD)
        {
            ChuDe cd = new ChuDe();
            cd.TenCD = tenCD;
            db.ChuDes.Add(cd);
            db.SaveChanges();
        }

        public int getIdChuDe_byName(string name)
        {
            var res = db.ChuDes.ToList().Find(x => x.TenCD == name);
            if (res == null)
            {
                return 0;
            }
            else
            {
                return res.ID;
            }
        }

    }
}