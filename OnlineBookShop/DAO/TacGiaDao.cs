using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


using OnlineBookShop.Entities;
using System.Data.SqlClient;
using OnlineBookShop.Support_Class;


namespace OnlineBookShop.DAO
{
    public class TacGiaDao
    {
        OnlineBookShopDbContext db = null;
        public TacGiaDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public void insertTacGia(string hoten, string diachi = null, string tieusu = null, string dienthoai = null)
        {
            TacGia tg = new TacGia();
            tg.HoTenTG = hoten;
            tg.DiaChi = diachi;
            tg.TieuSu = tieusu;
            tg.DienThoai = dienthoai;
            db.TacGias.Add(tg);
            db.SaveChanges();
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
    }
}