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
    public class NhaXuatBanDao
    {
        OnlineBookShopDbContext db = null;
        public NhaXuatBanDao()
        {
            db = new OnlineBookShopDbContext();
        }


        public IEnumerable<NhaXuatBan> listAll(string searchString, int page , int pageSize)
        {
            var res = db.NhaXuatBans.ToList();
            if (!string.IsNullOrEmpty(searchString))
            {
                res = res.Where(x => x.TenNXB.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            }
            return res.ToPagedList(page, pageSize);
        }
        public void insertNhaXuatBan(NhaXuatBan _nxb)
        {
            NhaXuatBan nxb = new NhaXuatBan();
            nxb.TenNXB = _nxb.TenNXB;
            nxb.DiaChi = _nxb.DiaChi;
            nxb.DienThoai = _nxb.DienThoai;
            db.NhaXuatBans.Add(nxb);
            db.SaveChanges();
        }

        public void deleteNXB(NhaXuatBan _nxb)
        {
            int id = _nxb.ID;
            var record = db.NhaXuatBans.Where(x => x.ID == id).FirstOrDefault();
            if(record != null)
            {
                db.NhaXuatBans.Remove(record);
                db.SaveChanges();
            }
        }

        public void updateNXB(NhaXuatBan _nxb)
        {
            int id = _nxb.ID;
            var record = db.NhaXuatBans.Where(x => x.ID == id).FirstOrDefault();
            if(record != null)
            {
                record.TenNXB = _nxb.TenNXB;
                record.DiaChi = _nxb.DiaChi;
                record.DienThoai = _nxb.DienThoai;
                db.SaveChanges();

            }
        }

        public int getIdNXB_byName(string name)
        {
            var res = db.NhaXuatBans.ToList().Find(x => x.TenNXB == name);
            if(res == null)
            {
                return 0;
            }
            else
            {
                return res.ID;
            }
        }

        public List<NhaXuatBan> listAll()
        {
            return db.NhaXuatBans.ToList();
        }
    }
}