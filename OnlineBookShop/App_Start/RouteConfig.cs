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

            // tin tức
            routes.MapRoute(
                name: "News",
                url: "tin-tuc/{action}/{id}",
                defaults: new { controller = "News", action = "Index", id = UrlParameter.Optional },
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
