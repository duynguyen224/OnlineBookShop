using OnlineBookShop.DAO;
using OnlineBookShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using OnlineBookShop.Entities;

namespace OnlineBookShop.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        public ActionResult AddItem(int productId, int quantity)
        {
            var product = new SachDao().getBookDetail(productId);
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.ID == productId))
                {
                    foreach (var item in list)
                    {
                        item.Quantity += quantity;
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
            }
            else
            {
                // tạo item mới và đưa vào list
                var item = new CartItem();
                item.Product = product;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);

                // gán vào Session
                Session[CartSession] = list;
            }
            return RedirectToAction("Index", "Cart");
        }

        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];
            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.ID == item.Product.ID);
                if (jsonItem != null)
                {
                    //
                    if (jsonItem.Quantity <= 0)
                    {
                        item.Quantity = 1;
                    }
                    else
                    {
                        item.Quantity = jsonItem.Quantity;
                    }
                    //
                    //item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new { status = true });
        }

        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new { status = true });

        }

        public JsonResult Delete(int id)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.Product.ID == id);
            Session[CartSession] = sessionCart;
            return Json(new { status = true });

        }

        public ActionResult Payment()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);

        }

        [HttpPost]
        public ActionResult Payment(string shipName, string shipPhone, string shipAddress, string shipEmail)
        {
            Order o = new Order();
            o.ShipName = shipName;
            o.ShipMobile = shipPhone;
            o.ShipAddress = shipAddress;
            o.ShipEmail = shipEmail;
            o.CreatedDate = DateTime.Now;

            var id = new OrderDao().Insert(o);
            var cart = (List<CartItem>)Session[CartSession];

            var detailsDao = new OrderDetailDao();
            foreach (var item in cart)
            {
                var od = new OrderDetail();
                od.ProductID = item.Product.ID;
                od.OrderID = id;
                od.Price = item.Product.GiaBan;
                od.Quantity = item.Quantity;
                detailsDao.Insert(od);
            }
            return Redirect("/hoan-thanh");
        }

    }
}