using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace OnlineBookShop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            // giới thiệu
            routes.MapRoute(
                name: "About",
                url: "gioi-thieu/{action}/{id}",
                defaults: new { controller = "About", action = "Index", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // chi tiết tin tức
            routes.MapRoute(
                name: "News detail",
                url: "chi-tiet-tin-tuc/{metatitle}-{id}",
                defaults: new { controller = "News", action = "Detail", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // tin tức
            routes.MapRoute(
                name: "News",
                url: "tin-tuc/{action}/{id}",
                defaults: new { controller = "News", action = "Index", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // hoàn thành
            routes.MapRoute(
                name: "finish",
                url: "hoan-thanh/{action}/{id}",
                defaults: new { controller = "Finish", action = "Index", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // tìm kiếm
            routes.MapRoute(
                name: "Search",
                url: "tim-kiem/{action}/{id}",
                defaults: new { controller = "Product", action = "ProductSearch", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // sản phẩm
            routes.MapRoute(
                name: "Product",
                url: "san-pham/{action}/{id}",
                defaults: new { controller = "Product", action = "Category", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // chi tiết sản phẩm từng chủ đề
            routes.MapRoute(
                name: "ProductCategory Detail",
                url: "chu-de/{metatitle}-{id}",
                defaults: new { controller = "Product", action = "Category", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // chi tiết một sản phẩm nào đó
            routes.MapRoute(
                name: "Product Detail",
                url: "chi-tiet/{metatitle}-{id}",
                defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // liên hệ
            routes.MapRoute(
                name: "Contact",
                url: "lien-he/{action}/{id}",
                defaults: new { controller = "Contact", action = "Index", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // thêm vào giỏ hàng
            routes.MapRoute(
                name: "Add to cart",
                url: "gio-hang",
                defaults: new { controller = "Cart", action = "AddItem", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // giỏ hàng
            routes.MapRoute(
                name: "Cart",
                url: "xem-gio-hang",
                defaults: new { controller = "Cart", action = "Index", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );


            // thanh toán
            routes.MapRoute(
                name: "Payment",
                url: "thanh-toan",
                defaults: new { controller = "Cart", action = "Payment", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );

            // đăng nhập
            routes.MapRoute(
                name: "Login",
                url: "dang-nhap/{action}/{id}",
                defaults: new { controller = "User", action = "Login", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );




            // default
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { "OnlineBookShop.Controllers" }
            );
        }
    }
}
