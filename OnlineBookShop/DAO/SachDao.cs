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
            s.MetaTitle = new LocDau().nameToMeta(s.TenSach);
            s.GiaBan = bd.GiaBan;
            s.AnhBia = bd.AnhBia;
            s.BiaSau = bd.BiaSau;
            s.SoLuongTon = bd.SoLuongTon;
            s.MoTa = bd.MoTa;
            s.Detail = bd.Detail;
            if (s.SoLuongTon > 0)
            {
                s.Status = true;
            }
            if (s.AnhBia == null || s.AnhBia == "")
            {
                s.AnhBia = "~/Image/32f68a3b36b6c60f1d8bac9ba4af46fc.jpg";
            }
            if (s.BiaSau == null || s.BiaSau == "")
            {
                s.BiaSau = "~/Image/32f68a3b36b6c60f1d8bac9ba4af46fc.jpg";
            }

            // Tìm id chủ để và id nxb để insert Sach
            s.MaCD = cdDao.getIdChuDe_byName(bd.TenCD);
            s.MaNXB = nxbDao.getIdNXB_byName(bd.TenNXB);
            s.NgayCapNhat = DateTime.Now;

            // insert sach
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

            var matacgiacu = thamgiaDao.getIdTacGia_byIdSach(id);
            //Sach s = new Sach();
            s.TenSach = bd.TenSach;
            s.MetaTitle = new LocDau().nameToMeta(s.TenSach);
            s.GiaBan = bd.GiaBan;
            s.AnhBia = bd.AnhBia;
            s.BiaSau = bd.BiaSau;
            s.SoLuongTon = bd.SoLuongTon;
            s.MoTa = bd.MoTa;
            s.Detail = bd.Detail;
            s.NgayCapNhat = DateTime.Now;


            if (s.SoLuongTon > 0)
            {
                s.Status = true;
            }
            if (s.AnhBia == null || s.AnhBia == "")
            {
                s.AnhBia = "~/Image/32f68a3b36b6c60f1d8bac9ba4af46fc.jpg";
            }
            if (s.BiaSau == null || s.BiaSau == "")
            {
                s.BiaSau = "~/Image/32f68a3b36b6c60f1d8bac9ba4af46fc.jpg";
            }

            s.MaCD = cdDao.getIdChuDe_byName(bd.TenCD);
            s.MaNXB = nxbDao.getIdNXB_byName(bd.TenNXB);



            db.SaveChanges();

            // kiểm tra TacGia
            // Nếu tác giả mới thì tacGiaMoi = true
            int masach = getIdSach_byName(bd.TenSach);
            int matacgiamoi = tgDao.getIdTacGia_byName(bd.HoTenTG);
            if (thamgiaDao.alreadyJoin(masach, matacgiamoi) == 1)
            {
                tacGiaMoi = false;
            }
            else
            {
                tacGiaMoi = true;
            }
            // insert ThamGia
            if (tacGiaMoi == true)
            {
                thamgiaDao.deleteThamGia(masach, matacgiacu);
                thamgiaDao.insertThamGia(masach, matacgiamoi);
            }
        }

        public void deletSach(BookDetails bd)
        {
            var res = db.Saches.Find(bd.ID);
            db.Saches.Remove(res);
            db.SaveChanges();
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

            if (giaMin > 0 && giaMax >= giaMin)
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

        public string getPathAnotherImage_byId(int id)
        {
            var res = db.Saches.Where(x => x.ID == id).FirstOrDefault();
            return res.BiaSau;

        }

        public List<Sach> listSearch(string searchString, int giaMin, int giaMax)
        {
            var res = db.Saches.Where(x => x.TenSach.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            if (giaMin > 0 && giaMax >= giaMin)
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
            return res;
        }

        public List<Sach> listNewBook(int top)
        {
            return db.Saches.OrderBy(x => x.ID).Take(top).ToList();
        }

        public List<Sach> listNewBook1(int top)
        {
            return db.Saches.OrderByDescending(x => x.ID).Take(top).ToList();
        }

        public List<Sach> listRecommend(int top)
        {
            return db.Saches.OrderByDescending(x => x.GiaBan).Take(top).ToList();
        }

        public Sach getBookDetail(int id)
        {
            return db.Saches.Find(id);
        }

        public List<Sach> RecommendActive(int top, int idChuDe)
        {
            return db.Saches.Where(x => x.MaCD == idChuDe).OrderByDescending(x => x.GiaBan).Take(top).ToList();
        }

        public List<Sach> RecommendItem(int top, int idChuDe)
        {
            return db.Saches.Where(x => x.MaCD == idChuDe).OrderBy(x => x.GiaBan).Take(top).ToList();
        }

        public List<Sach> getBookByCategory(int catID, ref int totalRecord, int pageIndex = 1, int pageSize = 1)
        {
            totalRecord = db.Saches.Where(x => x.MaCD == catID && x.Status == true && x.SoLuongTon > 0).ToList().Count();

            return db.Saches.Where(x => x.MaCD == catID && x.Status == true && x.SoLuongTon > 0).OrderBy(x => x.GiaBan).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }



        public List<Sach> getBookBySearch(string searchString, int giaMin, int giaMax, ref int totalRecord, int pageIndex = 1, int pageSize = 1)
        {
            totalRecord = db.Saches.Where(x => x.TenSach.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList().Count();
            var res = db.Saches.Where(x => x.TenSach.ToLower().Trim().Contains(searchString.ToLower().Trim())).OrderBy(x => x.GiaBan).ToList();
            if (giaMin > 0 && giaMax >= giaMin)
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

            return res.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();


        }



    }
}