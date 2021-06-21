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
    public class AuthorController : Controller
    {
        // GET: Admin/Author
        public ActionResult Index(string searchString = "", int page = 1, int pageSize = 5)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            TacGiaDao dao = new TacGiaDao();
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
        public ActionResult Create(TacGia tg)
        {
            if (ModelState.IsValid)
            {
                TacGiaDao dao = new TacGiaDao();
                dao.insertTacGia(tg);
                return RedirectToAction("Index", "Author");

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
            TacGiaDao dao = new TacGiaDao();
            var listTG = dao.listAll();
            var res = listTG.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }
        [HttpPost]
        public ActionResult Edit(TacGia tg)
        {
            if (ModelState.IsValid)
            {
                TacGiaDao dao = new TacGiaDao();
                dao.updateTacGia(tg);
                return RedirectToAction("Index", "Author");

            }
            return View(tg);
        }

        [HttpGet]
        public ActionResult Details(int id)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            TacGiaDao dao = new TacGiaDao();
            var res = dao.listAll().Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            TacGiaDao dao = new TacGiaDao();
            var listTG = dao.listAll();
            var res = listTG.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }
        [HttpPost]
        public ActionResult Delete(TacGia tg)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            TacGiaDao dao = new TacGiaDao();
            dao.deleteTacGia(tg);
            return RedirectToAction("Index", "Author");
        }
    }
}