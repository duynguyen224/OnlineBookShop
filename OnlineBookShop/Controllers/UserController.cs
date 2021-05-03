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
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            UserDao dao = new UserDao();
            var res = dao.correctLogin(username, password);
            if (res > 0)
            {
                return View("~/Areas/Admin/Views/Home/Index.cshtml");
            }
            else
            {
                return RedirectToAction("Login", "User");
            }
        }

    }
}