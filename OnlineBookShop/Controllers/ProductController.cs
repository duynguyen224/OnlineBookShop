using OnlineBookShop.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using OnlineBookShop.Support_Class;

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


        public ActionResult Category(int id = 1, int page = 1, int pageSize = 8) // Liệt kê tất cả sản phẩm theo chủ đề
        {

            var res = new ChuDeDao().CategoryDetail(id);
            int totalRecord = 0;
            ViewBag.BookByCategory = new SachDao().getBookByCategory(id, ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5;
            int totalPage = 0;
            //totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            float sl1 = totalRecord % pageSize;
            if (sl1 > 0)
            {
                totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize)) + 1;
            }
            else
            {
                totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            }

            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = maxPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(res);
        }




        // sau khi bấm nút search thì vào đây làm việc. Search theo 
        public ActionResult ProductSearch(string searchString = "", int giaMin = 0, int giaMax = 0, int page = 1, int pageSize = 4)
        {
            ViewBag.SearchString = searchString;
            var res = new SachDao().listSearch(searchString, giaMin, giaMax);
            int totalRecord = 0;
            //ViewBag.BookBySearch = new SachDao().getBookBySearch(searchString,giaMin, giaMax, ref totalRecord, page, pageSize);
            var res1 = new SachDao().getBookBySearch(searchString, giaMin, giaMax, ref totalRecord, page, pageSize);
            ViewBag.CountRestult = res1.Count();

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5;
            int totalPage = 0;
            float sl1 = totalRecord % pageSize;
            if (sl1 > 0)
            {
                totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize)) + 1;
            }
            else
            {
                totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            }
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = maxPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            // new 


            if (giaMin == 0 && giaMax == 0)
            {
                ViewBag.giaMin = null;
                ViewBag.giaMax = null;

            }
            else
            {
                ViewBag.giaMin = giaMin;
                ViewBag.giaMax = giaMax;
            }

            return View(res1);
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