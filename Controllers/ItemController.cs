using Model2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace dbAspNET.Controllers
{
    public class ItemController : Controller
    {
        // GET: Item
        public ActionResult Index()
        {
            return View(new productsModel().getProductList());
        }
        public ActionResult Details()
        {
            return View();
        }
        public ActionResult Create()
        {
            return View();
        }
    }
}