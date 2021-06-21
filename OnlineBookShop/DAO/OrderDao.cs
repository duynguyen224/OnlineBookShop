using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using OnlineBookShop.Entities;
using System.Data.SqlClient;
using OnlineBookShop.Support_Class;
using PagedList;
using System.IO;


namespace OnlineBookShop.DAO
{
    public class OrderDao
    {
        OnlineBookShopDbContext db = null;
        public OrderDao()
        {
            db = new OnlineBookShopDbContext();
        }


        public IEnumerable<Order> listAll(string searchString, int page, int pageSize)
        {
            var res = db.Orders.OrderByDescending(x=>x.CreatedDate).ThenBy(x=>x.Status == false).ToList();
            if (!string.IsNullOrEmpty(searchString))
            {
                res = res.Where(x => x.ShipName.ToLower().Trim().Contains(searchString.ToLower().Trim())).ToList();
            }
            return res.ToPagedList(page, pageSize);
        }
        public int Insert(Order o)
        {
            o.Status = false;
            db.Orders.Add(o);
            db.SaveChanges();
            return o.ID;
        }

        public void ConfirmOrder(int id)
        {
            var res = db.Orders.Find(id);
            res.Status = true;
            db.SaveChanges();
        }

        public void DeleteOrder(int id)
        {
            var res = db.Orders.Find(id);
            db.Orders.Remove(res);
            OrderDetailDao dao = new OrderDetailDao();
            dao.Delete(id);
            db.SaveChanges();
        }

    }
}