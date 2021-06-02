using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineBookShop.Entities;
using System.Data.SqlClient;
using OnlineBookShop.Support_Class;
using PagedList;
using System.IO;

namespace OnlineBookShop.DAO
{
    public class ChuDeDao
    {
        OnlineBookShopDbContext db = null;
        public ChuDeDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public IEnumerable<ChuDe> listAll(string searchString, int page, int pageSize)
        {
            var res = db.ChuDes.ToList();
            if (!string.IsNullOrEmpty(searchString))
            {
                res = res.Where(x => x.TenCD.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            }
            return res.ToPagedList(page, pageSize);
        }

        public void insertChuDe(ChuDe chude)
        {
            ChuDe cd = new ChuDe();
            cd.TenCD = chude.TenCD;
            cd.MetaTitle = new LocDau().nameToMeta(chude.TenCD);
            cd.Status = true;
            db.ChuDes.Add(cd);
            db.SaveChanges();
        }

        public void deleteChuDe(ChuDe chude)
        {
            int id = chude.ID;
            var record = db.ChuDes.Where(x => x.ID == id).FirstOrDefault();
            if(record != null)
            {
                db.ChuDes.Remove(record);
                db.SaveChanges();
            }
        }

        public void updateChuDe(ChuDe chude)
        {
            int id = chude.ID;
            var record = db.ChuDes.Where(x => x.ID == id).FirstOrDefault();
            if(record != null)
            {
                record.TenCD = chude.TenCD;
                record.MetaTitle = new LocDau().nameToMeta(chude.TenCD);
                record.Status = true;
                db.SaveChanges();
            }
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

        public List<ChuDe> listAll()
        {

            return db.ChuDes.ToList();
        }

    }
}