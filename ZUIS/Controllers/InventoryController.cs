using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using ZUIS.Common;
using ZUIS.Models;

namespace ZUIS.Controllers
{
    public class InventoryController : Controller
    {
        // GET: Inventory
        Entities con = new Entities();
        public ActionResult Inventory()
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
        public ActionResult InventoryWithSum(string VCode, string BCode)
        {
            con.Configuration.ProxyCreationEnabled = false;
            if (VCode == "0")
            {
                var r = (from q in con.V_InventoryWithSum
                         //orderby q.Manufacturer_Code, q.Brand_name
                         join m in con.Manufactures on q.Manufacturer_Code equals m.Manufacturer_Code
                         select new {
                             q.Manufacturer_Code,
                             q.Brand_name,
                             q.Stock_no,
                             q.Items_Available,
                             m.M_Name
                         }).ToList().OrderBy(x => x.Manufacturer_Code).ThenBy(x => x.Brand_name);

                return Json(r, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var r = (from q in con.V_InventoryWithSum
                         join m in con.Manufactures on q.Manufacturer_Code equals m.Manufacturer_Code
                         orderby q.Manufacturer_Code, q.Brand_name
                         where q.Manufacturer_Code == VCode
                         select new { 
                         q.Manufacturer_Code,
                         q.Brand_name,
                         q.Stock_no,
                         q.Items_Available,
                         m.M_Name
                         }).ToList();
                //string query = "SELECT I.Stock_no, I.Brand_name, "
                //                + " SUM(ISNULL(SrDet.Items_Available, 0)) AS Items_Available, I.Manufacturer_Code "
                //                + " FROM     dbo.Stock_ReceiptDET AS SrDet RIGHT OUTER JOIN "
                //                + " (SELECT Stock_no, Brand_name, Manufacturer_Code"
                //                + " FROM      dbo.Item_Stock WHERE (Item_Stock.Manufacturer_Code = '104')) AS I ON I.Stock_no = SrDet.Stock_no "
                //                + " GROUP BY I.Stock_no, I.Brand_name, I.Manufacturer_Code"; 

                //IEnumerable<V_InventoryWithSum> data = con.Database.SqlQuery<V_InventoryWithSum>(query);
                //var r = data.ToList();

                return Json(r, JsonRequestBehavior.AllowGet);
            }
           
        }
        
    }
}