using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using OnlineBookShop.Entities;
using System.Data.SqlClient;
using OnlineBookShop.Support_Class;


namespace OnlineBookShop.DAO
{
    public class ThamGiaDao
    {
        OnlineBookShopDbContext db = null;
        public ThamGiaDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public void insertThamGia(int masach, int matg, string vaitro = "Tác giả chính", string vitri = null)
        {
            ThamGia t = new ThamGia();
            t.MaSach = masach;
            t.MaTG = matg;
            t.VaiTro = vaitro;
            t.ViTri = vitri;
            db.ThamGias.Add(t);
            db.SaveChanges();
        }


    }
}