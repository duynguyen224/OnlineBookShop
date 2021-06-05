using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineBookShop.Entities;
using System.Data.SqlClient;
using OnlineBookShop.Support_Class;

namespace OnlineBookShop.DAO
{
    public class SlideDao
    {
        OnlineBookShopDbContext db = null;
        public SlideDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public List<Slide> listAll()
        {
            return db.Slides.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
        }
    }
}