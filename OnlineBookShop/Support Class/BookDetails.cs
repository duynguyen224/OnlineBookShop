using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineBookShop.Support_Class
{
    public class BookDetails
    {
        public int ID { get; set; }

        [DisplayName("Tên sách")]
        [Required(ErrorMessage = "Hãy nhập tên sách")]
        public string TenSach { get; set; }

        [DisplayName("Giá bán")]
        [Required(ErrorMessage = "Hãy nhập giá bán")]
        [Range(0, int.MaxValue, ErrorMessage = "Giá bán âm làm sao được?")]
        public int GiaBan { get; set; }

        [DisplayName("Ảnh bìa")]
        public string AnhBia { get; set; }

        [DisplayName("Số lượng tồn")]
        [Required(ErrorMessage = "Hãy nhập số lượng tồn")]
        [Range(0, int.MaxValue, ErrorMessage = "Số lượng tồn âm làm sao được?")]
        public int SoLuongTon { get; set; }

        [DisplayName("Tên TG")]
        [Required(ErrorMessage = "Hãy nhập tên tác giả")]
        public string HoTenTG { get; set; }

        [DisplayName("Tên CD")]
        [Required(ErrorMessage = "Hãy nhập tên chủ đề")]

        public string TenCD { get; set; }

        [DisplayName("Tên NXB")]
        [Required(ErrorMessage = "Hãy nhập tên nhà xuất bản")]

        public string TenNXB { get; set; }

        [DisplayName("Bìa sau")]

        public string BiaSau { get; set; }

        [DisplayName("Mô tả")]
        public string MoTa { get; set; }

        [DisplayName("Mô tả chi tiết")]
        public string Detail { get; set; }

        [NotMapped]
        public HttpPostedFileBase ImageFile { get; set; }
        [NotMapped]
        public HttpPostedFileBase ImageFile1 { get; set; }



    }
}