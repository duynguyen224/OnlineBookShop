using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using OnlineBookShop.Entities;
using OnlineBookShop.DAO;
using OnlineBookShop.Support_Class;
using PagedList;
using System.IO;

namespace OnlineBookShop.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            SachDao dao = new SachDao();
            //var listBook = dao.listAllBook();
            var listBook = dao.listAllPaging(searchString, page, pageSize);
            ViewBag.searchString = searchString;
            return View(listBook);
        }

        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(BookDetails bd)
        {
            string fileName = Path.GetFileNameWithoutExtension(bd.ImageFile.FileName);
            string extension = Path.GetExtension(bd.ImageFile.FileName);
            fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
            bd.AnhBia = "~/Image/" + fileName;
            fileName = Path.Combine(Server.MapPath("~/Image/"), fileName);
            bd.ImageFile.SaveAs(fileName);
            SachDao dao = new SachDao();
            dao.insertSach(bd);
            ModelState.Clear();
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult Edit1(int id)
        {
            SachDao dao = new SachDao();
            var list = dao.listAllBook();
            var res = list.Where(x => x.ID == id).FirstOrDefault();
            // như này là truyền cmn ID Sách vào rồi. Phải truyền id tác giả cơ
            // coi như đây là id tác giả đi. Thì setViewBag chỗ này bị xử lý sai cmnr
            setViewBag(id);
            return View(res);
        }

        [HttpPost]
        public ActionResult Edit1(BookDetails bd_new)
        {
            string fileName = Path.GetFileNameWithoutExtension(bd_new.ImageFile.FileName);
            string extension = Path.GetExtension(bd_new.ImageFile.FileName);
            fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
            bd_new.AnhBia = "~/Image/" + fileName;
            fileName = Path.Combine(Server.MapPath("~/Image/"), fileName);
            bd_new.ImageFile.SaveAs(fileName);

            //ViewBag.ImageUrl = fileName;
            //

            SachDao dao = new SachDao();
            dao.updateSach(bd_new);
            ModelState.Clear();

            return RedirectToAction("Index", "Home");

        }

        public void setViewBag(int? selectedId = null)
        {
            TacGiaDao dao = new TacGiaDao();
            ViewBag.HoTenTG = new SelectList(dao.listAll(), "ID", "HoTenTG", selectedId);
            ChuDeDao cdDao = new ChuDeDao();
            ViewBag.TenCD = new SelectList(cdDao.listAll(), "ID", "TenCD", selectedId);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            SachDao dao = new SachDao();
            var list = dao.listAllBook();
            var res = list.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }
        [HttpPost]
        public ActionResult Edit(BookDetails bd_new)
        {

            if (bd_new.ImageFile == null)
            {
                SachDao sdao = new SachDao();
                bd_new.AnhBia = sdao.getPathImage_byId(bd_new.ID);
            }
            else
            {
                string fileName = Path.GetFileNameWithoutExtension(bd_new.ImageFile.FileName);
                string extension = Path.GetExtension(bd_new.ImageFile.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                bd_new.AnhBia = "~/Image/" + fileName;
                fileName = Path.Combine(Server.MapPath("~/Image/"), fileName);
                bd_new.ImageFile.SaveAs(fileName);

            }

            //ViewBag.ImageUrl = fileName;
            //

            SachDao dao = new SachDao();
            dao.updateSach(bd_new);
            ModelState.Clear();

            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult Details(int id)
        {
            SachDao dao = new SachDao();
            var list = dao.listAllBook();
            var res = list.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            SachDao dao = new SachDao();
            var list = dao.listAllBook();
            var res = list.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }

        [HttpPost]
        public ActionResult Delete(BookDetails bd)
        {
            SachDao dao = new SachDao();
            dao.deletSach(bd);
            return RedirectToAction("Index", "Home");
        }
    }
}