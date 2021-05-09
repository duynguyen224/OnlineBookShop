using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace OnlineBookShop.Support_Class
{
    public class BookDetails
    {
        public int ID { get; set; }
        [DisplayName("Tên sách")]
        public string TenSach { get; set; }

        [DisplayName("Giá bán")]
        public int GiaBan { get; set; }

        [DisplayName("Ảnh bìa")]
        public string AnhBia { get; set; }
        [DisplayName("Số lượng tồn")]

        public int SoLuongTon { get; set; }
        [DisplayName("Tên TG")]

        public string HoTenTG { get; set; }
        [DisplayName("Tên CD")]

        public string TenCD { get; set; }
        [DisplayName("Tên NXB")]

        public string TenNXB { get; set; }
        [NotMapped]
        public HttpPostedFileBase ImageFile { get; set; }
    }
}