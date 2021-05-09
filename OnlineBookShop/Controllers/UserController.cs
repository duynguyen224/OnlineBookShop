using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using OnlineBookShop.DAO;
using OnlineBookShop.Entities;

namespace OnlineBookShop.Controllers
{
    public class UserController : Controller
    {
        // GET: Login
        [HttpGet]
        public ActionResult Login()
        {
            if(Session["username"] == null)
            {
                Session["thongbao"] = "Cần đăng nhập";
            }
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            UserDao dao = new UserDao();
            var res = dao.correctLogin(username, password);
            if (res > 0)
            {
                Session["username"] = username;
                return RedirectToAction("Index", "Home", new { area = "Admin" });
                //return RedirectToAction("Index", "Home");
            }
            else
            {
                Session["loginError"] = "Sai tài khoản hoặc mật khẩu";
                return RedirectToAction("Login", "User");
            }
        }

    }
}