using OnlineBookShop.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineBookShop.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.Slides = new SlideDao().listAll();
            ViewBag.ListNewBook = new SachDao().listNewBook(8);
            ViewBag.ListNewBook1 = new SachDao().listNewBook1(8);

            ViewBag.ListRecommend = new SachDao().listRecommend(4);
            return View();
        }

        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            MenuDao dao = new MenuDao();
            var res = dao.listByGroupId(1);
            return PartialView(res);
        }

        [ChildActionOnly]
        public ActionResult TopMenu()
        {
            MenuDao dao = new MenuDao();
            var res = dao.listByGroupId(2);
            return PartialView(res);
        }


    }
}