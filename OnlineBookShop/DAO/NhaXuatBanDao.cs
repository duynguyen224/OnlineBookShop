using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using OnlineBookShop.Entities;
using System.Data.SqlClient;
using OnlineBookShop.Support_Class;



namespace OnlineBookShop.DAO
{
    public class NhaXuatBanDao
    {
        OnlineBookShopDbContext db = null;
        public NhaXuatBanDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public void insertNhaXuatBan(string tenNXB, string diaChi = null, string dienThoai = null)
        {
            NhaXuatBan nxb = new NhaXuatBan();
            nxb.TenNXB = tenNXB;
            nxb.DiaChi = diaChi;
            nxb.DienThoai = dienThoai;
            db.NhaXuatBans.Add(nxb);
            db.SaveChanges();
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

    }
}