using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZUIS.Models;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using ZUIS.Common;

namespace ZUIS.Controllers
{
    public class StockController : Controller
    {
        // GET: Stock
        Entities con = new Entities();
        List<DataRow> lst = new List<DataRow>();
        List<string> lstArr = new List<string>();
        
        private static string GetConStr
        {
            get
            {
                string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["ZUIS.Properties.Settings.Setting"].ConnectionString;
                return strConnection;
            }
        }
        SqlConnection conn = new SqlConnection(GetConStr);

        #region Stock

        public ActionResult Stock()
        {
            con.Configuration.ProxyCreationEnabled = false;

            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

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

                    GetAllManufacture();
                    var StockNo = con.Item_Stock.Select(x => x.Stock_no).Max();
                    int id = 0;
                    id = Convert.ToInt32(StockNo);
                    id++;
                    ViewBag.StockNO = id;

                    return View(vm);
                }
            }
        }
        public ActionResult GetAllStockInTable()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var r = (from q in con.Item_Stock
                     select new
                     {
                         q.Stock_no,
                         q.Manufacture.M_Name,
                         q.Brand_name,
                         q.Generic_name,
                         q.Item_Type,
                         q.Weight_Unit,
                         q.Item_Desc,
                         q.BARCODE,
                         q.Units_PerItem,
                         q.Current_Price,
                         q.Available_status,
                         q.GroupNo,
                         q.RefStock_no,
                         q.Record_date,
                         q.Item_Discount,
                         q.Trade_PriceItem,
                         q.Discount,
                         q.PPrice,
                         q.User_id
                     }).ToList();
            var jsonResult = Json(r, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult GetStockById(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var viewData = (from q in con.Item_Stock
                            where q.Stock_no == id
                            select q).ToList();
            return Json(viewData);
        }
        public ActionResult DeleteStock(string code)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string UserID = Session["UserID"] as string;

            UserID = "123";
            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                var viewData = (from q in con.Item_Stock
                                where q.Stock_no == code
                                select q).FirstOrDefault();

                try
                {
                    con.Entry(viewData).State = EntityState.Deleted;
                    con.SaveChanges();
                    message = "Stock is Deleted Successfully";
                    var StockNo = con.Item_Stock.Select(x => x.Stock_no).Max();
                    int id = 0;
                    id = Convert.ToInt32(StockNo);
                    id++;
                    return Json(new { success = true, message = message, id = id }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult UpdateStock(Item_Stock model)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string UserID = Session["UserID"] as string;

            UserID = "123";
            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                var viewData = (from q in con.Item_Stock
                                where q.Stock_no == model.Stock_no
                                select q).FirstOrDefault();

                try
                {
                    var mName = con.Manufactures.Where(x => x.Manufacturer_Code == model.Manufacturer_Code).ToList();

                    viewData.Brand_name = model.Brand_name;
                    viewData.Generic_name = model.Generic_name;
                    viewData.Item_Type = model.Item_Type;
                    viewData.Weight_Unit = model.Weight_Unit;
                    viewData.Manufacturer_Code = model.Manufacturer_Code;
                    viewData.Trade_PriceItem = model.Trade_PriceItem;
                    viewData.Item_Discount = model.Item_Discount;
                    viewData.BARCODE = model.BARCODE;
                    viewData.Units_PerItem = model.Units_PerItem;
                    viewData.Current_Price = model.Current_Price;
                    viewData.Discount = model.Discount;
                    viewData.PPrice = model.PPrice;
                    viewData.BARCODE = model.BARCODE;
                    viewData.Available_status = model.Available_status;
                    viewData.GroupNo = model.GroupNo;
                    viewData.RefStock_no = model.RefStock_no;
                    viewData.Record_date = DateTime.Now;
                    viewData.User_id = UserID;


                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();
                    message = "Stock is Updated Successfully";

                    var StockNo = con.Item_Stock.Select(x => x.Stock_no).Max();
                    int id = 0;
                    id = Convert.ToInt32(StockNo);
                    id++;

                    return Json(new { success = true, message = message, id = id, mName = mName[0].M_Name }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult SaveStock(Item_Stock model)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string UserID = Session["UserID"] as string;

            UserID = "123";
            if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                var viewData = (from q in con.Item_Stock
                                where q.Stock_no == model.Stock_no
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        var mName = con.Manufactures.Where(x => x.Manufacturer_Code == model.Manufacturer_Code).ToList();

                        con.Item_Stock.Add(model);
                        con.SaveChanges();
                        var StockNo = con.Item_Stock.Select(x => x.Stock_no).Max();
                        int id = 0;
                        id = Convert.ToInt32(StockNo);
                        id++;
                        ViewBag.StockNO = id;

                        message = "Stock is Added Successfully";
                        return Json(new { success = true, message = message, id = id, mName = mName[0].M_Name }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Stock is already Added with this Code" }, JsonRequestBehavior.AllowGet);
                }

            }
        }
        public void GetAllManufacture()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = con.Manufactures.ToList();
            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLManufacture = viewData.Select(x => new SelectListItem
                {
                    Value = x.Manufacturer_Code.ToString(),
                    Text = x.Manufacturer_Code + " : " + x.M_Name.ToString()
                }).ToList();
            }
            else
            {
                var data = ViewBag.DDLManufacture = viewData.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found"
                }).ToList();
            }
        }
        #endregion

        #region MyRegion
        public ActionResult SReports()
        {
            con.Configuration.ProxyCreationEnabled = false;

            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

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

                    GetAllVendor();
                    
                    return View(vm);
                }
            }
        }

        public void GetAllVendor()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = con.Vendors.ToList();
            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLVendor = viewData.Select(x => new SelectListItem
                {
                    Value = x.vendor_code.ToString(),
                    Text = x.vendor_code + " : " + x.Name.ToString()
                }).ToList();
            }
            else
            {
                var data = ViewBag.DDLVendor = viewData.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found"
                }).ToList();
            }
        }

        public ActionResult getStock(DateTime receivedDate, DateTime receivedDate1, string VCode, string BCode)
        {
            con.Configuration.ProxyCreationEnabled = false;
            if (VCode == "0")
            {
                string query = "SELECT I.Stock_no, I.Brand_name, ISNULL(SrDet.Batch_NO, 0) AS Batch_NO, ISNULL(SrDet.Items_Available, 0) AS Items_Available, Branch.DSTB_NO AS DSTB_NO, Branch.Branch_Code "
+ " FROM     Stock_ReceiptDET AS SrDet RIGHT OUTER JOIN "
+ "                       (SELECT Supp_Invno "
+ "                        FROM      Stock_Receipt "
+ "                        WHERE   (Received_date BETWEEN '" + receivedDate + "' and '" + receivedDate1 + "')) AS Sr ON Sr.Supp_Invno = SrDet.Supp_Invno RIGHT OUTER JOIN "
+ "                       (SELECT Stock_no, Brand_name "
+ "                        FROM      Item_Stock ) AS I ON I.Stock_no = SrDet.Stock_no CROSS JOIN "
+ "                   Branch WHERE  (Branch.DSTB_NO = '" + BCode + "')";

                IEnumerable<V_StockInventory> data = con.Database.SqlQuery<V_StockInventory>(query);
                var r = data.ToList();

                return Json(r, JsonRequestBehavior.AllowGet);

                //var r = (from b in con.Branches
                //         from q in con.Item_Stock
                //         join srDET in con.Stock_ReceiptDET on q.Stock_no equals srDET.Stock_no
                //         into srDetails
                //         from emplo in srDetails.DefaultIfEmpty()
                //         join sr in con.Stock_Receipt on emplo.Supp_Invno equals sr.Supp_Invno
                //         where b.DSTB_NO == BCode && sr.Received_date >= receivedDate && sr.Received_date <= receivedDate1 
                //         select new
                //         {
                //            b.DSTB_NO,
                //            q.AltStock_No,
                //            q.Stock_no,
                //            q.Brand_name,
                //            q.Manufacturer_Code,
                //            emplo.Batch_NO,
                //            emplo.Items_Available,
                //         }).OrderBy(x => x.Brand_name).ToList();
                
                //return Json("", JsonRequestBehavior.AllowGet);
            }
            else
            {
                //string query = "SELECT I.Stock_no,I.Brand_name, "
                //                + " 	   Items_Available = SUM(isnull(SrDet.Items_Available,0)) "
                //                + " FROM   Stock_ReceiptDET SrDet "
                //                + "        RIGHT OUTER JOIN (SELECT Supp_Invno "
                //                + "                         FROM   Stock_Receipt  "
                //                + "                         WHERE  Received_date between '" + receivedDate + "' and '" + receivedDate1 + "') Sr "
                //                + "                     ON Sr.Supp_Invno = SrDet.Supp_Invno "
                //                + "        RIGHT OUTER JOIN (SELECT Stock_no, Brand_name "
                //                + "                         FROM   Item_Stock where Manufacturer_Code='"+VCode+"') I "
                //                + "                     ON I.Stock_no = SrDet.Stock_no  "
                //                + " 				group by I.Stock_no,I.Brand_name";
                string query = "SELECT I.Stock_no,I.AltStock_No, I.Brand_name, ISNULL(SrDet.Batch_NO, 0) AS Batch_NO, ISNULL(SrDet.Items_Available, 0) AS Items_Available, Branch.DSTB_NO AS DSTB_NO, Branch.Branch_Code "
+ " FROM     Stock_ReceiptDET AS SrDet RIGHT OUTER JOIN "
+ "                       (SELECT Supp_Invno "
+ "                        FROM      Stock_Receipt "
+ "                        WHERE   (Received_date BETWEEN '" + receivedDate + "' and '" + receivedDate1 + "')) AS Sr ON Sr.Supp_Invno = SrDet.Supp_Invno RIGHT OUTER JOIN "
+ "                       (SELECT Stock_no, Brand_name, AltStock_No "
+ "                        FROM      Item_Stock "
+ "                        WHERE   (Manufacturer_Code ='" + VCode + "')) AS I ON I.Stock_no = SrDet.Stock_no CROSS JOIN "
+ "                   Branch WHERE  (Branch.DSTB_NO = '" + BCode + "')";

                IEnumerable<V_StockInventory> data = con.Database.SqlQuery<V_StockInventory>(query);
                var r = data.ToList();

                return Json(r, JsonRequestBehavior.AllowGet);

                //var r = (from I in con.Item_Stock
                //         where I.Manufacturer_Code == VCode
                //         join M in con.Stock_ReceiptDET
                //             on I.Stock_no equals M.Stock_no into rJoin
                //         from rj in rJoin.DefaultIfEmpty()
                //         join sr in
                //             (from sr in con.Stock_Receipt
                //              where sr.Received_date >= receivedDate && sr.Received_date <= receivedDate1
                //              select new { sr.Supp_Invno })
                //              on rj.Supp_Invno equals sr.Supp_Invno
                //         into sd
                //         from a in sd.DefaultIfEmpty()
                //         select new
                //         {
                //             I.Stock_no,
                //             I.AltStock_No,
                //             I.Brand_name,
                //             rj.Items_Available,
                //             rj.Batch_NO
                //         }

                //        ).GroupBy(n => new { n.Stock_no, n.Brand_name })
                //        .Select(g => new
                //        {
                //            g.Key.Stock_no,
                //            g.Key.Brand_name,
                //            //DSTB_NO = g.Select(x => x.DSTB_NO),
                //            Batch_NO = g.Select(x => x.Batch_NO),
                //            Items_Available = g.Sum(c => c.Items_Available) ,
                //            //Items_Available = (g.Sum(c => c.Items_Available) == null ? 0 : g.Sum(c => c.Items_Available)),
                //        }).ToList();

                //return Json(r, JsonRequestBehavior.AllowGet);
                
                
                //var r = (from b in con.Branches
                //         from q in con.Item_Stock
                //         join srDET in con.Stock_ReceiptDET on q.Stock_no equals srDET.Stock_no
                //         into srDetails
                //         from emplo in srDetails.DefaultIfEmpty()
                //         join sr in con.Stock_Receipt on emplo.Supp_Invno equals sr.Supp_Invno
                //         where b.DSTB_NO == BCode && q.Manufacturer_Code == VCode && sr.Received_date >= receivedDate && sr.Received_date <= receivedDate1
                //         select new
                //         {
                //             b.DSTB_NO,
                //             q.AltStock_No,
                //             q.Stock_no,
                //             q.Brand_name,
                //             q.Manufacturer_Code,
                //             emplo.Batch_NO,
                //             emplo.Items_Available,
                //         }).OrderBy(x => x.Brand_name).ToList();
                //return Json("", JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult DownloadStock(DateTime receivedDate, DateTime receivedDate1, int VCode, string BCode)
        {
            if (VCode == 0)
            {
                var info = (from b in con.Branches
                            from q in con.Item_Stock
                            join srDET in con.Stock_ReceiptDET on q.Stock_no equals srDET.Stock_no
                            into srDetails
                            from emplo in srDetails.DefaultIfEmpty()
                            join sr in con.Stock_Receipt on emplo.Supp_Invno equals sr.Supp_Invno
                            where b.DSTB_NO == BCode && sr.Received_date >= receivedDate && sr.Received_date <= receivedDate1
                            select new
                            {
                                b.DSTB_NO,
                                q.AltStock_No,
                                q.Stock_no,
                                q.Brand_name,
                                q.Manufacturer_Code,
                                emplo.Batch_NO,
                                emplo.Items_Available,
                            }).OrderBy(x => x.Brand_name).ToList();

                var CLDATE = DateTime.Now;
                var fullDate = CLDATE.ToString("dd-MM-yyyy");
                //var day = CLDATE.Day;
                //var mont = CLDATE.Month;
                //var year = CLDATE.Year;
                //var fullDate = day + "-" + mont + "-" + year;

                // var aa = (from ss in con.Customers select ss).ToList();
                MemoryStream ms = new MemoryStream();
                //TextWriter sw = new StreamWriter(@"E:\\file11.txt");
                TextWriter sw = new StreamWriter(ms);
                sw.WriteLine(string.Format("{0,-7} {1,-15} {2,-8} {3,-19} {4,-8} {5,-9} {6,-9} {7,-9} {8}", "DSTBID", "CLDATE", "PRODID", "PRD", "BATCHNO", "CLBALANCE", "INTRANSIT", "SHORTAGE", "EXPIRED"));
                sw.WriteLine(string.Format("\n"));
                for (int i = 0; i < info.Count; i++)
                {
                    int length = info[i].Brand_name.Length;
                    string Brand = "";
                    if (length > 20)
                    {
                        Brand = info[i].Brand_name.Substring(0, 20);
                    }
                    else
                    {
                        Brand = info[i].Brand_name;
                    }
                    sw.WriteLine(string.Format("{0,-7} {1,-15} {2,-8} {3,-20} {4,-8} {5,4} {6,8} {7,11} {8,6}", info[i].DSTB_NO, fullDate, info[i].AltStock_No, Brand, info[i].Batch_NO, info[i].Items_Available, "0", "0", "0"));
                }
                sw.Close();     //Don't Forget Close the TextWriter Object(sw)
                byte[] bytes = ms.ToArray();

                Response.Clear();
                Response.ContentType = "application/force-download";
                Response.AddHeader("content-disposition", "attachment;  filename=" + BCode + "Stock.txt");
                Response.BinaryWrite(bytes);
                Response.End();
            }
            else
            {
                string VC = VCode.ToString();
                //var info = (from b in con.Branches
                //            from q in con.Item_Stock
                //            join srDET in con.Stock_ReceiptDET on q.Stock_no equals srDET.Stock_no
                //            into srDetails
                //            from emplo in srDetails.DefaultIfEmpty()
                //            join sr in con.Stock_Receipt on emplo.Supp_Invno equals sr.Supp_Invno
                //            where b.DSTB_NO == BCode && q.Manufacturer_Code == VC && sr.Received_date >= receivedDate && sr.Received_date <= receivedDate1
                //            select new
                //            {
                //                b.DSTB_NO,
                //                q.AltStock_No,
                //                q.Stock_no,
                //                q.Brand_name,
                //                q.Manufacturer_Code,
                //                emplo.Batch_NO,
                //                emplo.Items_Available,
                //            }).OrderBy(x => x.Brand_name).ToList();
                string query = "SELECT I.Stock_no,I.AltStock_No, I.Brand_name, ISNULL(SrDet.Batch_NO, 0) AS Batch_NO, ISNULL(SrDet.Items_Available, 0) AS Items_Available, Branch.DSTB_NO AS DSTB_NO, Branch.Branch_Code "
+ " FROM     Stock_ReceiptDET AS SrDet RIGHT OUTER JOIN "
+ "                       (SELECT Supp_Invno "
+ "                        FROM      Stock_Receipt "
+ "                        WHERE   (Received_date BETWEEN '" + receivedDate + "' and '" + receivedDate1 + "')) AS Sr ON Sr.Supp_Invno = SrDet.Supp_Invno RIGHT OUTER JOIN "
+ "                       (SELECT Stock_no, Brand_name, AltStock_No "
+ "                        FROM      Item_Stock "
+ "                        WHERE   (Manufacturer_Code ='" + VCode + "')) AS I ON I.Stock_no = SrDet.Stock_no CROSS JOIN "
+ "                   Branch WHERE  (Branch.DSTB_NO = '" + BCode + "')";

                IEnumerable<V_StockInventory> data = con.Database.SqlQuery<V_StockInventory>(query);
                var info = data.ToList();

                var CLDATE = DateTime.Now;
                var fullDate = CLDATE.ToString("dd-MM-yyyy");
                //var day = CLDATE.Day;
                //var mont = CLDATE.Month;
                //var year = CLDATE.Year;
                //var fullDate = day + "-" + mont + "-" + year;

                // var aa = (from ss in con.Customers select ss).ToList();
                MemoryStream ms = new MemoryStream();
                //TextWriter sw = new StreamWriter(@"E:\\file11.txt");
                TextWriter sw = new StreamWriter(ms);
                sw.WriteLine(string.Format("{0,-7} {1,-15} {2,-8} {3,-19} {4,-8} {5,-9} {6,-9} {7,-9} {8}", "DSTBID", "CLDATE", "PRODID", "PRD", "BATCHNO", "CLBALANCE", "INTRANSIT", "SHORTAGE", "EXPIRED"));
                sw.WriteLine(string.Format("\n"));
                for (int i = 0; i < info.Count; i++)
                {
                    int length = info[i].Brand_name.Length;
                    string Brand = "";
                    if (length > 20)
                    {
                        Brand = info[i].Brand_name.Substring(0, 20);
                    }
                    else
                    {
                        Brand = info[i].Brand_name;
                    }
                    sw.WriteLine(string.Format("{0,-7} {1,-15} {2,-8} {3,-20} {4,-8} {5,4} {6,8} {7,11} {8,6}", info[i].DSTB_NO, fullDate, info[i].AltStock_No, Brand, info[i].Batch_NO, info[i].Items_Available, "0", "0", "0"));
                }
                sw.Close();     //Don't Forget Close the TextWriter Object(sw)
                byte[] bytes = ms.ToArray();

                Response.Clear();
                Response.ContentType = "application/force-download";
                Response.AddHeader("content-disposition", "attachment;  filename=" + BCode + "Stock.txt");
                Response.BinaryWrite(bytes);
                Response.End();
            }
            return View();
        }

        #endregion

    }
}