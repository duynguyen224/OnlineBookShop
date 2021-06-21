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
    public class NewsController : Controller
    {
        // GET: Admin/News
        public ActionResult Index(string searchString = "", int page = 1, int pageSize = 5)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            TinTucDao dao = new TinTucDao();
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
        [ValidateInput(false)]
        public ActionResult Create(TinTuc tt)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    // anh bia
                    tt.Image = "";
                    string fileName = Path.GetFileNameWithoutExtension(tt.ImageFile.FileName);
                    string extension = Path.GetExtension(tt.ImageFile.FileName);
                    fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                    tt.Image = "~/Image/" + fileName;
                    fileName = Path.Combine(Server.MapPath("~/Image/"), fileName);
                    tt.ImageFile.SaveAs(fileName);
                }
                return View();

            }
            catch
            {
                TinTucDao dao = new TinTucDao();
                dao.insertTinTuc(tt);
                ModelState.Clear();
                return RedirectToAction("Index", "News");

            }
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            TinTucDao dao = new TinTucDao();
            var list = dao.listAll();
            var res = list.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }

        [HttpPost]
        [ValidateInput(false)]

        public ActionResult Edit(TinTuc tt_new)
        {
            if (tt_new.ImageFile == null) // luoon luoon null. neu null thi vao db lay cai duong dan ra
            {
                TinTucDao ttdao = new TinTucDao();
                tt_new.Image = ttdao.getPathImage_byId(tt_new.ID);

            }
            else // neu co thay doi thi nhu create
            {
                string fileName = Path.GetFileNameWithoutExtension(tt_new.ImageFile.FileName);
                string extension = Path.GetExtension(tt_new.ImageFile.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                tt_new.Image = "~/Image/" + fileName;
                fileName = Path.Combine(Server.MapPath("~/Image/"), fileName);
                tt_new.ImageFile.SaveAs(fileName);
            }


            if (ModelState.IsValid)
            {

                TinTucDao dao = new TinTucDao();
                dao.updateTinTuc(tt_new);
                ModelState.Clear();
                return RedirectToAction("Index", "News");

            }
            return View(tt_new);

        }
        [HttpGet]
        public ActionResult Details(int id)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            TinTucDao dao = new TinTucDao();
            var list = dao.listAll();
            var res = list.Where(x => x.ID == id).FirstOrDefault();
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
            TinTucDao dao = new TinTucDao();
            var list = dao.listAll();
            var res = list.Where(x => x.ID == id).FirstOrDefault();
            return View(res);
        }

        [HttpPost]
        public ActionResult Delete(TinTuc tt)
        {
            TinTucDao dao = new TinTucDao();
            dao.deleteTinTuc(tt.ID);
            return RedirectToAction("Index", "News");
        }


    }
}