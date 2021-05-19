namespace OnlineBookShop.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TacGia")]
    public partial class TacGia
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TacGia()
        {
            ThamGias = new HashSet<ThamGia>();
        }

        public int ID { get; set; }

        [StringLength(50)]
        [DisplayName("Họ tên tác giả")]
        public string HoTenTG { get; set; }

        [StringLength(50)]
        [DisplayName("Địa chỉ")]

        public string DiaChi { get; set; }

        [StringLength(50)]
        [DisplayName("Tiểu sử")]

        public string TieuSu { get; set; }

        [StringLength(50)]
        [DisplayName("Điện thoại")]

        public string DienThoai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ThamGia> ThamGias { get; set; }
    }
}
