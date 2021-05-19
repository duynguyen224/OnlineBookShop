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
    public class TacGiaDao
    {
        OnlineBookShopDbContext db = null;
        public TacGiaDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public IEnumerable<TacGia> listAll(string searchString, int page, int pageSize)
        {
            var res = db.TacGias.ToList();
            if (!string.IsNullOrEmpty(searchString))
            {
                res = res.Where(x => x.HoTenTG.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            }
            return res.ToPagedList(page, pageSize);
        }

        public void insertTacGia(TacGia tacgia)
        {
            if(tacgia != null)
            {
                db.TacGias.Add(tacgia);
                db.SaveChanges();
            }
        }
        public void deleteTacGia(TacGia tacgia)
        {
            int id = tacgia.ID;
            var record = db.TacGias.Where(x => x.ID == id).FirstOrDefault();
            if(record != null)
            {
                db.TacGias.Remove(record);
                db.SaveChanges();
            }
        }

        public void updateTacGia(TacGia tacgia)
        {
            int id = tacgia.ID;
            var record = db.TacGias.Where(x => x.ID == id).FirstOrDefault();
            if(record != null)
            {
                record.HoTenTG = tacgia.HoTenTG;
                record.DiaChi = tacgia.DiaChi;
                record.TieuSu = tacgia.TieuSu;
                record.DienThoai = tacgia.DienThoai;
                db.SaveChanges();
            }
        }

        public int getIdTacGia_byName(string name)
        {
            var res = db.TacGias.ToList().Find(x => x.HoTenTG == name);
            if(res == null)
            {
                return 0;
            }
            else
            {
                return res.ID;
            }
        }

        public List<TacGia> listAll()
        {
            return db.TacGias.ToList();
        }
    }
}