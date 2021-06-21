using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using OnlineBookShop.DAO;


namespace OnlineBookShop.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        public ActionResult Index(string searchString = "", int page = 1, int pageSize = 4)
        {
            var tintuc = new TinTucDao();
            var model = tintuc.listAllPaging(page, pageSize, searchString);
            ViewBag.TinTuc = tintuc.listAll();
            ViewBag.searchString = searchString;
            return View(model);
        }

        public ActionResult Detail(int id)
        {
            var tintuc = new TinTucDao();
            var res = tintuc.getNewsDetail(id);
            return View(res);
        }
    }
}