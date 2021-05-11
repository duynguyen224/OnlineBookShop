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
            var res = db.Database.SqlQuery<BookDetails>("proc_sach_BookDetails").ToList(); ;
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

            if(s.AnhBia == null || s.AnhBia == "")
            {
                s.AnhBia = "~/Image/32f68a3b36b6c60f1d8bac9ba4af46fc.jpg";

            }

            // kiểm tra ChuDe có hay chưa.
            // nếu có rồi thì thôi
            // nếu chưa có thì thêm mới chủ đề vào Db
            if (cdDao.getIdChuDe_byName(bd.TenCD) == 0)
            {
                cdDao.insertChuDe(bd.TenCD);
                s.MaCD = cdDao.getIdChuDe_byName(bd.TenCD);
            }
            else
            {
                s.MaCD = cdDao.getIdChuDe_byName(bd.TenCD);
            }

            // kiểm tra NhaXuatBan
            if (nxbDao.getIdNXB_byName(bd.TenNXB) == 0)
            {
                nxbDao.insertNhaXuatBan(bd.TenNXB);
                s.MaNXB = nxbDao.getIdNXB_byName(bd.TenNXB);

            }
            else
            {
                s.MaNXB = nxbDao.getIdNXB_byName(bd.TenNXB);
            }

            // insert sach
            db.Saches.Add(s);

            // kiểm tra TacGia
            if (tgDao.getIdTacGia_byName(bd.HoTenTG) == 0)
            {
                tgDao.insertTacGia(bd.HoTenTG);

            }
            else
            {

            }
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


            //kiểm tra ChuDe có hay chưa.
            // nếu có rồi thì thôi
            // nếu chưa có thì thêm mới chủ đề vào Db
            if (cdDao.getIdChuDe_byName(bd.TenCD) == 0)
            {
                cdDao.insertChuDe(bd.TenCD);
                s.MaCD = cdDao.getIdChuDe_byName(bd.TenCD);
            }
            else
            {
                s.MaCD = cdDao.getIdChuDe_byName(bd.TenCD);
            }

            // kiểm tra NhaXuatBan
            if (nxbDao.getIdNXB_byName(bd.TenNXB) == 0)
            {
                nxbDao.insertNhaXuatBan(bd.TenNXB);
                s.MaNXB = nxbDao.getIdNXB_byName(bd.TenNXB);
            }
            else
            {
                s.MaNXB = nxbDao.getIdNXB_byName(bd.TenNXB);
            }


            // kiểm tra TacGia
            if (tgDao.getIdTacGia_byName(bd.HoTenTG) == 0)
            {
                tgDao.insertTacGia(bd.HoTenTG);
                tacGiaMoi = true;
            }
            else
            {

            }
            s.NgayCapNhat = DateTime.Now;


            db.SaveChanges();


            // insert ThamGia
            if(tacGiaMoi == true)
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
            if(res == null)
            {
                return 0;
            }
            else
            {
                return res.ID;
            }
        }

        public IEnumerable<BookDetails> listAllPaging(string searchString, int page, int pageSize)
        {
            var res = db.Database.SqlQuery<BookDetails>("proc_sach_BookDetails").ToList();
            // t đưa các trường nào lên thì có cái class để lưu dữ liệu của các trường đấy.
            // như ở đây là class BookDetails
            if (!string.IsNullOrEmpty(searchString))
            {
                res = res.Where(x => x.TenSach.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
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