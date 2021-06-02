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
        public void deleteThamGia(int masach, int matacgia)
        {
            var res = db.ThamGias.Where(x => x.MaSach == masach && x.MaTG == matacgia).FirstOrDefault();
            db.ThamGias.Remove(res);
            db.SaveChanges();
        }

        public int getIdTacGia_byIdSach(int idSach)
        {
            var res = db.ThamGias.Where(x => x.MaSach == idSach).FirstOrDefault();
            return res.MaTG;
        }
        public int alreadyJoin(int masach, int matacgia)
        {
            var res = db.ThamGias.Where(x => x.MaSach == masach && x.MaTG == matacgia).FirstOrDefault();
            if (res != null)
                return 1;
            else return 0;
        }
    }
}