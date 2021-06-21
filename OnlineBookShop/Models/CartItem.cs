using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using OnlineBookShop.Entities;

namespace OnlineBookShop.Models
{
    [Serializable]
    public class CartItem
    {
        
        public Sach Product { get; set; }
        public int Quantity { get; set; }
    }
}