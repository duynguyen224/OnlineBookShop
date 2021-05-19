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
    public class PublisherController : Controller
    {
        // GET: Admin/Publisher
        public ActionResult Index(string searchString = "", int page = 1, int pageSize = 5)
        {
            NhaXuatBanDao dao = new NhaXuatBanDao();
            var list = dao.listAll(searchString, page, pageSize);
            ViewBag.searchString = searchString;
            return View(list);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(NhaXuatBan nxb)
        {
            NhaXuatBanDao dao = new NhaXuatBanDao();
            dao.insertNhaXuatBan(nxb);
            return RedirectToAction("Index", "Publisher");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            NhaXuatBanDao dao = new NhaXuatBanDao();
            var listNXB = dao.listAll();
            var res = listNXB.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }
        [HttpPost]
        public ActionResult Edit(NhaXuatBan _nxb)
        {
            NhaXuatBanDao dao = new NhaXuatBanDao();
            dao.updateNXB(_nxb);
            return RedirectToAction("Index", "Publisher");
        }

        [HttpGet]
        public ActionResult Details(int id)
        {
            NhaXuatBanDao dao = new NhaXuatBanDao();
            var res = dao.listAll().Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            NhaXuatBanDao dao = new NhaXuatBanDao();
            var listNXB = dao.listAll();
            var res = listNXB.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }
        [HttpPost]
        public ActionResult Delete(NhaXuatBan _nxb)
        {
            NhaXuatBanDao dao = new NhaXuatBanDao();
            dao.deleteNXB(_nxb);
            return RedirectToAction("Index", "Publisher");
        }


    }
}