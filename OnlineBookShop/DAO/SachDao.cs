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
    public class SachDao
    {
        OnlineBookShopDbContext db = null;
        public SachDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public List<BookDetails> listAllBook()
        {
            var res = db.Database.SqlQuery<BookDetails>("proc_sach_BookDetails").ToList();
            return res;
        }

        public List<BookDetails> listBook_byId(int id)
        {
            var i = new SqlParameter("@id", id);
            var res = db.Database.SqlQuery<BookDetails>("proc_sach_BookDetails_byId @id", i).ToList();
            return res;
        }


        public void insertSach(BookDetails bd)
        {
            SachDao sDao = new SachDao();
            ChuDeDao cdDao = new ChuDeDao();
            NhaXuatBanDao nxbDao = new NhaXuatBanDao();
            TacGiaDao tgDao = new TacGiaDao();
            ThamGiaDao thamgiaDao = new ThamGiaDao();

            Sach s = new Sach();
            s.TenSach = bd.TenSach;
            s.GiaBan = bd.GiaBan;
            s.AnhBia = bd.AnhBia;
            s.SoLuongTon = bd.SoLuongTon;

            if (s.AnhBia == null || s.AnhBia == "")
            {
                s.AnhBia = "~/Image/32f68a3b36b6c60f1d8bac9ba4af46fc.jpg";

            }

            s.MaCD = cdDao.getIdChuDe_byName(bd.TenCD);



            s.MaNXB = nxbDao.getIdNXB_byName(bd.TenNXB);


            // insert sach
            db.Saches.Add(s);


            s.NgayCapNhat = DateTime.Now;

            db.Saches.Add(s);
            db.SaveChanges();


            // insert ThamGia
            int masach = getIdSach_byName(bd.TenSach);
            int matacgia = tgDao.getIdTacGia_byName(bd.HoTenTG);
            thamgiaDao.insertThamGia(masach, matacgia);


        }

        public void updateSach(BookDetails bd)
        {
            SachDao sDao = new SachDao();
            ChuDeDao cdDao = new ChuDeDao();
            NhaXuatBanDao nxbDao = new NhaXuatBanDao();
            TacGiaDao tgDao = new TacGiaDao();
            ThamGiaDao thamgiaDao = new ThamGiaDao();
            bool tacGiaMoi = false;

            var id = bd.ID;
            var s = db.Saches.Where(x => x.ID == id).FirstOrDefault();

            //Sach s = new Sach();
            s.TenSach = bd.TenSach;
            s.GiaBan = bd.GiaBan;
            s.AnhBia = bd.AnhBia;
            s.SoLuongTon = bd.SoLuongTon;

            if (s.AnhBia == null || s.AnhBia == "")
            {
                s.AnhBia = "~/Image/32f68a3b36b6c60f1d8bac9ba4af46fc.jpg";

            }


            s.MaCD = cdDao.getIdChuDe_byName(bd.TenCD);

            #region
            #endregion

            // kiểm tra NhaXuatBan
            s.MaNXB = nxbDao.getIdNXB_byName(bd.TenNXB);



            // kiểm tra TacGia

            s.NgayCapNhat = DateTime.Now;


            db.SaveChanges();


            // insert ThamGia
            if (tacGiaMoi == true)
            {
                int masach = getIdSach_byName(bd.TenSach);
                int matacgia = tgDao.getIdTacGia_byName(bd.HoTenTG);
                thamgiaDao.insertThamGia(masach, matacgia);

            }
        }

        public void deletSach(BookDetails bd)
        {
            var id = bd.ID;
            var i = new SqlParameter("@id", id);
            db.Database.ExecuteSqlCommand("proc_sach_delete_byId @id", i);
        }

        public int getIdSach_byName(string name)
        {
            var res = db.Saches.ToList().Find(x => x.TenSach == name);
            if (res == null)
            {
                return 0;
            }
            else
            {
                return res.ID;
            }
        }

        public IEnumerable<BookDetails> listAllPaging(string searchString, string searchField, int giaMin, int giaMax, int page, int pageSize)
        {
            var res = db.Database.SqlQuery<BookDetails>("proc_sach_BookDetails").ToList();
            if (!string.IsNullOrEmpty(searchString) && searchField == "TenSach" || string.IsNullOrEmpty(searchString) && searchField == "TenSach")
            {
                res = res.Where(x => x.TenSach.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            }
            else if (!string.IsNullOrEmpty(searchString) && searchField == "TenTG" || string.IsNullOrEmpty(searchString) && searchField == "TenTG")
            {
                res = res.Where(x => x.HoTenTG.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            }
            else if (!string.IsNullOrEmpty(searchString) && searchField == "TenNXB" || string.IsNullOrEmpty(searchString) && searchField == "TenNXB")
            {
                res = res.Where(x => x.TenNXB.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            }
            else if (!string.IsNullOrEmpty(searchString) && searchField == "TenNXB" || string.IsNullOrEmpty(searchString) && searchField == "TenNXB")
            {
                res = res.Where(x => x.TenCD.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            }
            else if (!string.IsNullOrEmpty(searchString) && searchField == "GiaGiam" || string.IsNullOrEmpty(searchString) && searchField == "GiaGiam")
            {
                res = res.Where(x => x.TenSach.ToLower().Trim().Contains(searchString.ToLower().Trim())).OrderByDescending(x => x.GiaBan).ToList();
            }
            else if (!string.IsNullOrEmpty(searchString) && searchField == "GiaTang" || string.IsNullOrEmpty(searchString) && searchField == "GiaTang")
            {
                res = res.Where(x => x.TenSach.ToLower().Trim().Contains(searchString.ToLower().Trim())).OrderBy(x => x.GiaBan).ToList();
            }

            if (giaMin > 0 && giaMax >= giaMin || giaMin > 0)
            {
                res = res.Where(x => x.GiaBan >= giaMin && x.GiaBan <= giaMax).OrderBy(x => x.GiaBan).ToList();
            }
            else if (giaMin >= 0 && giaMax == 0)
            {
                res = res.Where(x => x.GiaBan >= giaMin).OrderBy(x => x.GiaBan).ToList();
            }
            else if (giaMax >= 0 && giaMin == 0)
            {
                res = res.Where(x => x.GiaBan <= giaMax).OrderBy(x => x.GiaBan).ToList();

            }

            if (searchField == "GiaGiam")
            {
                res = res.OrderByDescending(x => x.GiaBan).ToList();
            }
            else if (searchField == "GiaTang")
            {
                res = res.OrderBy(x => x.GiaBan).ToList();

            }



            return res.ToPagedList(page, pageSize);
        }

        public string getPathImage_byId(int id)
        {
            var res = db.Saches.Where(x => x.ID == id).FirstOrDefault();
            return res.AnhBia;
        }
    }
}