using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZUIS.Common;
using ZUIS.Models;
using System.Data.Entity;

namespace ZUIS.Controllers
{
    public class MerckController : Controller
    {
        // GET: Merck
        Entities con = new Entities();
        public ActionResult Merck()
        {
            con.Configuration.ProxyCreationEnabled = false;

            string UserID = Session["UserID"] as string;
            string UserBranch = Session["Branch_No"] as string;
            string UserGroup = Session["UserGroup"] as string;

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                string actionName = this.ControllerContext.RouteData.Values["action"].ToString();
                string ControName = this.ControllerContext.RouteData.Values["controller"].ToString();

                bool authorize = AllCommon.CheckAuthorization(UserID, actionName, ControName);

                if (authorize == false)
                {
                    return RedirectToAction("Unauthorize", "Partial");
                }
                else
                {
                    List<string> MenuGroupList = new List<string>();

                    var count = (from menu_count in con.Menu_User
                                 orderby menu_count.DisplayOrder ascending
                                 where menu_count.user_id.Equals(UserID)
                                 select new { menu_count.Menu_Group, menu_count.DisplayOrder }).Distinct().ToList();

                    for (int i = 0; i < count.Count(); i++)
                    {
                        MenuGroupList.Add((count[i].Menu_Group));
                    }

                    ViewBag.MenuGroupCount = MenuGroupList;

                    VM vm = new VM();
                    var menu = con.Menu_User.Include(x => x.Menu);
                    vm.Menus = menu;

                    return View(vm);
                }
            }
        }
        public ActionResult Merck1()
        {
            con.Configuration.ProxyCreationEnabled = false;

            string UserID = Session["UserID"] as string;
            string UserBranch = Session["Branch_No"] as string;
            string UserGroup = Session["UserGroup"] as string;

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                string actionName = this.ControllerContext.RouteData.Values["action"].ToString();
                string ControName = this.ControllerContext.RouteData.Values["controller"].ToString();

                bool authorize = AllCommon.CheckAuthorization(UserID, actionName, ControName);

                if (authorize == false)
                {
                    return RedirectToAction("Unauthorize", "Partial");
                }
                else
                {
                    List<string> MenuGroupList = new List<string>();

                    var count = (from menu_count in con.Menu_User
                                 orderby menu_count.DisplayOrder ascending
                                 where menu_count.user_id.Equals(UserID)
                                 select new { menu_count.Menu_Group, menu_count.DisplayOrder }).Distinct().ToList();

                    for (int i = 0; i < count.Count(); i++)
                    {
                        MenuGroupList.Add((count[i].Menu_Group));
                    }

                    ViewBag.MenuGroupCount = MenuGroupList;

                    VM vm = new VM();
                    var menu = con.Menu_User.Include(x => x.Menu);
                    vm.Menus = menu;

                    return View(vm);
                }
            }
        }
        public ActionResult Example()
        {
            return View();
        }
        public ActionResult MyProperty1(string Vendor)
        {
            var r = (from q in con.V_MerckRPT
                     where q.Manufacturer_Code == Vendor && q.GroupNo != null
                     select new {
                         q.Stock_no,
                         q.Brand_name,
                         q.Units_PerItem,
                         q.Trade_PriceItem,
                         q.GroupNo,
                         q.Items_Received,
                         q.Items_Available,
                         //SQty = q.SQty,
                         SQty = (q.SQty == null ? 0 : q.SQty),
                         Total = (q.Trade_PriceItem * q.Items_Received) == null ? 0 : (q.Trade_PriceItem * q.Items_Received),
                         NetSales = (q.Trade_PriceItem * q.SQty) == null ? 0 : (q.Trade_PriceItem * q.SQty),
                         subTotal = (q.Trade_PriceItem * q.SQty) == null ? 0 :  (q.Trade_PriceItem * q.SQty) +  (q.Trade_PriceItem * q.SQty) == null ? 0 : (q.Trade_PriceItem * q.SQty)                 
                     }).OrderBy(x => x.GroupNo).ThenBy(x => x.Brand_name).ToList();
            decimal NetSales = 0;
            decimal subTotal = 0;
            for (int i = 0; i < r.Count; i++)
            {
                NetSales =NetSales + (decimal)r[i].NetSales;
            }
            subTotal = NetSales;
            var finalList = new { data = r, subTotal = subTotal };
            return Json(finalList);
            //return Json(new {  }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult MyProperty()
        {
            con.Configuration.ProxyCreationEnabled = false;
            //SqlConnection conn = new SqlConnection(@"Data Source=Server\SQL;Initial Catalog=ZUIS;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            //SqlCommand cmd = new SqlCommand("SELECT Item_Stock.Stock_no, Item_Stock.Brand_name, Item_Stock.Units_PerItem, Item_Stock.Trade_PriceItem, Item_Stock.GroupNo, Stock_ReceiptDET.Items_Available "
            //+ " FROM     Item_Stock INNER JOIN "
            //+ "                   Stock_ReceiptDET ON Item_Stock.Stock_no = Stock_ReceiptDET.Stock_no "
            //+ " ORDER BY Item_Stock.GroupNo", conn);

            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //da.Fill(dt);

            //List<float> TotalWeightage = new List<float>();
            //List<COURSE_EVALMARKS> listHeader = new List<COURSE_EVALMARKS>();
            //List<STU_EVALMARKS> lisStuEvalMarks = new List<STU_EVALMARKS>();
            //List<int> lisCLO = new List<int>();
            //List<int> listCourseIds = new List<int>();
            List<Item_Stock> ItemStock = new List<Item_Stock>();
            List<Stock_ReceiptDET> StockReceiptDET = new List<Stock_ReceiptDET>();
            //List<int> listMax = new List<int>();
            //List<int> listMin = new List<int>();
            //List<double> listStdDev = new List<double>();
            //List<decimal> listAvg = new List<decimal>();
            List<string> listGroupNo = new List<string>();
            List<decimal> SubTotal = new List<decimal>();

            //var r = (from q in con.Item_Stock
            //         join sr in con.Stock_ReceiptDET on q.Stock_no equals sr.Stock_no
            //         into sr
            //         join s in con.Sale_InvDET on q.Stock_no equals s.Stock_no
            //         into s
            //         where q.Manufacturer_Code =="104"
            //         select new { 
            //             q.Stock_no,
            //             q.Brand_name,
            //             q.Units_PerItem,
            //             q.Trade_PriceItem,
            //             q.GroupNo
            //         }).OrderBy(x => x.GroupNo).ThenBy(x=>x.Brand_name).ToList();
            var r = (from q in con.Item_Stock
                     join sr in con.Stock_ReceiptDET on q.Stock_no equals sr.Stock_no
                     into srDET
                     from emplo in srDET.DefaultIfEmpty()
                     join s in con.Sale_InvDET on q.Stock_no equals s.Stock_no
                     into ss
                     from inv in ss.DefaultIfEmpty()
                     where q.Manufacturer_Code == "104" && q.GroupNo!=null
                     select new
                     {
                         q.Stock_no,
                         q.Brand_name,
                         q.Units_PerItem,
                         q.Trade_PriceItem,
                         q.GroupNo,
                         Items_Received = (emplo.Items_Received == null ? 0 : emplo.Items_Received),
                         Items_Available = (emplo.Items_Available == null ? 0 : emplo.Items_Available),
                         inv.Batch_NO,
                         SQty = (inv.SQty == null ? 0 : inv.SQty),
                         Total = ((q.Trade_PriceItem * emplo.Items_Received) == null ? 0 : (q.Trade_PriceItem * emplo.Items_Received)),
                         NetSales = ((q.Trade_PriceItem * inv.SQty) == null ? 0 : (q.Trade_PriceItem * inv.SQty)),
                         subTotal = ((q.Trade_PriceItem * inv.SQty) == null ? 0 : (q.Trade_PriceItem * inv.SQty)) + ((q.Trade_PriceItem * inv.SQty) == null ? 0 : (q.Trade_PriceItem * inv.SQty))
                     }).OrderBy(x => x.GroupNo).ThenBy(x => x.Brand_name).ToList();
            int asif = 0;
            var TotalGroup = (from q in con.Item_Stock
                              where q.GroupNo != null
                              select new { q.GroupNo }).Distinct().OrderBy(x => x.GroupNo).ToList();

            //var Localcount = 0;

            for (var i = 0; i < TotalGroup.Count; i++) // Main Loop that Count eg.As,Qz
            {
                decimal total = 0;
                listGroupNo.Add(TotalGroup[i].GroupNo); // CH A

                var groupNo = TotalGroup[i].GroupNo;
                var Registered_Studentents = (from q in con.Item_Stock
                                              join sr in con.Stock_ReceiptDET on q.Stock_no equals sr.Stock_no
                                              into srDET
                                              from emplo in srDET.DefaultIfEmpty()
                                              join s in con.Sale_InvDET on q.Stock_no equals s.Stock_no
                                              into ss
                                              from inv in ss.DefaultIfEmpty()
                                              where q.Manufacturer_Code == "104" && q.GroupNo == groupNo
                                              select new
                                              {
                                                  q.Stock_no,
                                                  q.Brand_name,
                                                  q.Units_PerItem,
                                                  q.Trade_PriceItem,
                                                  q.GroupNo,
                                                  Items_Received = (emplo.Items_Received == null ? 0 : emplo.Items_Available),
                                                  Items_Available = (emplo.Items_Available == null ? 0 : emplo.Items_Available),
                                                  inv.Batch_NO,
                                                  SQty = (inv.SQty == null ? 0 : inv.SQty),
                                                  Total = ((q.Trade_PriceItem * emplo.Items_Received) == null ? 0 : (q.Trade_PriceItem * emplo.Items_Received)),
                                                  NetSales = ((q.Trade_PriceItem * inv.SQty) == null ? 0 : (q.Trade_PriceItem * inv.SQty)),
                                                  subTotal = ((q.Trade_PriceItem * inv.SQty) == null ? 0 : (q.Trade_PriceItem * inv.SQty)) + ((q.Trade_PriceItem * inv.SQty) == null ? 0 : (q.Trade_PriceItem * inv.SQty))
                                              }).OrderBy(x => x.GroupNo).ThenBy(x => x.Brand_name).ToList();
                for (int k = 0; k < Registered_Studentents.Count; k++)
                {
                    total = total + (decimal)Registered_Studentents[k].NetSales;

                    //Item_Stock obj = new Item_Stock();
                    //obj.Stock_no = Registered_Studentents[k].Stock_no;
                    //obj.Brand_name = Registered_Studentents[k].Brand_name;
                    //obj.Units_PerItem = Registered_Studentents[k].Units_PerItem;
                    //obj.Trade_PriceItem = Registered_Studentents[k].Trade_PriceItem;
                    //obj.GroupNo = Registered_Studentents[k].GroupNo;
                    //ItemStock.Add(obj);
                }
                SubTotal.Add(total);
            }

            var finalList = new { listGroupNo = listGroupNo, ItemStock = ItemStock, r = r, SubTotal = SubTotal };
            return Json(finalList);
            //var info = (from q in con.Item_Stock
            //           orderby q.GroupNo ascending
            //           where q.GroupNo != null
            //           select new { 
            //           q.Stock_no,
            //           q.Brand_name,
            //           q.Units_PerItem,
            //           q.Trade_PriceItem,
            //           q.GroupNo
            //           }).ToList();
            //var group = (from q in con.Item_Stock
            //             orderby q.GroupNo ascending
            //             where q.GroupNo !=null
            //             select q.GroupNo).Distinct().ToList();

            //return Json(new { success = true,info, group = group }, JsonRequestBehavior.AllowGet);

            //return Json(r,JsonRequestBehavior.AllowGet);
        }
    }
}