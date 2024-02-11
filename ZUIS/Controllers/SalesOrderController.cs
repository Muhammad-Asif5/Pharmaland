using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZUIS.Common;
using ZUIS.Models;


namespace ZUIS.Controllers
{
    public class SalesOrderController : Controller
    {
        // GET: SalesOrder
        Entities con = new Entities();
        #region SalesOrder
        public ActionResult SalesOrder()
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
                    
                    GetAllItemStock();
                    GetAllCustomer();
                    GetAllPO();
                    var getSO = (from q in con.Sales_order
                                 select q.SO_No).ToList();
                    string MaxSO = "";
                    Session["BranchNo"] = "01";
                    var BranchNo = Session["BranchNo"];
                    int nYear = DateTime.Now.Year;

                    if (getSO.Count > 0)
                    {
                        string rMaxSO = con.Sales_order.Where(x => x.SO_No.Contains("-")).Select(x => x.SO_No).Max(); //01-1//01-2019001
                        int oYear = Convert.ToInt32(rMaxSO.Substring(3, 4));

                        if (nYear == oYear) //2018 == 2018
                        {
                            int no = int.Parse(rMaxSO.Substring(7));//001
                            no++;
                            MaxSO = string.Format("{0:000}", no);

                            var SaleOrderNo = oYear + "" + MaxSO;
                            ViewBag.BranchNo = BranchNo;
                            ViewBag.SONO = SaleOrderNo;
                        }
                        else
                        {
                            string No = "001";//1
                            var SaleOrderNo = nYear + "" + No;
                            ViewBag.BranchNo = BranchNo;
                            ViewBag.SONO = SaleOrderNo;
                        }

                    }
                    else
                    {
                        var SaleOrderNo = nYear + "" + "001";
                        ViewBag.SONO = SaleOrderNo;
                    }
                    return View(vm);
                }
            }
        }
        public JsonResult GetAddressofCust(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;
            //var r = con.Customers.Where(x => x.Customer_code == id).ToList();
            var r = (from da in con.Discount_Approval
                     join dad in con.Discount_ApprovalDET on new { da.vendor_code, da.Customer_code, da.SNO }
                     equals new { dad.vendor_code, dad.Customer_code, dad.SNO }
                     join c in con.Customers on da.Customer_code equals c.Customer_code
                     join i in con.Item_Stock on dad.Stock_no equals i.Stock_no
                     where c.Customer_code == id && da.Status == "Y"
                     select new
                     {
                         c.Customer_code,
                         c.Cust_Name,
                         c.Address,
                         i.Stock_no,
                         i.Brand_name,
                         da.Status,
                         da.Valid_Date_from,
                         da.Valid_Date_to,
                         dad.Q_Percentage,
                         dad.Q_Rate,
                         dad.D_Percentage,
                         dad.D_Rate,
                         dad.Cum_Dis,
                         dad.Expected_BsUnits,
                         i.Trade_PriceItem
                     }).ToList();

            return Json(r);
        }
        public JsonResult GetQuantityOfStock(string id, string CCode)
        {
            con.Configuration.ProxyCreationEnabled = false;
            //var r = con.Item_Stock.Where(x => x.Stock_no == id).ToList();
            var r = (from da in con.Discount_Approval
                     join dad in con.Discount_ApprovalDET on new { da.vendor_code, da.Customer_code, da.SNO }
                     equals new { dad.vendor_code, dad.Customer_code, dad.SNO }
                     join c in con.Customers on da.Customer_code equals c.Customer_code
                     join i in con.Item_Stock on dad.Stock_no equals i.Stock_no
                     where da.Customer_code==CCode && dad.Stock_no == id && da.Status == "Y"
                     select new
                     {
                         c.Customer_code,
                         c.Cust_Name,
                         c.Address,
                         i.Stock_no,
                         i.Units_PerItem,
                         i.Brand_name,
                         da.Status,
                         da.Valid_Date_from,
                         da.Valid_Date_to,
                         dad.Q_Percentage,
                         dad.Q_Rate,
                         dad.D_Percentage,
                         dad.D_Rate,
                         dad.Cum_Dis,
                         dad.Expected_BsUnits,
                         i.Trade_PriceItem
                     }).ToList();
            return Json(r);
        }
        public void GetAllCustomer()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = con.Customers.ToList();
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
        public void GetAllPO()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = (from q in con.Purchase_Order
                            //join p in con.PO_ItemDetail on q.PO_No equals p.PO_No
                            select new
                            {
                                q.PO_No,
                                q.PO_Title,
                                //p.POQty_PerItem
                            }).Distinct().ToList();

            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLPo = viewData.Select(x => new SelectListItem
                {
                    Value = x.PO_No.ToString(),
                    Text = x.PO_No + " : " + x.PO_Title.ToString()
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
        public ActionResult GetSOById(string id)
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
                var viewData = (from q in con.Sales_order
                                where q.SO_No == id
                                select q).FirstOrDefault();
                if (viewData != null)
                {
                    return Json(viewData, JsonRequestBehavior.AllowGet);
                }

            }
            return Json("0");
        }
        public ActionResult GetSODetailsInBox(string stock, string SONO)
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
                var viewData = (from q in con.SO_ItemDetail
                                join itemS in con.Item_Stock on q.Stock_no equals itemS.Stock_no
                                join p in con.Sales_order on q.SO_No equals p.SO_No
                                where q.SO_No == SONO && q.Stock_no == stock
                                select new
                                {
                                    q.SO_No,
                                    q.Stock_no,
                                    q.SOExtend_Price,
                                    q.SOMargin_Percentage,
                                    q.SOPrice_PerItem,
                                    q.SOQty_PerItem,
                                    itemS.Brand_name,
                                    itemS.Generic_name,
                                    q.Currency,
                                    q.CurrExch_rate,
                                    p.NET_Amount,
                                    p.Gross_Amount,
                                    p.Tax_Percentage,
                                    p.Disc_Percentage,
                                    q.Status,
                                    p.Customer_Code,
                                    p.Ship_toCustAddr,
                                    p.Delivery_date,
                                }).ToList();
                if (viewData != null)
                {
                    return Json(viewData, JsonRequestBehavior.AllowGet);
                }

            }
            return Json("No data found");
        }
        public void GetAllItemStock()
        {
            con.Configuration.ProxyCreationEnabled = false;

            //var viewData = con.Item_Stock.ToList();
            //var viewData = (from q in con.Item_Stock
            //                //join srD in con.Stock_ReceiptDET on q.Stock_no equals srD.Stock_no
            //                //where srD.Items_Available != 0 && srD.Items_Available != null && srD.Batch_NO != null
            //                select new
            //                {
            //                    q.Brand_name,
            //                    q.Stock_no
            //                    //srD.Stock_no,
            //                    //srD.Expiry_Date,
            //                    //srD.Items_Available,
            //                    //srD.Supp_Invno,
            //                }).ToList();
            var viewData = (from da in con.Discount_Approval
                             join dad in con.Discount_ApprovalDET on new { da.vendor_code, da.Customer_code, da.SNO }
                             equals new { dad.vendor_code, dad.Customer_code, dad.SNO }
                             join c in con.Customers on da.Customer_code equals c.Customer_code
                             join i in con.Item_Stock on dad.Stock_no equals i.Stock_no
                             where da.Status == "Y"
                             select new
                             {
                                 c.Customer_code,
                                 c.Cust_Name,
                                 c.Address,
                                 i.Stock_no,
                                 i.Units_PerItem,
                                 i.Brand_name,
                                 da.Status,
                                 da.Valid_Date_from,
                                 da.Valid_Date_to,
                                 dad.Q_Percentage,
                                 dad.Q_Rate,
                                 dad.D_Percentage,
                                 dad.D_Rate,
                                 dad.Cum_Dis,
                                 dad.Expected_BsUnits,
                                 i.Trade_PriceItem
                             }).ToList();
            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLItemStock = viewData.Select(x => new SelectListItem
                {
                    Value = x.Stock_no.ToString(),
                    Text = x.Brand_name.ToString() 
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
        public ActionResult SaveSaleOrder(Sales_order model)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string UserID = Session["UserID"] as string;

            UserID = "Muhammad Asif";
            if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                var viewData = (from q in con.Sales_order
                                where q.SO_No == model.SO_No
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        //model.PO_CreatedBy = UserID;

                        con.Sales_order.Add(model);
                        con.SaveChanges();
                        message = "Sales Order is Added Successfully";
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    viewData.SO_Date = model.SO_Date;
                    viewData.Status = model.Status;
                    viewData.CustPO_No = model.CustPO_No;
                    viewData.CustPO_Date = model.CustPO_Date;
                    viewData.Record_date = DateTime.Now;
                    viewData.Customer_Code = model.Customer_Code;
                    viewData.Ship_toCustAddr = model.Ship_toCustAddr;
                    viewData.Delivery_date = model.Delivery_date;

                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();

                    return Json(new { success = true, message = "Purchase Order is Updated" }, JsonRequestBehavior.AllowGet);
                }

            }
        }
        public ActionResult SaveSOItemDetails(SO_ItemDetail model)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string UserID = Session["UserID"] as string;
            string StockNo = model.Stock_no.Substring(0, 8);
            string InvNo = model.Stock_no.Substring(8);

            UserID = "123";
            if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                //BalanceAvailableItem(model.SOQty_PerItem,StockNo,InvNo);

                var viewData = (from q in con.SO_ItemDetail
                                where q.SO_No == model.SO_No
                                && q.Stock_no == StockNo
                                select q).FirstOrDefault();


                if (viewData == null)
                {
                    try
                    {
                        int SNO = 1;

                        var Count = con.SO_ItemDetail.Where(x => x.SO_No == model.SO_No && x.Stock_no == model.Stock_no).Select(x=>x.SO_No).ToList();
                        if (Count.Count > 0)
                        {
                            SNO++;
                        }
                        //if (model.POMargin_Percentage == null)
                        //{
                        //    model.POMargin_Percentage = 0;
                        //}
                        model.Status = "R";
                        model.Stock_no = StockNo;
                        //model.SNO = SNO;
                        con.SO_ItemDetail.Add(model);
                        con.SaveChanges();
                        message = "Sales Order is Added Successfully";
                        var data = (from q in con.SO_ItemDetail
                                    join s in con.Item_Stock on q.Stock_no equals s.Stock_no
                                    where q.Stock_no == StockNo && q.SO_No == model.SO_No
                                    select new
                                    {
                                        q.Stock_no,
                                        q.SO_No,
                                        s.Brand_name,
                                        s.Generic_name,
                                        q.SOQty_PerItem,
                                        q.SOPrice_PerItem,
                                        q.SOMargin_Percentage,
                                        q.SOExtend_Price,
                                        q.CurrExch_rate,
                                        q.Currency,
                                        q.Status,
                                    }).ToList();

                        decimal GrossAmount = 0;
                        decimal GABefMarg = 0;
                        //decimal Tax = 0;
                        decimal Disc = 0;
                        decimal NETAmount = 0;
                        var r = con.SO_ItemDetail.Where(x => x.SO_No == model.SO_No).ToList();
                        for (int i = 0; i < r.Count; i++)
                        {
                            if (r[i].SOMargin_Percentage == null)
                            {
                                GABefMarg = GABefMarg + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
                                GrossAmount = GrossAmount + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
                                //NETAmount = NETAmount + (decimal)r[i].POExtend_Price;
                            }
                            else
                            {
                                GABefMarg = GABefMarg + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
                                GrossAmount = GrossAmount + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
                                Disc = (decimal)((r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].SOMargin_Percentage / 100);
                                // NETAmount = NETAmount + (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) - Disc;
                                GrossAmount = GrossAmount - Disc;
                            }
                        }
                        var up = con.Sales_order.Where(x => x.SO_No == model.SO_No).FirstOrDefault();
                        up.Gross_Amount = GrossAmount;
                        //up.NET_Amount = NETAmount;

                        con.Entry(up).State = EntityState.Modified;
                        con.SaveChanges();
                        //message = "Stock is Updated Successfully";

                        List<decimal?> l = new List<decimal?>();

                        l.Add(GrossAmount);
                        l.Add(Disc);
                        l.Add(NETAmount);
                        l.Add(GABefMarg);

                        return Json(new { success = true, message = message, data = data, l = l }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Purchase Order is already Added with this Code" }, JsonRequestBehavior.AllowGet);
                }

            }
        }

        void BalanceAvailableItem(int Qty, string StokNo, string Inv)
        {
            var r = (from q in con.Stock_ReceiptDET
                     where q.Supp_Invno == Inv && q.Stock_no == StokNo
                     select q).FirstOrDefault();
            int lastQty = (int)r.Items_Available;
            int balance = lastQty - Qty;
            r.Items_Available = balance;

            con.Entry(r).State = EntityState.Modified;
            con.SaveChanges();
        }
        public ActionResult SaveNetAmount(decimal Disc, decimal Tax, decimal NET, string SONo)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string UserID = Session["UserID"] as string;

            UserID = "Muhammad Asif";
            if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                var viewData = (from q in con.Sales_order
                                where q.SO_No == SONo
                                select q).FirstOrDefault();
                if (viewData != null && Tax != 0 && Disc != 0)
                {
                    try
                    {
                        //model.PO_CreatedBy = UserID;

                        viewData.Tax_Percentage = Tax;
                        viewData.Disc_Percentage = Disc;
                        viewData.NET_Amount = NET;

                        con.Entry(viewData).State = EntityState.Modified;
                        con.SaveChanges();

                        message = "Successfully";

                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    try
                    {
                        //model.PO_CreatedBy = UserID;

                        viewData.Tax_Percentage = null;
                        viewData.Disc_Percentage = null;
                        viewData.NET_Amount = null;

                        con.Entry(viewData).State = EntityState.Modified;
                        con.SaveChanges();

                        message = "Successfully";

                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult UpdateSODetailsData(SO_ItemDetail model)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string UserID = Session["UserID"] as string;
            UserID = "123";
            string StockNo = model.Stock_no.Substring(0, 8);
            string InvNo = model.Stock_no.Substring(8);

            if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                var viewData = (from q in con.SO_ItemDetail
                                where q.SO_No == model.SO_No
                                && q.Stock_no == StockNo
                                select q).FirstOrDefault();
                if (viewData != null)
                {
                   // var sup=c
                    //BalanceAvailableItem(model.SOQty_PerItem, StockNo,InvNo);
                    try
                    {
                        var status = "R";
                        viewData.Currency = model.Currency;
                        viewData.CurrExch_rate = model.CurrExch_rate;
                        viewData.SOPrice_PerItem = model.SOPrice_PerItem;
                        viewData.SOQty_PerItem = model.SOQty_PerItem;
                        viewData.SOMargin_Percentage = model.SOMargin_Percentage;
                        viewData.SOExtend_Price = model.SOExtend_Price;
                        viewData.Status = status;

                        con.Entry(viewData).State = EntityState.Modified;
                        con.SaveChanges();
                        message = "Sales Order is Updated Successfully";
                        var data = (from q in con.SO_ItemDetail
                                    join s in con.Item_Stock on q.Stock_no equals s.Stock_no
                                    where q.Stock_no == StockNo && q.SO_No == model.SO_No
                                    select new
                                    {
                                        q.Stock_no,
                                        q.SO_No,
                                        s.Brand_name,
                                        s.Generic_name,
                                        q.Currency,
                                        q.CurrExch_rate,
                                        q.SOPrice_PerItem,
                                        q.SOQty_PerItem,
                                        q.SOMargin_Percentage,
                                        q.SOExtend_Price
                                    }).ToList();

                        decimal GrossAmount = 0;
                        //decimal Tax = 0;
                        decimal Disc = 0;
                        decimal NETAmount = 0;
                        decimal GABefMarg = 0;
                        var r = con.SO_ItemDetail.Where(x => x.SO_No == model.SO_No).ToList();
                        for (int i = 0; i < r.Count; i++)
                        {
                            GABefMarg = GABefMarg + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
                            GrossAmount = GrossAmount + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
                            Disc = (decimal)((r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].SOMargin_Percentage / 100);
                            // NETAmount = NETAmount + (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) - Disc;
                            GrossAmount = GrossAmount - Disc;
                        }
                        var up = con.Sales_order.Where(x => x.SO_No == model.SO_No).FirstOrDefault();
                        up.Gross_Amount = GrossAmount;
                        //up.Disc_Percentage = Disc;
                        //up.NET_Amount = NETAmount;

                        con.Entry(up).State = EntityState.Modified;
                        con.SaveChanges();
                        //message = "Stock is Updated Successfully";

                        List<decimal?> l = new List<decimal?>();
                        l.Add(GrossAmount);
                        l.Add(GABefMarg);
                        l.Add(Disc);
                        l.Add(NETAmount);


                        return Json(new { success = true, message = message, data = data, l = l }, JsonRequestBehavior.AllowGet);
                        //return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Purchase Order is already Added with this Code" }, JsonRequestBehavior.AllowGet);
                }

            }
        }
        public ActionResult LoadAllDataInTableByID(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;

            var r = (from q in con.SO_ItemDetail
                     join itemS in con.Item_Stock on q.Stock_no equals itemS.Stock_no
                     join p in con.Sales_order on q.SO_No equals p.SO_No
                     //where q.SO_No == SONO && q.Stock_no==stock
                     where q.SO_No == id
                     select new
                     {
                         q.SO_No,
                         q.Stock_no,
                         q.SOExtend_Price,
                         q.SOMargin_Percentage,
                         q.SOPrice_PerItem,
                         q.SOQty_PerItem,
                         itemS.Brand_name,
                         itemS.Generic_name,
                         q.Currency,
                         q.CurrExch_rate,
                         p.NET_Amount,
                         p.Gross_Amount,
                         p.Tax_Percentage,
                         p.Disc_Percentage,
                         q.Status,
                         p.Customer_Code,
                         p.Ship_toCustAddr,
                         p.Delivery_date,
                         p.SO_Date,
                         p.Record_date,
                         p.CustPO_Date,
                         p.CustPO_No
                     }).ToList();
            decimal GrossAmountBefMarg = 0;
            decimal Disc = 0;
            //for (int i = 0; i < r.Count; i++)
            //{
            //    if (r[i].SOMargin_Percentage == null)
            //    {
            //        GrossAmountBefMarg = GrossAmountBefMarg + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
            //        //NETAmount = NETAmount + (decimal)r[i].POExtend_Price;
            //    }
            //    else
            //    {
            //        GrossAmountBefMarg = GrossAmountBefMarg + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
            //        Disc = (decimal)((r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].SOMargin_Percentage / 100);
            //        // NETAmount = NETAmount + (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) - Disc;
            //        //GrossAmount = GrossAmount - Disc;
            //    }
            //}

            decimal gAmount = 0;
            for (int i = 0; i < r.Count; i++)
            {
                GrossAmountBefMarg = GrossAmountBefMarg + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
                gAmount = gAmount + (decimal)r[i].SOExtend_Price;
            }

            return Json(new { success = true, r = r, gAmount = gAmount, GrossAmountBefMarg = GrossAmountBefMarg }, JsonRequestBehavior.AllowGet);
            //return Json(new { success = true, r = r }, JsonRequestBehavior.AllowGet);
            //var jsonResult = Json(r, JsonRequestBehavior.AllowGet);
            //jsonResult.MaxJsonLength = int.MaxValue;
            //return jsonResult;
            // return Json(r);
        }
        public ActionResult DeleteSODetails(string SONo, string Stock_no)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string UserID = Session["UserID"] as string;
            List<decimal?> l = new List<decimal?>();

            UserID = "123";
            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                var viewData = (from q in con.SO_ItemDetail
                                where q.Stock_no == Stock_no && q.SO_No == SONo
                                select q).FirstOrDefault();

                try
                {
                    con.Entry(viewData).State = EntityState.Deleted;
                    con.SaveChanges();
                    message = "Sales Order is Deleted Successfully";
                    var r = con.SO_ItemDetail.Where(x => x.SO_No == SONo).ToList();
                    if (r.Count > 0)
                    {
                        decimal GrossAmount = 0;
                        //decimal Tax = 0;
                        decimal Disc = 0;
                        decimal NETAmount = 0;
                        decimal GABefMarg = 0;
                        //var r = con.SO_ItemDetail.Where(x => x.SO_No == SONo).ToList();
                        for (int i = 0; i < r.Count; i++)
                        {
                            GABefMarg = GABefMarg + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
                            GrossAmount = GrossAmount + (decimal)(r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate);
                            Disc = (decimal)((r[i].SOQty_PerItem * r[i].SOPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].SOMargin_Percentage / 100);
                            // NETAmount = NETAmount + (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) - Disc;
                            GrossAmount = GrossAmount - Disc;
                        }
                        var up = con.Sales_order.Where(x => x.SO_No == SONo).FirstOrDefault();
                        up.Gross_Amount = GrossAmount;
                        //up.Disc_Percentage = Disc;
                        //up.NET_Amount = NETAmount;

                        con.Entry(up).State = EntityState.Modified;
                        con.SaveChanges();
                        //message = "Stock is Updated Successfully";

                        
                        l.Add(GrossAmount);
                        l.Add(GABefMarg);
                        l.Add(Disc);
                        l.Add(NETAmount);
                    }
                    else
                    {
                        var up = con.Sales_order.Where(x => x.SO_No == SONo).FirstOrDefault();
                        con.Entry(up).State = EntityState.Deleted;
                        con.SaveChanges();
                        //delete
                    }
                    
                    return Json(new { success = true, message = message, l = l }, JsonRequestBehavior.AllowGet);

                    // return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }
        #endregion

        #region All SalesOrder
         public ActionResult AllSalesOrder()
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
         public ActionResult GetAllSOInTable()
         {
             con.Configuration.ProxyCreationEnabled = false;

             var r = (from q in con.Sales_order
                      join c in con.Customers on q.Customer_Code equals c.Customer_code
                      where q.SO_No != null
                      select new
                      {
                          q.SO_No,
                          c.Cust_Name,
                          q.CustPO_Date,
                          q.CustPO_No,
                          q.SO_Date,
                          q.PO_No,
                          q.Delivery_date,
                          q.Gross_Amount,
                          q.NET_Amount,
                          q.User_id,
                          q.Status
                      }).ToList();
             return Json(r);
             //var jsonResult = Json(r, JsonRequestBehavior.AllowGet);
             //jsonResult.MaxJsonLength = int.MaxValue;
             //return jsonResult;
         }
        #endregion

    }
}