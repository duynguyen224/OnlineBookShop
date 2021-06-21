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
    public class CategoryController : Controller
    {
        // GET: Admin/Category
        public ActionResult Index(string searchString = "", int page = 1, int pageSize = 5)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            ChuDeDao dao = new ChuDeDao();
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
        public ActionResult Create(ChuDe cd)
        {
            if (ModelState.IsValid)
            {
                ChuDeDao dao = new ChuDeDao();
                dao.insertChuDe(cd);
                return RedirectToAction("Index", "Category");

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
            ChuDeDao dao = new ChuDeDao();
            var lítCD = dao.listAll();
            var res = lítCD.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }
        [HttpPost]
        public ActionResult Edit(ChuDe chude)
        {
            if (ModelState.IsValid)
            {
                ChuDeDao dao = new ChuDeDao();
                dao.updateChuDe(chude);
                return RedirectToAction("Index", "Category");

            }
            return View(chude);
        }

        [HttpGet]
        public ActionResult Details(int id)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            ChuDeDao dao = new ChuDeDao();
            var res = dao.listAll().Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            ChuDeDao dao = new ChuDeDao();
            var lítCD = dao.listAll();
            var res = lítCD.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }
        [HttpPost]
        public ActionResult Delete(ChuDe chude)
        {
            ChuDeDao dao = new ChuDeDao();
            dao.deleteChuDe(chude);
            return RedirectToAction("Index", "Category");
        }
    }
}