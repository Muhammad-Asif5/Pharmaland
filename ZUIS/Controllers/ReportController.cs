using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web;
using System.Web.Mvc;
using ZUIS.Models;
using ZUIS.Common;

namespace ZUIS.Controllers
{
    public class ReportController : Controller
    {
        // GET: Report
        Entities con = new Entities();
        public ActionResult Report()
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

   
        public ActionResult get748INV(DateTime SODate, DateTime SODate1, string VCode, string BCode)
        {
            con.Configuration.ProxyCreationEnabled = false;

            var r = (from siDET in con.Sale_InvDET
                     join s in con.Sale_Invoice on siDET.Invoice_no equals s.Invoice_no
                     join cus in con.Customers on s.Customer_Code equals cus.Customer_code
                     join c in con.Cities on cus.City_code equals c.City_code
                     join i in  con.Item_Stock on  siDET.Stock_no equals i.Stock_no
                     from b in con.Branches
                     where b.DSTB_NO == BCode && i.Manufacturer_Code == VCode && s.Invoice_date >= SODate && s.Invoice_date <= SODate1
                     select new
                     {
                         b.Branch_Code,
                         b.DSTB_NO,
                         s.Invoice_no,
                         s.Invoice_date,
                         s.Customer_Code,
                         cus.City,
                         c.City_code,
                         siDET.Stock_no,
                         i.Brand_name,
                         siDET.Batch_NO,
                         siDET.SPrice_PerItem,
                         siDET.SQty,
                         s.NET_Amount,
                         siDET.TSPrice_PerItem
                     }).ToList();
            //var r = (from b in con.Branches
            //         from s in con.Sale_Invoice
            //         join cus in con.Customers on s.Customer_Code equals cus.Customer_code
            //         join c in con.Cities on cus.City_code equals c.City_code
            //         join sDEL in con.Sale_InvDET on s.Invoice_no equals sDEL.Invoice_no
            //         join i in con.Item_Stock on sDEL.Stock_no equals i.Stock_no
            //         where b.DSTB_NO==BCode && i.Manufacturer_Code == VCode && s.Invoice_date >= SODate && s.Invoice_date <= SODate1
            //         select new
            //         {
            //             b.Branch_Code,
            //             b.DSTB_NO,
            //             s.Invoice_no,
            //             s.Invoice_date,
            //             s.Customer_Code,
            //             cus.City,
            //             c.City_code,
            //             sDEL.Stock_no,
            //             i.Brand_name,
            //             sDEL.Batch_NO,
            //             sDEL.SPrice_PerItem,
            //             sDEL.SQty,
            //             s.NET_Amount,
            //             sDEL.TSPrice_PerItem
            //         }).ToList();

            return Json(r, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Download748INV(DateTime SODate, DateTime SODate1, string VCode, string BCode)
        {
            var info = (from b in con.Branches
                     from s in con.Sale_Invoice
                     join cus in con.Customers on s.Customer_Code equals cus.Customer_code
                     join c in con.Cities on cus.City_code equals c.City_code
                     join sDEL in con.Sale_InvDET on s.Invoice_no equals sDEL.Invoice_no
                     join i in con.Item_Stock on sDEL.Stock_no equals i.Stock_no
                        where b.DSTB_NO == BCode && i.Manufacturer_Code == VCode && s.Invoice_date >= SODate && s.Invoice_date <= SODate1
                     select new
                     {
                         b.DSTB_NO,
                         s.Invoice_no,
                         s.Invoice_date,
                         s.Customer_Code,
                         cus.City,
                         c.City_code,
                         sDEL.Stock_no,
                         i.Brand_name,
                         i.AltStock_No,
                         sDEL.Batch_NO,
                         sDEL.SPrice_PerItem,
                         sDEL.SQty,
                         s.NET_Amount,
                         sDEL.TSPrice_PerItem
                     }).ToList();

            // var aa = (from ss in con.Customers select ss).ToList();
            MemoryStream ms = new MemoryStream();
            //TextWriter sw = new StreamWriter(@"E:\\file11.txt");
            TextWriter sw = new StreamWriter(ms);
            sw.WriteLine(string.Format("{0,-7} {1,-15} {2,-15} {3,-7} {4,-7} {5,-7} {6,-7} {7,-28} {8,-10} {9,-7} {10,-11} {11,-6} {12,-13} {13,-8} {14}", "DSTBID", "DOCUMENTNO", "DOCDATE", "CUSTID", "CT", "TOWNID", "PRDID", "PRD", "BATCHNO", "PRICE", "QUANTITY", "BONUS", "DISCOUNTAMNT", "NETAMT", "REASON"));
            for (int i = 0; i < info.Count; i++)
            {
                int length = info[i].Brand_name.Length;
                string BrandName = "";
                if (length > 30)
                {
                    BrandName = info[i].Brand_name.Substring(0, 30);
                }
                else
                {
                    BrandName = info[i].Brand_name;
                }
                var CLDATE = info[i].Invoice_date;
                //var day = info[i].Invoice_date.Day;
                //var mont = info[i].Invoice_date.Month;
                //var year = info[i].Invoice_date.Year;
                //var fullDate = day + "-" + mont + "-" + year;
                string fullDate = CLDATE.ToString("dd-MM-yyyy");
                decimal Price = 0;
                decimal NetAmount = 0;
                Price = decimal.Round((decimal)info[i].SPrice_PerItem, 2);
                NetAmount = decimal.Round((decimal)info[i].TSPrice_PerItem, 2);

                sw.WriteLine(string.Format("{0,-7} {1,-15} {2,-15} {3,-7} {4,-7} {5,-7} {6,-7} {7,-28} {8,-10} {9,6} {10,4} {11,11} {12,6} {13,18} {14,4}", info[i].DSTB_NO, info[i].Invoice_no, fullDate, info[i].Customer_Code, info[i].City_code, "001", info[i].AltStock_No, BrandName, info[i].Batch_NO, Price, info[i].SQty, "0", "0", NetAmount, "S"));
            }
            sw.Close();     //Don't Forget Close the TextWriter Object(sw)
            byte[] bytes = ms.ToArray();

            Response.Clear();
            Response.ContentType = "application/force-download";
            Response.AddHeader("content-disposition", "attachment;  filename=" + BCode + "INV.txt");
            Response.BinaryWrite(bytes);
            Response.End();

            return View();
        }

        //public ActionResult Download745CUST(DateTime SODate, DateTime SODate1)
        //{
        //    var info = (from com in con.Branches
        //                from c in con.Customers
        //                join s in con.Sale_Invoice on c.Customer_code equals s.Customer_Code
        //                where s.SO_Date >= SODate && s.SO_Date <= SODate1
        //                select new
        //                {
        //                    com.DSTB_NO,
        //                    s.Customer_Code,
        //                    c.Cust_Name,
        //                    c.Address,
        //                    c.City_code,
        //                    c.City
        //                }).ToList();


        //    // var aa = (from ss in con.Customers select ss).ToList();
        //    MemoryStream ms = new MemoryStream();
        //    //TextWriter sw = new StreamWriter(@"E:\\file11.txt");
        //    TextWriter sw = new StreamWriter(ms);
        //    sw.WriteLine(string.Format("{0,-7} {1,-7} {2,-36} {3,-37} {4,-13} {5,-9} {6}", "DSTBID", "CUSTID", "CUSTNAME", "ADDRESS", "CT", "TOWNID", "TOWN"));
        //    for (int i = 0; i < info.Count; i++)
        //    {
        //        int length = info[i].Address.Length;
        //        string address = "";
        //        if (length > 30)
        //        {
        //            address = info[i].Address.Substring(0, 30);
        //        }
        //        else
        //        {
        //            address = info[i].Address;
        //        }
        //        sw.WriteLine(string.Format("{0,-7} {1,-7} {2,-36} {3,-37} {4,-13} {5,-9} {6}", info[i].DSTB_NO, info[i].Customer_Code, info[i].Cust_Name, address, info[i].City_code, info[i].City_code, info[i].City));
        //    }
        //    sw.Close();     //Don't Forget Close the TextWriter Object(sw)
        //    byte[] bytes = ms.ToArray();

        //    Response.Clear();
        //    Response.ContentType = "application/force-download";
        //    Response.AddHeader("content-disposition", "attachment;  filename=745CUST.txt");
        //    Response.BinaryWrite(bytes);
        //    Response.End();

        //    return View();
        //}

        //public ActionResult Download745Stock(DateTime SODate, DateTime SODate1)
        //{
        //    var info = (from com in con.Branches
        //                from i in con.Item_Stock
        //                join sDEL in con.Sale_InvDET on i.Stock_no equals sDEL.Stock_no
        //                join s in con.Sale_Invoice on sDEL.Invoice_no equals s.Invoice_no
        //                join sr in con.Stock_ReceiptDET on i.Stock_no equals sr.Stock_no
        //                where s.SO_Date >= SODate && s.SO_Date <= SODate1
        //                select new
        //                {
        //                    com.DSTB_NO,
        //                    sDEL.Stock_no,
        //                    i.Brand_name,
        //                    sDEL.Batch_NO,
        //                    sr.Items_Available
        //                }).ToList();
        //    var CLDATE = DateTime.Now;

        //    var day = CLDATE.Day;
        //    var mont = CLDATE.Month;
        //    var year = CLDATE.Year;
        //    var fullDate = day + "-" + mont + "-" + year;

        //    // var aa = (from ss in con.Customers select ss).ToList();
        //    MemoryStream ms = new MemoryStream();
        //    //TextWriter sw = new StreamWriter(@"E:\\file11.txt");
        //    TextWriter sw = new StreamWriter(ms);
        //    sw.WriteLine(string.Format("{0,-7} {1,-15} {2,-8} {3,-22} {4,-8} {5,-9} {6,-9} {7,-9} {8}", "DSTBID", "CLDATE", "PRODID", "PRD", "BATCHNO", "CLBALANCE", "INTRANSIT", "SHORTAGE", "EXPIRED"));
        //    for (int i = 0; i < info.Count; i++)
        //    {
        //        int length = info[i].Brand_name.Length;
        //        string Brand = "";
        //        if (length > 22)
        //        {
        //            Brand = info[i].Brand_name.Substring(0, 22);
        //        }
        //        else
        //        {
        //            Brand = info[i].Brand_name;
        //        }
        //        sw.WriteLine(string.Format("{0,-7} {1,-15} {2,-8} {3,-22} {4,-8} {5,-9} {6,-9} {7,-9} {8}", info[i].DSTB_NO, fullDate, info[i].Stock_no, Brand, info[i].Batch_NO, info[i].Items_Available, "0", "0", "0"));
        //    }
        //    sw.Close();     //Don't Forget Close the TextWriter Object(sw)
        //    byte[] bytes = ms.ToArray();

        //    Response.Clear();
        //    Response.ContentType = "application/force-download";
        //    Response.AddHeader("content-disposition", "attachment;  filename=745Stock.txt");
        //    Response.BinaryWrite(bytes);
        //    Response.End();

        //    return View();
        //}
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

        //public ActionResult get745CUST(DateTime SODate, DateTime SODate1)
        //{
        //    con.Configuration.ProxyCreationEnabled=false;

        //    var r = (from com in con.Companies
        //             from c in con.Customers 
        //             join s in con.Sale_Invoice on c.Customer_code equals s.Customer_Code
        //             where s.SO_Date >= SODate && s.SO_Date <= SODate1
        //             select new
        //             {
        //                 com.Branch_Code,
        //                 s.Customer_Code,
        //                 c.Cust_Name,
        //                 c.Address,
        //                 c.City_code,
        //                 c.City
        //             }).ToList();

        //    return Json(r,JsonRequestBehavior.AllowGet);
        //}

        //public ActionResult get745Stock(DateTime SODate, DateTime SODate1)
        //{
        //    con.Configuration.ProxyCreationEnabled = false;

        //    var r = (from com in con.Companies
        //             from i in con.Item_Stock
        //             join sDEL in con.Sale_InvDET on i.Stock_no equals sDEL.Stock_no
        //             join s in con.Sale_Invoice on sDEL.Invoice_no equals s.Invoice_no
        //             join sr in con.Stock_ReceiptDET on i.Stock_no equals sr.Stock_no
        //             where s.SO_Date >= SODate && s.SO_Date <= SODate1
        //             select new
        //             {
        //                 com.Branch_Code,
        //                 sDEL.Stock_no,
        //                 i.Brand_name,
        //                 sDEL.Batch_NO,
        //                 sr.Items_Available
        //             }).ToList();

        //    return Json(r, JsonRequestBehavior.AllowGet);
        //}
    }
}