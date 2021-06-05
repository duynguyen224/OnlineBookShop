using OnlineBookShop.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineBookShop.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        //public ActionResult Index(int id =1)
        //{
        //    var res = new ChuDeDao().CategoryDetail(id);
        //    ViewBag.BookByCategory = new SachDao().getBookByCategory(id);
        //    return View(res);
        //}


        public ActionResult Category(int id = 1,  int page =1, int pageSize = 4) // Liệt kê tất cả sản phẩm theo chủ đề
        {

            var res = new ChuDeDao().CategoryDetail(id);
            int totalRecord = 0;
            ViewBag.BookByCategory = new SachDao().getBookByCategory(id,ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5;
            int totalPage = 0;
            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = maxPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(res);
        }

        public ActionResult Detail(int id) // xem chi tiết một sản phẩm
        {
            var res = new SachDao().getBookDetail(id);
            ViewBag.RecommendItemActive = new SachDao().RecommendActive(3, res.MaCD.GetValueOrDefault());
            ViewBag.RecommendItem = new SachDao().RecommendItem(3, res.MaCD.GetValueOrDefault());
            return View(res);
        }

        [ChildActionOnly]
        public PartialViewResult ProductCategory() // 
        {
            ChuDeDao dao = new ChuDeDao();
            var res = dao.listAll();
            return PartialView(res);
        }


    }
}