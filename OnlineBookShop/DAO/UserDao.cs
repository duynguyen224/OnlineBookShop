using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using OnlineBookShop.Entities;

namespace OnlineBookShop.DAO
{
    public class UserDao
    {
        OnlineBookShopDbContext db = null;
        public UserDao()
        {
            db = new OnlineBookShopDbContext();
        }

        public int correctLogin(string username, string password)
        {
            var u = db.Users.Where(x => x.Username == username && x.Password == password).FirstOrDefault();
            if(u != null)
            {
                return u.ID;
            }
            else
            {
                return 0;
            }
        }
        
    }
}