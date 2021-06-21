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
    public class OrderController : Controller
    {
        // GET: Admin/Order
        public ActionResult Index(string searchString = "", int page = 1, int pageSize = 5)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            OrderDao dao = new OrderDao();
            var list = dao.listAll(searchString, page, pageSize);
            ViewBag.searchString = searchString;
            return View(list);
        }

        public ActionResult Confirm(int id)
        {
            OrderDao dao = new OrderDao();
            dao.ConfirmOrder(id);
            return RedirectToAction("Index");
        }

        public ActionResult Details(int id, int page = 1, int pageSize = 5)
        {
            if (Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập trước khi vào Admin";
                return RedirectToAction("Login", "User", new { area = "" });
            }
            OrderDetailDao dao = new OrderDetailDao();
            var res = dao.OrderDetailsCustomer(id, page, pageSize);
            return View(res);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            OrderDao dao = new OrderDao();
            dao.DeleteOrder(id);
            return RedirectToAction("Index");
        }

        //[HttpPost]
        //public ActionResult Delete(TinTuc tt)
        //{
        //    TinTucDao dao = new TinTucDao();
        //    dao.deleteTinTuc(tt.ID);
        //    return RedirectToAction("Index", "Order");
        //}

    }
}