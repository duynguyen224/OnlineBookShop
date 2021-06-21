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
    public class TinTucDao
    {
        OnlineBookShopDbContext db = null;
        public TinTucDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public IEnumerable<TinTuc> listAll(string searchString, int page, int pageSize)
        {
            var res = db.TinTucs.ToList();
            if (!string.IsNullOrEmpty(searchString))
            {
                res = res.Where(x => x.Name.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            }
            return res.ToPagedList(page, pageSize);
        }

        public List<TinTuc> listAll1()
        {
            return db.TinTucs.Where(x => x.Status == true).OrderByDescending(x => x.ID).ToList();
        }

        public IEnumerable<TinTuc> listAll()
        {
            return db.TinTucs.ToList();
        }

        public string getPathImage_byId(int id)
        {
            var res = db.TinTucs.Where(x => x.ID == id).FirstOrDefault();
            return res.Image;
        }


        public void insertTinTuc(TinTuc s)
        {

            s.MetaTitle = new LocDau().nameToMeta(s.Name);
            s.Status = true;

            if (s.Image == null || s.Image == "")
            {
                s.Image = "~/Image/32f68a3b36b6c60f1d8bac9ba4af46fc.jpg";
            }

            // Tìm id chủ để và id nxb để insert Sach
            s.CreatedDate = DateTime.Today;

            // insert sach
            db.TinTucs.Add(s);
            db.SaveChanges();


        }

        public void updateTinTuc(TinTuc s_new)
        {
            var id = s_new.ID;
            var res = db.TinTucs.Find(id);
            res.Name = s_new.Name;
            res.Detail = s_new.Detail;
            res.Image = s_new.Image;
            res.CreatedDate = DateTime.Today;
            res.MetaTitle = new LocDau().nameToMeta(s_new.Name);

            db.SaveChanges();


        }

        public void deleteTinTuc(int id)
        {
            var res = db.TinTucs.Find(id);
            db.TinTucs.Remove(res);
            db.SaveChanges();
        }

        public IEnumerable<TinTuc> listAllPaging(int page, int pageSize, string searchString)
        {
            var res = db.TinTucs.ToList();

            if (!String.IsNullOrEmpty(searchString))
            {
                res = res.Where(x => x.Name.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            }

            return res.OrderByDescending(s => s.ID).ToPagedList(page, pageSize);
        }


        public TinTuc getNewsDetail(int id)
        {
            return db.TinTucs.Find(id);
        }


    }
}