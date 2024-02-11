using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZUIS.Models;
using ZUIS.Common;
using System.Linq;


namespace ZUIS.Controllers
{
    public class StockReceiptController : Controller
    {
        // GET: StockReceipt  
        AllCommon obj = new AllCommon();
        Entities con = new Entities();
        public ActionResult StockReceipt()
        {
            con.Configuration.ProxyCreationEnabled = false;

            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            ViewBag.UserType = Session["UserType"];
            ViewBag.Branch_No = Session["Branch_No"];

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

                    GetAllPO();
                    GetAllVendor();
                    var getPO = (from q in con.Stock_Receipt
                                 where q.Supp_Invno != null && q.Branch_No==Branch_No
                                 select q.Supp_Invno).ToList();
                    int MaxSup = 0;
                    if (getPO.Count > 0)
                    {
                        MaxSup = getPO.Select(int.Parse).ToList().Max();
                        //string rMaxPO = con.Stock_Receipt.Select(x => x.Supp_Invno).Max(); //01-1
                        //int no = Convert.ToInt32(rMaxPO);
                        //no++;
                        MaxSup++;
                    }
                    else
                    {
                        MaxSup = 1;
                    }
                    ViewBag.SunInvoiceNo = MaxSup.ToString();

                    return View(vm);
                }
            }
        }
        public ActionResult Example()
        {
            GetAllPO();
            GetAllVendor();
            return View();
        }
        public ActionResult SRReport()
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

                    return View(vm);
                }
            }
        }
        /// <summary>
        /// Saving first recored with all PO
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public ActionResult SaveStockReceipt(Stock_Receipt model)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                var viewData = (from q in con.Stock_Receipt
                                where q.Branch_No == model.Branch_No && q.Supp_Invno == model.Supp_Invno
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        model.User_id = UserID;
                        con.Stock_Receipt.Add(model);
                        con.SaveChanges();

                        var viewData1 = (from q in con.Stock_ReceiptDET
                                         where q.Branch_No == model.Branch_No && q.Supp_Invno == model.Supp_Invno
                                        select q).FirstOrDefault();
                        //var r = con.PO_ItemDetail.Where(x => x.PO_No == model.PO_NO).ToList();
                        var r = (from q in con.PO_ItemDetail
                                 join i in con.Item_Stock on q.Stock_no equals i.Stock_no
                                 where q.Branch_No==model.Branch_No && q.PO_No == model.PO_NO
                                 select new
                                 {
                                     q.Branch_No,
                                     i.Current_Price,
                                     q.Stock_no,
                                     q.POPrice_PerItem,
                                     q.POExtend_Price,
                                     q.POQty_PerItem,
                                     q.CurrExch_rate,
                                     q.POMargin_Percentage,
                                     q.Qty_Pack
                                 }).ToList();


                        if (viewData1 == null && r.Count>0)
                        {
                            for (int i = 0; i < r.Count; i++)
                            {                                
                                Stock_ReceiptDET obj = new Stock_ReceiptDET();
                                obj.Supp_Invno = model.Supp_Invno;
                                obj.Branch_No = r[i].Branch_No;
                                obj.Stock_no = r[i].Stock_no;
                                obj.PPrice_PerItem = r[i].POPrice_PerItem;
                                obj.PQty_PerItem=r[i].Qty_Pack;
                                //obj.PPrice_PerUnit = r[i].POExtend_Price;
                                obj.Tot_PPriceItem = r[i].POExtend_Price;
                                obj.Units_PerItem = (int)r[i].POQty_PerItem;
                                obj.POMargin_Percentage=r[i].POMargin_Percentage;
                                obj.Received_Status="N";

                                con.Stock_ReceiptDET.Add(obj);
                                con.SaveChanges();
                            }
                        }
                        message = "Stock Receipt is Added Successfully";
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    viewData.AltSupp_Invno = model.AltSupp_Invno;
                    viewData.vendor_code = model.vendor_code;
                    viewData.Received_date = model.Received_date;
                    viewData.Status = model.Status;
                    viewData.Currency = model.Currency;
                    viewData.Invoice_Date = model.Invoice_Date;
                    viewData.Payment_Type = model.Payment_Type;
                    viewData.Comments = model.Comments;
                    
                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();

                    return Json(new { success = false, message = "Stock Receipt is Updated" }, JsonRequestBehavior.AllowGet);
                }

            }
        }
        
        //public ActionResult SaveStockReceiptExample(Stock_Receipt model)
        //{
        //    con.Configuration.ProxyCreationEnabled = false;
        //    string message = string.Empty;
        //    string UserID = Session["UserID"] as string;

        //    UserID = "123";
        //    if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
        //    {
        //        return RedirectToAction("Home", "Home");
        //    }
        //    else
        //    {
        //        var viewData = (from q in con.Stock_Receipt
        //                        where q.Supp_Invno == model.Supp_Invno
        //                        select q).FirstOrDefault();
        //        if (viewData == null)
        //        {
        //            try
        //            {
        //                model.User_id = UserID;

        //                con.Stock_Receipt.Add(model);
        //                con.SaveChanges();

        //                var viewData1 = (from q in con.Stock_ReceiptDET
        //                                 where q.Supp_Invno == model.Supp_Invno
        //                                 select q).FirstOrDefault();
        //                //var r = con.PO_ItemDetail.Where(x => x.PO_No == model.PO_NO).ToList();
        //                var r = (from q in con.PO_ItemDetail
        //                         join i in con.Item_Stock on q.Stock_no equals i.Stock_no
        //                         where q.PO_No == model.PO_NO
        //                         select new
        //                         {
        //                             i.Current_Price,
        //                             q.Stock_no,
        //                             q.POPrice_PerItem,
        //                             q.POExtend_Price,
        //                             q.POQty_PerItem,
        //                             q.CurrExch_rate
        //                         }).ToList();


        //                if (viewData1 == null && r.Count > 0)
        //                {
        //                    for (int i = 0; i < r.Count; i++)
        //                    {
        //                        decimal sppi = 0;
        //                        sppi = (decimal)(r[i].Current_Price / r[i].POQty_PerItem);

        //                        Stock_ReceiptDET obj = new Stock_ReceiptDET();
        //                        obj.Supp_Invno = model.Supp_Invno;
        //                        obj.Stock_no = r[i].Stock_no;
        //                        obj.PPrice_PerItem = r[i].POPrice_PerItem;
        //                        obj.PPrice_PerUnit = r[i].POExtend_Price;
        //                        obj.Units_PerItem = r[i].POQty_PerItem;
        //                        obj.SPrice_PerUnit = r[i].Current_Price;
        //                        obj.SPrice_PerItem = sppi;
        //                        obj.Currency_Rate = r[i].CurrExch_rate;
        //                        obj.Received_Status = "N";

        //                        con.Stock_ReceiptDET.Add(obj);
        //                        con.SaveChanges();
        //                    }
        //                }
        //                message = "Stock Receipt is Added Successfully";
        //                return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
        //            }
        //            catch (Exception ex)
        //            {
        //                return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
        //            }
        //        }
        //        else
        //        {
        //            return Json(new { success = false, message = "Stock Receipt is already Added with this Code" }, JsonRequestBehavior.AllowGet);
        //        }

        //    }
        //}
        //public ActionResult GetAllSRInTableByID(string id)
        //{
        //    con.Configuration.ProxyCreationEnabled = false;

        //    var r = (from q in con.Stock_Receipt
        //             where q.Supp_Invno == id
        //             select q).ToList();
        //    return Json(r);
        //    //var jsonResult = Json(r, JsonRequestBehavior.AllowGet);
        //    //jsonResult.MaxJsonLength = int.MaxValue;
        //    //return jsonResult;
        //}
        public ActionResult GetAllSRInTable()
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
                if (UserType == "Admin")
                {
                    var r = (from q in con.Stock_Receipt
                             join v in con.Vendors
                             on q.vendor_code equals v.vendor_code
                             join p in con.Purchase_Order on q.PO_NO equals p.PO_No
                             join c in con.Customers on p.Customer_Code equals c.Customer_code
                             join b in con.Branch_Master on q.Branch_No equals b.Branch_No
                             where q.PO_NO != null
                             select new
                             {
                                 b.Branch_Name,
                                 b.Branch_No,
                                 q.Supp_Invno,
                                 q.AltSupp_Invno,
                                 c.Cust_Name,
                                 q.Invoice_Date,
                                 q.vendor_code,
                                 q.Received_date,
                                 q.Total_Amount,
                                 q.PO_NO,
                                 q.Received_by,
                                 q.Status,
                                 v.Name
                             }).ToList();
                    return Json(r);
                }
                else
                {
                    var r = (from q in con.Stock_Receipt
                             join v in con.Vendors
                             on q.vendor_code equals v.vendor_code
                             join p in con.Purchase_Order on q.PO_NO equals p.PO_No
                             join c in con.Customers on p.Customer_Code equals c.Customer_code
                             join b in con.Branch_Master on q.Branch_No equals b.Branch_No
                             where q.Branch_No==Branch_No &&  q.PO_NO != null
                             select new
                             {
                                 b.Branch_Name,
                                 b.Branch_No,
                                 q.Supp_Invno,
                                 q.AltSupp_Invno,
                                 c.Cust_Name,
                                 q.Invoice_Date,
                                 q.vendor_code,
                                 q.Received_date,
                                 q.Total_Amount,
                                 q.PO_NO,
                                 q.Received_by,
                                 q.Status,
                                 v.Name
                             }).ToList();
                    return Json(r);
                }
            }
        }
        /// <summary>
        /// Finding Stock Receipt by no and Branch No, In Table
        /// </summary>
        /// <param name="SupInv"></param>
        /// <param name="BranchNo"></param>
        /// <returns></returns>
        public ActionResult GetAllStockReceiptDELInTable(string SupInv, string BranchNo)
        {
            con.Configuration.ProxyCreationEnabled = false;


            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            ViewBag.UserType = Session["UserType"];
            ViewBag.Branch_No = Session["Branch_No"];

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                if (UserType == "Admin")
                {
                    
                    var r = (from i in con.Item_Stock
                             join poD in con.PO_ItemDetail on i.Stock_no equals poD.Stock_no
                             join po in con.Purchase_Order on poD.PO_No equals po.PO_No
                             join sr in con.Stock_Receipt on po.PO_No equals sr.PO_NO
                             join srD in con.Stock_ReceiptDET on new { i.Stock_no, sr.Supp_Invno } equals new { srD.Stock_no, srD.Supp_Invno }
                             //where poD.PO_No == poNo
                             where sr.Branch_No == BranchNo && sr.Supp_Invno == SupInv
                             select new
                             {
                                 sr.Branch_No,
                                 srD.Supp_Invno,
                                 sr.AltSupp_Invno,
                                 i.Stock_no,
                                 i.Brand_name,
                                 i.Generic_name,
                                 poD.POQty_PerItem,
                                 poD.Qty_Pack,
                                 sr.PO_NO,
                                 sr.vendor_code,
                                 sr.Currency,
                                 sr.Received_date,
                                 sr.Invoice_Date,
                                 sr.Status,
                                 sr.Payment_Type,
                                 sr.Total_Amount,
                                 sr.Tax_amount,
                                 sr.Disc_amount,
                                 sr.Received_by,
                                 srD.Items_Received,
                                 srD.Units_PerItem,
                                 srD.PPrice_PerItem,
                                 srD.SPrice_PerItem,
                                 srD.PPrice_Currency,
                                 srD.Currency_Rate,
                                 srD.WPrice_PerItem,
                                 srD.Expiry_Date,
                                 srD.Batch_NO,
                                 srD.PPrice_PerUnit,
                                 srD.Tot_PPriceItem,
                                 srD.SPrice_PerUnit,
                                 srD.Trade_PriceItem,
                                 srD.Tax_Percentage,
                                 srD.Tax_Amount,
                                 srD.Received_Status,
                                 srD.Items_Available,
                                 srD.Record_date,
                                 srD.Serial_no,
                                 srD.User_id,
                                 sr.Comments
                             }).ToList();
                    var jsonResult = Json(r, JsonRequestBehavior.AllowGet);
                    jsonResult.MaxJsonLength = int.MaxValue;
                    return jsonResult;

                }
                else
                {
                    var r = (from i in con.Item_Stock
                             join poD in con.PO_ItemDetail on i.Stock_no equals poD.Stock_no
                             join po in con.Purchase_Order on poD.PO_No equals po.PO_No
                             join sr in con.Stock_Receipt on po.PO_No equals sr.PO_NO
                             join srD in con.Stock_ReceiptDET on new { i.Stock_no, sr.Supp_Invno } equals new { srD.Stock_no, srD.Supp_Invno }
                             //where poD.PO_No == poNo
                             where sr.Branch_No == Branch_No && sr.Supp_Invno == SupInv
                             select new
                             {
                                 sr.Branch_No,
                                 srD.Supp_Invno,
                                 sr.AltSupp_Invno,
                                 i.Stock_no,
                                 i.Brand_name,
                                 i.Generic_name,
                                 poD.POQty_PerItem,
                                 poD.Qty_Pack,
                                 sr.PO_NO,
                                 sr.vendor_code,
                                 sr.Currency,
                                 sr.Received_date,
                                 sr.Invoice_Date,
                                 sr.Status,
                                 sr.Payment_Type,
                                 sr.Total_Amount,
                                 sr.Tax_amount,
                                 sr.Disc_amount,
                                 sr.Received_by,
                                 srD.Items_Received,
                                 srD.Units_PerItem,
                                 srD.PPrice_PerItem,
                                 srD.SPrice_PerItem,
                                 srD.PPrice_Currency,
                                 srD.Currency_Rate,
                                 srD.WPrice_PerItem,
                                 srD.Expiry_Date,
                                 srD.Batch_NO,
                                 srD.PPrice_PerUnit,
                                 srD.Tot_PPriceItem,
                                 srD.SPrice_PerUnit,
                                 srD.Trade_PriceItem,
                                 srD.Tax_Percentage,
                                 srD.Tax_Amount,
                                 srD.Received_Status,
                                 srD.Items_Available,
                                 srD.Record_date,
                                 srD.Serial_no,
                                 srD.User_id,
                                 sr.Comments
                             }).ToList();
                    var jsonResult = Json(r, JsonRequestBehavior.AllowGet);
                    jsonResult.MaxJsonLength = int.MaxValue;
                    return jsonResult;
                }
            }
        }
        /// <summary>
        /// By click row to get data for update operation
        /// </summary>
        /// <param name="StockNo"></param>
        /// <param name="SuppInvno"></param>
        /// <param name="BrNo"></param>
        /// <returns></returns>
        public ActionResult GetPODetailsById(string StockNo, string SuppInvno, string BrNo)
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
                var jsonResult = con.Stock_ReceiptDET.Where(x => x.Branch_No == BrNo && x.Supp_Invno == SuppInvno && x.Stock_no == StockNo).ToList();
                return Json(jsonResult);
            }
           
        }
        /// <summary>
        /// Delete Record
        /// </summary>
        /// <param name="BrNo"></param>
        /// <param name="StockNo"></param>
        /// <param name="SuppInvno"></param>
        /// <param name="myJsonString"></param>
        /// <returns></returns>
        public ActionResult DeleteSRDetails(string BrNo, string StockNo, string SuppInvno,string [] myJsonString)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            List<decimal?> l = new List<decimal?>();

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                try
                {
                    for (int i = 0; i < myJsonString.Length; i++)
                    {
                        var StockNoo = myJsonString[i];
                        var viewData = (from q in con.Stock_ReceiptDET
                                        where q.Branch_No==BrNo && q.Supp_Invno == SuppInvno && q.Stock_no == StockNoo
                                        select q).FirstOrDefault();
                        con.Entry(viewData).State = EntityState.Deleted;
                        con.SaveChanges();
                        
                    }
                    message = "Deleted Successfully";
                    var check = (from q in con.Stock_ReceiptDET
                                 where q.Branch_No == BrNo && q.Supp_Invno == SuppInvno
                                 select q).ToList();
                    if (check.Count > 0)
                    {
                        decimal GrossAmount = 0;
                        decimal GABefMarg = 0;
                        decimal Tax = 0;
                        decimal Disc = 0;
                        decimal NETAmount = 0;

                        var r = con.Stock_ReceiptDET.Where(x => x.Branch_No == BrNo && x.Supp_Invno == SuppInvno).ToList();
                        for (int i = 0; i < r.Count; i++)
                        {
                            GrossAmount = GrossAmount + (decimal)r[i].Tot_PPriceItem;
                            //i++;
                        }
                        var up = con.Stock_Receipt.Where(x => x.Branch_No == BrNo && x.Supp_Invno == SuppInvno).FirstOrDefault();
                        up.Total_Amount = GrossAmount;
                        //up. = GrossAmount;
                        up.Disc_amount = 0;
                        up.Tax_amount = 0;

                        con.Entry(up).State = EntityState.Modified;
                        con.SaveChanges();

                        l.Add(GrossAmount);
                        l.Add(Disc);
                        l.Add(Tax);
                        l.Add(GABefMarg);
                    }
                    else
                    {
                        var up = con.Stock_Receipt.Where(x => x.Branch_No == BrNo && x.Supp_Invno == SuppInvno).FirstOrDefault();
                        con.Entry(up).State = EntityState.Deleted;
                        con.SaveChanges();
                        //Delete
                    }
                    return Json(new { success = true, message = message, l = l }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }
        /// <summary>
        /// Received and Update record
        /// </summary>
        /// <param name="BranchNo"></param>
        /// <param name="QtyRece"></param>
        /// <param name="ExpDate"></param>
        /// <param name="PPPItem"></param>
        /// <param name="Tot_Price"></param>
        /// <param name="BatchNO"></param>
        /// <param name="ReceStatus"></param>
        /// <param name="StockNno"></param>
        /// <param name="SuppInvno"></param>
        /// <param name="Discount"></param>
        /// <returns></returns>
        public ActionResult UpdateSRDetails(string BranchNo, int QtyRece, DateTime ExpDate, decimal PPPItem, decimal Tot_Price, string BatchNO,
           string ReceStatus, string StockNno, string SuppInvno, int Discount)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                var viewData = (from q in con.Stock_ReceiptDET
                                where q.Branch_No == BranchNo && q.Supp_Invno == SuppInvno && q.Stock_no == StockNno
                                select q).FirstOrDefault();

                if (viewData != null)
                {
                    try
                    {
                        viewData.Items_Received = QtyRece;
                        viewData.PPrice_PerItem = PPPItem;
                        viewData.POMargin_Percentage = Discount;
                        viewData.Expiry_Date = ExpDate;
                        viewData.Batch_NO = BatchNO;
                        //viewData.PPrice_PerUnit = PPPUnit;
                        viewData.Tot_PPriceItem = Tot_Price;
                        viewData.Received_Status = ReceStatus;
                        viewData.Items_Available = QtyRece;

                        viewData.Record_date = DateTime.Now;

                        con.Entry(viewData).State = EntityState.Modified;
                        con.SaveChanges();

                        message = "Updated Successfully";
                        
                        decimal GrossAmount = 0;
                        decimal GABefMarg = 0;
                        decimal Tax = 0;
                        decimal Disc = 0;
                        decimal NETAmount = 0;
                        var r = con.Stock_ReceiptDET.Where(x => x.Branch_No == BranchNo && x.Supp_Invno == SuppInvno).ToList();
                        //for (int i = 0; i < r.Count; i++)
                        //{
                        //    //GABefMarg = GABefMarg + (decimal)(r[i].PPrice_PerUnit / r[i].Items_Received);
                        //    GrossAmount = GrossAmount + (decimal)PPPUnit;
                        //    //GABefMarg = GABefMarg + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        //    //GrossAmount = GrossAmount + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        //    //Disc = (decimal)((r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].POMargin_Percentage / 100);
                        //    //GrossAmount = GrossAmount - Disc;
                        //}
                        //GrossAmount = GrossAmount + (decimal)Tot_Price;
                        for (int i = 0; i < r.Count; i++)
                        {
                            GrossAmount = GrossAmount + (decimal)r[i].Tot_PPriceItem;
                            //i++;
                        }


                        var up = con.Stock_Receipt.Where(x => x.Branch_No == BranchNo && x.Supp_Invno == SuppInvno).FirstOrDefault();
                        up.Total_Amount = GrossAmount;
                        //up. = GrossAmount;
                        up.Disc_amount = 0;
                        up.Tax_amount = 0;

                        con.Entry(up).State = EntityState.Modified;
                        con.SaveChanges();

                        List<decimal?> l = new List<decimal?>();
                        l.Add(GrossAmount);
                        l.Add(Disc);
                        l.Add(Tax);
                        l.Add(GABefMarg);

                        return Json(new { success = true, message = message, l = l }, JsonRequestBehavior.AllowGet);
                        //return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
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
        
        
        
        //public ActionResult UpdateSRDetailsExample(int QtyRece, int UnitPItem, decimal PPPItem, decimal SPPItem, decimal PPCurr, decimal CurrRate,
        //            DateTime ExpDate, decimal WPPItem, string BatchNO, decimal PPPUnit, decimal SPPUnit, decimal TaxPercentage, int TaxAmount,
        //            string ReceStatus, int ItemsAvail, string StockNno, string SuppInvno)
        //{
        //    con.Configuration.ProxyCreationEnabled = false;
        //    string message = string.Empty;
        //    string UserID = Session["UserID"] as string;

        //    UserID = "123";
        //    if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
        //    {
        //        return RedirectToAction("Home", "Home");
        //    }
        //    else
        //    {
        //        var viewData = (from q in con.Stock_ReceiptDET
        //                        where q.Supp_Invno == SuppInvno && q.Stock_no == StockNno
        //                        select q).FirstOrDefault();

        //        if (viewData != null)
        //        {
        //            try
        //            {
        //                viewData.Items_Received = QtyRece;
        //                viewData.Units_PerItem = UnitPItem;
        //                viewData.PPrice_PerItem = PPPItem;
        //                viewData.SPrice_PerItem = SPPItem;
        //                viewData.PPrice_Currency = PPCurr;
        //                viewData.Currency_Rate = CurrRate;
        //                viewData.WPrice_PerItem = WPPItem;
        //                viewData.Expiry_Date = ExpDate;
        //                viewData.Batch_NO = BatchNO;
        //                viewData.PPrice_PerUnit = PPPUnit;
        //                viewData.SPrice_PerUnit = SPPUnit;
        //                viewData.Tax_Percentage = TaxPercentage;
        //                viewData.Tax_Amount = TaxAmount;
        //                viewData.Received_Status = ReceStatus;
        //                viewData.Items_Available = ItemsAvail;

        //                viewData.Record_date = DateTime.Now;

        //                con.Entry(viewData).State = EntityState.Modified;
        //                con.SaveChanges();
        //                message = "Updated Successfully";
        //                return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
        //            }
        //            catch (Exception ex)
        //            {
        //                return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
        //            }
        //        }
        //        else
        //        {
        //            return Json(new { success = false, message = "Stock is already Added with this Code" }, JsonRequestBehavior.AllowGet);
        //        }

        //    }
        //}




        //public ActionResult SaveStockReceiptDEL(string Invno, string PO_NO)
        //{
        //    con.Configuration.ProxyCreationEnabled = false;
        //    string message = string.Empty;
        //    string Emp_Code = Session["Emp_Code"] as string;         //1
        //    string UserID = Session["UserID"] as string;             // Asif
        //    string UserType = Session["UserType"] as string;           // Admin
        //    string Branch_No = Session["Branch_No"] as string;       // 01
        //    string Emp_Name = Session["Emp_Name"] as string;         // M Asif

        //    if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
        //    {
        //        return RedirectToAction("Home", "Home");
        //    }
        //    else
        //    {
        //        var viewData = (from q in con.Stock_ReceiptDET
        //                        where q.Branch_No ==Branch_No && q.Supp_Invno == Invno
        //                        select q).FirstOrDefault();
        //        var r = con.PO_ItemDetail.Where(x => x.Branch_No==Branch_No && x.PO_No == PO_NO).ToList();
        //        if (viewData == null && r.Count>0)
        //        {
        //            try
        //            {
        //                for (int i = 0; i < r.Count; i++)
        //                {
        //                    Stock_ReceiptDET obj = new Stock_ReceiptDET();
        //                    obj.Supp_Invno = Invno;
        //                    obj.Branch_No = Branch_No;
        //                    obj.Stock_no = r[i].Stock_no;
        //                    obj.PPrice_PerItem = r[i].POPrice_PerItem;
        //                    obj.PPrice_PerUnit = r[i].POQty_PerItem;

        //                    con.Stock_ReceiptDET.Add(obj);
        //                    con.SaveChanges();
        //                }
        //                //model.User_id = UserID;

        //                //
                        
        //                message = "Stock is Added Successfully";
        //                return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
        //            }
        //            catch (Exception ex)
        //            {
        //                return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
        //            }
        //        }
        //        else
        //        {
        //            return Json(new { success = false, message = "Stock is already Added with this Code" }, JsonRequestBehavior.AllowGet);
        //        }

        //    }
        //}
        public void GetAllCustomer()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = obj.AllCustomer();
            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLCustomer = viewData.Select(x => new SelectListItem
                {
                    Value = x.Customer_code.ToString(),
                    Text = x.Customer_code + " : " + x.Cust_Name.ToString()
                }).ToList();
            }
            else
            {
                var data = ViewBag.DDLCustomer = viewData.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found"
                }).ToList();
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
        // GET: Stock
        /// <summary>
        /// Get Purchase Order 
        /// </summary>
        public void GetAllPO()
        {
            con.Configuration.ProxyCreationEnabled = false;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            if (UserType == "Admin")
            {
                var viewData = (from q in con.Purchase_Order
                                join v in con.Vendors on q.Vendor_code equals v.vendor_code
                                join c in con.Customers on q.Customer_Code equals c.Customer_code
                                where q.Received_Status == "N"
                                //join p in con.PO_ItemDetail on q.PO_No equals p.PO_No
                                select new
                                {
                                    q.PO_No,
                                    q.PO_Title,
                                    c.Cust_Name,
                                    v.Name
                                    //p.POQty_PerItem
                                }).Distinct().ToList();

                if (viewData.Count > 0)
                {
                    var data = ViewBag.DDLPo = viewData.Select(x => new SelectListItem
                    {
                        Value = x.PO_No.ToString(),
                        Text = x.PO_No + " : " + x.Name + " : " + x.Cust_Name
                    }).Distinct().ToList();
                }
                else
                {
                    var data = ViewBag.DDLPo = viewData.Select(x => new SelectListItem
                    {
                        Value = "",
                        Text = "No Data Found"
                    }).ToList();
                }
            }
            else
            {
                var viewData = (from q in con.Purchase_Order
                                join v in con.Vendors on q.Vendor_code equals v.vendor_code
                                join c in con.Customers on q.Customer_Code equals c.Customer_code
                                where q.Branch_No ==Branch_No && q.Received_Status == "N"
                                //join p in con.PO_ItemDetail on q.PO_No equals p.PO_No
                                select new
                                {
                                    q.PO_No,
                                    q.PO_Title,
                                    c.Cust_Name,
                                    v.Name
                                    //p.POQty_PerItem
                                }).Distinct().ToList();

                if (viewData.Count > 0)
                {
                    var data = ViewBag.DDLPo = viewData.Select(x => new SelectListItem
                    {
                        Value = x.PO_No.ToString(),
                        Text = x.PO_No + " : " + x.Name + " : " + x.Cust_Name
                    }).Distinct().ToList();
                }
                else
                {
                    var data = ViewBag.DDLPo = viewData.Select(x => new SelectListItem
                    {
                        Value = "",
                        Text = "No Data Found"
                    }).ToList();
                }
            }
            
        }
        public void GetAllSupplier()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = obj.AllSupplier();
            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLSupplier = viewData.Select(x => new SelectListItem
                {
                    Value = x.vendor_code.ToString(),
                    Text = x.vendor_code + " : " + x.Name.ToString()
                }).ToList();
            }
            else
            {
                var data = ViewBag.DDLSupplier = viewData.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found"
                }).ToList();
            }
        }
        public void GetAllItemStock()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = obj.AllItemStock();
            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLItemStock = viewData.Select(x => new SelectListItem
                {
                    Value = x.Stock_no.ToString(),
                    Text = x.Stock_no + " : " + x.Brand_name.ToString()
                }).ToList();
            }
            else
            {
                var data = ViewBag.DDLItemStock = viewData.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found"
                }).ToList();
            }
        }
        public ActionResult GetPOInfo(string po)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var r = (from q in con.Purchase_Order
                     where  q.PO_No == po
                     select q).ToList();
            return Json(r);
        }
    }
}