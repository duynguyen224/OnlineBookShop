namespace OnlineBookShop.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("TinTuc")]
    public partial class TinTuc
    {
        public int ID { get; set; }

        [StringLength(500)]
        [DisplayName("Tiêu đề")]
        public string Name { get; set; }

        [StringLength(500)]
        public string Descriptions { get; set; }

        [StringLength(300)]
        [DisplayName("Ảnh bìa")]

        public string Image { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        [Column(TypeName = "ntext")]
        [DisplayName("Bài viết chi tiết")]

        public string Detail { get; set; }

        [StringLength(250)]
        public string MetaDescriptions { get; set; }

        public bool? Status { get; set; }

        public int? ViewCount { get; set; }

        [NotMapped]
        public HttpPostedFileBase ImageFile { get; set; }
    }
}
