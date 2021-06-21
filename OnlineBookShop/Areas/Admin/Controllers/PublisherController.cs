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
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            NhaXuatBanDao dao = new NhaXuatBanDao();
            var list = dao.listAll(searchString, page, pageSize);
            ViewBag.searchString = searchString;
            return View(list);
        }
        [HttpGet]
        public ActionResult Create()
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            return View();
        }
        [HttpPost]
        public ActionResult Create(NhaXuatBan nxb)
        {
            if (ModelState.IsValid)
            {
                NhaXuatBanDao dao = new NhaXuatBanDao();
                dao.insertNhaXuatBan(nxb);
                return RedirectToAction("Index", "Publisher");
            }
            return View();
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            NhaXuatBanDao dao = new NhaXuatBanDao();
            var listNXB = dao.listAll();
            var res = listNXB.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }
        [HttpPost]
        public ActionResult Edit(NhaXuatBan _nxb)
        {
            if (ModelState.IsValid)
            {
                NhaXuatBanDao dao = new NhaXuatBanDao();
                dao.updateNXB(_nxb);
                return RedirectToAction("Index", "Publisher");

            }
            return View(_nxb);
        }

        [HttpGet]
        public ActionResult Details(int id)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
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