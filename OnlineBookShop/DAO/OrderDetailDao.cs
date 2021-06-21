using OnlineBookShop.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using OnlineBookShop.Support_Class;
using PagedList;
using System.IO;

namespace OnlineBookShop.DAO
{
    public class OrderDetailDao
    {
        OnlineBookShopDbContext db = null;
        public OrderDetailDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public int Insert(OrderDetail od)
        {
            db.OrderDetails.Add(od);
            db.SaveChanges();
            return od.OrderID;
        }

        public void Delete(int idOrder)
        {
            var res = db.OrderDetails.Where(x => x.OrderID == idOrder).FirstOrDefault();
            db.OrderDetails.Remove(res);
            db.SaveChanges();
        }

        public IEnumerable<OrderDetail> OrderDetailsCustomer(int id, int page, int pageSize)
        {
            var res = db.OrderDetails.Where(x => x.OrderID == id).ToList();
            return res.ToPagedList(page, pageSize);
        }


    }
}