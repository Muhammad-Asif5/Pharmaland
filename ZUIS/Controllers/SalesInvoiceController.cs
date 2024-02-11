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
    //SalesInvoice
    public class SalesInvoiceController : Controller
    {
        // GET: SalesInvoice
        Entities con = new Entities();
        #region SalesInvoice

        public ActionResult PostInvNo(string InvNo, string SupInv)
        {
            var r = (from q in con.Sale_Invoice
                     join sd in con.Sale_InvDET
                     on q.Invoice_no equals sd.Invoice_no
                     select new
                     {
                         q.Invoice_no,
                         q.Invoice_date,
                         sd.Stock_no,
                         sd.SQty,
                     }).ToList();
            
            if (r.Count > 0)
            {
                for (int i = 0; i < r.Count; i++)
                {
                    BalanceAvailableItem(r[i].SQty, r[i].Stock_no, r[i].Invoice_no,"Save"); 
                }
            }
            return Json("");
        }
        void BalanceAvailableItem(int Qty, string StokNo, string Inv,string Action)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var r = (from q in con.Stock_ReceiptDET
                     orderby q.Expiry_Date
                     where q.Supp_Invno == Inv && q.Stock_no == StokNo
                     select q).FirstOrDefault();

            if (Action == "Save")
            {
                if (r != null)
                {
                    int lastQty = (int)r.Items_Available;
                    int balance = lastQty - Qty;
                    r.Items_Available = balance;

                    con.Entry(r).State = EntityState.Modified;
                    con.SaveChanges();
                }
                else
                {
                    //var viewData1 = (from q in con.Sale_InvDET
                    //                 where q.Invoice_no == Inv && q.Stock_no==StokNo
                    //                 select q).FirstOrDefault();

                    //con.Entry(viewData1).State = EntityState.Deleted;
                    //con.SaveChanges();
                }
            }
            if (Action == "Remove")
            {
                if (r != null)
                {
                    int lastQty = (int)r.Items_Available;
                    int balance = lastQty + Qty;
                    r.Items_Available = balance;

                    con.Entry(r).State = EntityState.Modified;
                    con.SaveChanges();
                }
                else
                {
                    //var viewData1 = (from q in con.Sale_InvDET
                    //                 where q.Invoice_no == Inv && q.Stock_no==StokNo
                    //                 select q).FirstOrDefault();

                    //con.Entry(viewData1).State = EntityState.Deleted;
                    //con.SaveChanges();
                }
            }
            
            
        }
        public ActionResult getSOInfo(string so)
        {
            var r = (from q in con.Sales_order
                     join SO in con.SO_ItemDetail on q.SO_No equals SO.SO_No
                     join i in con.Item_Stock on SO.Stock_no equals i.Stock_no
                     where q.SO_No == so
                     select new
                     {
                         i.Brand_name,
                         i.Stock_no,
                         q.SO_No,
                         q.SO_Date,
                         SO.CurrExch_rate,
                         SO.SOPrice_PerItem,
                         SO.SOQty_PerItem,
                         SO.SOMargin_Percentage,
                         SO.SOExtend_Price,
                         q.Customer_Code,
                         q.Ship_toCustAddr,
                         q.Ship_toCustCity,
                         q.Delivery_date,
                     }).ToList();

            return Json(r);
        }
        public ActionResult getSOStockInDDL(string id, string SoNo)
        {
            var r = (from q in con.SO_ItemDetail
                     join i in con.Item_Stock on q.Stock_no equals i.Stock_no
                     where q.SO_No == SoNo && i.Stock_no==id
                     select new
                     {
                         i.Brand_name,
                         i.Stock_no,
                         q.SO_No,
                         q.CurrExch_rate,
                         q.SOPrice_PerItem,
                         q.SOQty_PerItem,
                         q.SOMargin_Percentage,
                         q.SOExtend_Price,
                     }).ToList();

            return Json(r);
        }

        public ActionResult SalesInvoice()
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
                    GetAllSO();
                    GetAllShipper();
                    var getPO = (from q in con.Sale_Invoice
                                 select q.Invoice_no).ToList();
                    //string MaxSup = "";
                    var NewNo = "";
                    int nYear = DateTime.Now.Year;
                    if (getPO.Count > 0)
                    {
                        string getMaxInvNo = con.Sale_Invoice.Select(x => x.Invoice_no).Max(); //01-1
                        var oYear = Convert.ToInt32(getMaxInvNo.Substring(0, 4));

                        if (nYear == oYear) //2018 == 2018
                        {
                            string No = getMaxInvNo.Substring(4);//1
                            int no = Convert.ToInt32(No);
                            no++;
                            NewNo = string.Format("{0:0000}", no);

                            ViewBag.Inv = oYear + "" + NewNo;
                        }
                        else
                        {
                            string No = "0001";//1
                            //NewNo = string.Format("{0:0000}", no);

                            ViewBag.Inv = nYear + "" + No;
                        }

                    }
                    else
                    {
                        ViewBag.Inv = nYear + "0001";
                    }

                    return View(vm);
                }
            }
        }

        //public JsonResult GetInfofCustomer(string id)
        //{
        //    con.Configuration.ProxyCreationEnabled = false;
        //    var r = con.Sales_order.Where(x => x.SO_No == id).ToList();

        //    return Json(r);
        //}
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
        public void GetAllSO()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = (from q in con.Sales_order
                            join c in con.Customers on q.Customer_Code equals c.Customer_code
                            where q.Status=="O"
                            select new
                            {
                                q.SO_No,
                                c.Cust_Name,
                                q.SO_Date,
                                q.Ship_toCustAddr,
                                q.Ship_toCustCity,
                                q.Customer_Code
                            }).ToList();

            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLSO = viewData.Select(x => new SelectListItem
                {
                    Value = x.SO_No.ToString(),
                    Text = x.SO_No +" ("+x.Cust_Name+" )"
                }).ToList();
            }
            else
            {
                var data = ViewBag.DDLSO = viewData.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found"
                }).ToList();
            }
        }
        public void GetAllShipper()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = (from q in con.Shippers
                            select new
                            {
                                q.Shipper_code,
                                q.Shipper_Name
                            }).ToList();

            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLShippers = viewData.Select(x => new SelectListItem
                {
                    Value = x.Shipper_code.ToString(),
                    Text = x.Shipper_Name
                }).ToList();
            }
            else
            {
                var data = ViewBag.DDLShippers = viewData.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found"
                }).ToList();
            }
        }
        public ActionResult GetInvoiceById(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var  r = (from q in con.Sale_Invoice
                   where q.Invoice_no == id
                   select q).ToList();

            return Json(r);
        }
        public ActionResult LoadAllDataInTableByID(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;

            var r = (from q in con.Sale_InvDET
                     join itemS in con.Item_Stock on q.Stock_no equals itemS.Stock_no
                     join p in con.Sale_Invoice on q.Invoice_no equals p.Invoice_no
                     //where q.SO_No == SONO && q.Stock_no==stock
                     where q.Invoice_no == id
                     select new
                     {
                         q.Invoice_no,
                         q.Stock_no,
                         q.SNO,
                         q.TSPrice_PerItem,
                         //q.SOMargin_Percentage,
                         //q.SOPrice_PerItem,
                         q.SPrice_PerItem,
                         q.SQty,
                         itemS.Brand_name,
                         itemS.Generic_name,
                         q.Currency_Rate,
                         p.Currency,
                         p.NET_Amount,
                         p.Gross_Amount,
                         p.Tax_Percentage,
                         p.Disc_Percentage,
                         q.Sold_Status,
                         p.Customer_Code,
                         p.Ship_toCustAddr,
                         p.Delivery_date,
                         p.SO_Date,
                         p.Record_date,
                         p.SO_No
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
                GrossAmountBefMarg = GrossAmountBefMarg + (decimal)(r[i].SQty * r[i].SPrice_PerItem * r[i].Currency_Rate);
                gAmount = gAmount + (decimal)r[i].TSPrice_PerItem;
            }

            return Json(new { success = true, r = r, gAmount = gAmount, GrossAmountBefMarg = GrossAmountBefMarg }, JsonRequestBehavior.AllowGet);
            //return Json(new { success = true, r = r }, JsonRequestBehavior.AllowGet);
            //var jsonResult = Json(r, JsonRequestBehavior.AllowGet);
            //jsonResult.MaxJsonLength = int.MaxValue;
            //return jsonResult;
            // return Json(r);
        }
        public JsonResult GetAllInvoiceInTableByDate(DateTime Invoice_date, DateTime Invoice_date1)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var r = (from si in con.Sale_Invoice
                     join c in con.Customers on si.Customer_Code equals c.Customer_code
                     //join v in con.Vendors on po.Vendor_code equals v.vendor_code
                     where si.Invoice_date >= Invoice_date && si.Invoice_date <= Invoice_date1
                     select new
                     {
                         si.Invoice_no,
                         c.Cust_Name,
                         si.Invoice_date,
                         si.SO_No,
                         si.Delivery_date,
                         si.Gross_Amount,
                         si.NET_Amount,
                         si.User_id,
                         si.Delivery_status,

                     }).ToList();
            return Json(r);
        }
        public ActionResult GetInvDetailsInBox(string stock,string InvNo, int SNO)
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
                var viewData = (from q in con.Sale_InvDET
                                join itemS in con.Item_Stock on q.Stock_no equals itemS.Stock_no
                                join p in con.Sale_Invoice on q.Invoice_no equals p.Invoice_no
                                where q.Invoice_no == InvNo && q.Stock_no == stock && q.SNO==SNO
                                select new
                                {
                                    q.Invoice_no,
                                    q.Stock_no,
                                    q.SNO,
                                    q.TSPrice_PerItem,
                                    q.SPrice_PerItem,
                                    q.Batch_NO,
                                    q.Expiry_Date,
                                    //q.SOMargin_Percentage,
                                    q.PPrice_PerItem,
                                    q.SQty,
                                    itemS.Brand_name,
                                    itemS.Generic_name,
                                    q.Currency_Rate,
                                    //q.CurrExch_rate,
                                    p.NET_Amount,
                                    p.Gross_Amount,
                                    p.Tax_Percentage,
                                    p.Disc_Percentage,
                                    q.Sold_Status,
                                    p.Customer_Code,
                                    p.Ship_toCustAddr,
                                    p.Delivery_date,
                                    q.Supp_InvNo,
                                    q.Supp_Invno1
                                }).ToList();
                var r = (from sr in con.Stock_Receipt
                         join srDET in con.Stock_ReceiptDET
                         on sr.Supp_Invno equals srDET.Supp_Invno
                         where srDET.Stock_no == stock && srDET.Items_Available != 0 && srDET.Items_Available != null
                         select new {
                             srDET.Supp_Invno,
                             srDET.Stock_no,
                             srDET.Items_Available,
                             sr.AltSupp_Invno,
                             srDET.Expiry_Date,
                             srDET.Batch_NO,
                         }).ToList();

                if (viewData != null)
                {
                    //var final = new { info[0].Supp_Invno, info[0].Stock_no,info[0].Batch_NO,info[0].Items_Available,info[0].Expiry_Date};
                    return Json(new {viewData, final = r }, JsonRequestBehavior.AllowGet);
                    //return Json(viewData, JsonRequestBehavior.AllowGet);
                }

            }
            return Json("No data found");
        }
        public ActionResult GetAllStockReceiptDELInTable(string id, string StockNo)
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
                var r = (from sr in con.Stock_Receipt
                         join srDET in con.Stock_ReceiptDET
                         on sr.Supp_Invno equals srDET.Supp_Invno
                         where sr.Supp_Invno == id && srDET.Stock_no == StockNo && srDET.Items_Available != 0 && srDET.Items_Available != null
                         select new
                         {
                             srDET.Supp_Invno,
                             srDET.Stock_no,
                             srDET.Items_Available,
                             sr.AltSupp_Invno,
                             srDET.Expiry_Date,
                             srDET.Batch_NO,
                         }).ToList();

                //var r = (from q in con.Stock_ReceiptDET
                //         where q.Supp_Invno == id && q.Stock_no==StockNo && q.Items_Available != 0 && q.Items_Available != null
                //         select new { 
                //         q.Supp_Invno,
                         
                //         q.Stock_no,
                //         q.Batch_NO,
                //         q.Items_Available,
                //         q.Expiry_Date,
                //         }).ToList();

                if (r.Count>0)
                {
                    return Json(r, JsonRequestBehavior.AllowGet);
                }

            }
            return Json("No data found");
        }

        //public ActionResult GetSOById(string id)
        //{
        //    con.Configuration.ProxyCreationEnabled = false;
        //    string message = string.Empty;
        //    string UserID = Session["UserID"] as string;

        //    UserID = "123";
        //    if (String.IsNullOrEmpty(UserID))
        //    {
        //        return RedirectToAction("Home", "Home");
        //    }
        //    else
        //    {
        //        var viewData = (from q in con.Sales_order
        //                        where q.SO_No == id
        //                        select q).FirstOrDefault();
        //        if (viewData != null)
        //        {
        //            return Json(viewData, JsonRequestBehavior.AllowGet);
        //        }

        //    }
        //    return Json("No data found");
        //}

        public void GetAllItemStock()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = con.Item_Stock.ToList();
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

        public ActionResult SaveSaleInvoice(Sale_Invoice model)
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
                var viewData = (from q in con.Sale_Invoice
                                where q.Invoice_no == model.Invoice_no
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    DateTime invDate = (DateTime)model.Delivery_date;
                    model.Invoice_date = invDate;
                    model.Record_date = DateTime.Now;
                    model.User_id = UserID;
                    try
                    {
                        //model.PO_CreatedBy = UserID;

                        con.Sale_Invoice.Add(model);
                        con.SaveChanges();

                        //var viewDa = (from q in con.Sale_Invoice
                        //                 where q.Invoice_no == model.Invoice_no
                        //                 select q).FirstOrDefault();
                        //viewDa.Delivery_status = "S";
                        //con.Entry(viewDa).State = EntityState.Modified;
                        //con.SaveChanges();
                        var viewData1 = (from q in con.Sale_InvDET
                                         where q.Invoice_no == model.Invoice_no
                                         select q).FirstOrDefault();
                        //var r = con.PO_ItemDetail.Where(x => x.PO_No == model.PO_NO).ToList();
                        var r = (from q in con.SO_ItemDetail
                                 join i in con.Item_Stock on q.Stock_no equals i.Stock_no
                                 where q.SO_No == model.SO_No
                                 select new
                                 {
                                     //i.Current_Price,
                                     q.Stock_no,
                                     q.SOPrice_PerItem,
                                     q.SOExtend_Price,
                                     q.SOQty_PerItem,
                                     q.CurrExch_rate,
                                     q.SOMargin_Percentage,
                                     //q.Qty_Pack
                                 }).ToList();


                        if (viewData1 == null && r.Count > 0)
                        {
                            for (int i = 0; i < r.Count; i++)
                            {
                                Sale_InvDET obj = new Sale_InvDET();
                                obj.Invoice_no = model.Invoice_no;
                                obj.Stock_no = r[i].Stock_no;
                                obj.SPrice_PerItem = r[i].SOPrice_PerItem;
                                obj.SQty = r[i].SOQty_PerItem;
                                //obj.PPrice_PerUnit = r[i].POExtend_Price;
                                obj.TSPrice_PerItem = r[i].SOExtend_Price;
                                obj.Currency_Rate = r[i].CurrExch_rate;
                               // obj.SOMargin_Percentage = r[i].SOMargin_Percentage;
                                obj.Sold_Status = "N";

                                con.Sale_InvDET.Add(obj);
                                con.SaveChanges();
                            }
                        }
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
                    DateTime invDate = (DateTime)model.Delivery_date;
                    viewData.Invoice_date = invDate;
                    viewData.Invoice_type = model.Invoice_type;
                    viewData.Delivery_status = model.Delivery_status;
                    viewData.Delivery_date = model.Delivery_date;
                    viewData.Contact_Person = model.Contact_Person;
                    viewData.Record_date = DateTime.Now;
                    viewData.User_id = UserID;

                    //viewData.Invoice_date = model.Invoice_date;
                    //viewData.Invoice_type = model.Invoice_type;
                    //viewData.Delivery_date = model.Delivery_date;
                    //viewData.SO_No = model.SO_No;
                    //viewData.SO_Date = model.SO_Date;
                    //viewData.Customer_Code = model.Customer_Code;
                    //viewData.Ship_toCustAddr = model.Ship_toCustAddr;
                    //viewData.Ship_toCustCity = model.Ship_toCustCity;
                    //viewData.Delivery_status = model.Delivery_status;
                    //viewData.Contact_Person = model.Contact_Person;
                    //viewData.Ship_Via = model.Ship_Via;
                    //viewData.Shipper_code = model.Shipper_code;
                    //viewData.Currency = model.Currency;

                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();

                    return Json(new { success = true, message = "Invoice is Updated" }, JsonRequestBehavior.AllowGet);
                }

            }
        }
        public ActionResult SaveSalesInvoiceDetails(Sale_InvDET model)
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
                var checkSrno = (from q in con.Sale_InvDET
                                where q.Invoice_no == model.Invoice_no
                                && q.Stock_no == model.Stock_no
                                select q.SNO).ToList();
                int SRNO = 0;
                if (checkSrno.Count > 0)
                {
                   SRNO = (int)checkSrno.Max();
                   SRNO++;
                }

                if (checkSrno !=null)
                {
                    try
                    {
                        model.SNO = SRNO;
                        model.Currency_Rate = 1;

                        //var status = "Y";
                        //viewData.SQty = model.SQty;
                        //viewData.SPrice_PerItem = model.SPrice_PerItem;
                        //viewData.TSPrice_PerItem = model.TSPrice_PerItem;
                        //viewData.Supp_InvNo = SupInv;
                        //viewData.Supp_Invno1 = model.Supp_Invno1;
                        //viewData.Batch_NO = model.Batch_NO;
                        //viewData.Expiry_Date = model.Expiry_Date;
                        //viewData.Sold_Status = status;

                        con.Entry(model).State = EntityState.Added;
                        con.SaveChanges();
                        message = "Added Successfully";

                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                        //return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = " already Added with this Code" }, JsonRequestBehavior.AllowGet);
                }

            }
        }
        public ActionResult UpdateSalInvDetailsData(Sale_InvDET model, string SupInv, string batch)
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
                var viewData = (from q in con.Sale_InvDET
                                where q.Invoice_no == model.Invoice_no
                                && q.Stock_no == model.Stock_no
                                && q.SNO == model.SNO
                                select q).FirstOrDefault();
                if (viewData != null)
                {
                    BalanceAvailableItem(model.SQty, model.Stock_no, SupInv,"Save");
                    try
                    {
                        var status = "Y";
                        viewData.SQty = model.SQty;
                        viewData.SPrice_PerItem = model.SPrice_PerItem;
                        viewData.TSPrice_PerItem = model.TSPrice_PerItem;
                        viewData.Supp_InvNo = SupInv;
                        viewData.Supp_Invno1 = model.Supp_Invno1;
                        viewData.Batch_NO = model.Batch_NO;
                        viewData.Expiry_Date = model.Expiry_Date;
                        viewData.Sold_Status = status;

                        con.Entry(viewData).State = EntityState.Modified;
                        con.SaveChanges();
                        message = "Updated Successfully";
                      
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                        //return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = " already Added with this Code" }, JsonRequestBehavior.AllowGet);
                }

            }
        }

        public ActionResult DeleteInvDetails(string InvoiceNo, string Stock_no, int SQty)
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
                var viewData = (from q in con.Sale_InvDET
                                where q.Stock_no == Stock_no && q.Invoice_no == InvoiceNo
                                select q).FirstOrDefault();

                try
                {
                    if (viewData.Expiry_Date != null)
                    {
                        BalanceAvailableItem(SQty, Stock_no, viewData.Supp_InvNo, "Remove");
                    }
                    con.Entry(viewData).State = EntityState.Deleted;
                    con.SaveChanges();
                    message = "Item is Deleted Successfully";
                    var r = con.Sale_InvDET.Where(x => x.Invoice_no == InvoiceNo).ToList();
                    if (r.Count > 0)
                    {
                        //
                    }
                    else
                    {
                        var up = con.Sale_Invoice.Where(x => x.Invoice_no == InvoiceNo).FirstOrDefault();
                        con.Entry(up).State = EntityState.Deleted;
                        con.SaveChanges();
                        //Delete
                    }

                     return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }
        #endregion

        #region Reports
        public ActionResult AllSalesInvoice()
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
        public ActionResult GetAllSInvInTable()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var r = (from q in con.Sale_Invoice
                     join c in con.Customers on q.Customer_Code equals c.Customer_code
                     where q.Invoice_no != null
                     select new
                     {
                         q.Invoice_no,
                         c.Cust_Name,
                         q.Invoice_date,
                         q.SO_No,
                         q.Delivery_date,
                         q.Gross_Amount,
                         q.NET_Amount,
                         q.User_id,
                         q.Delivery_status
                     }).ToList();
            return Json(r);
            //var jsonResult = Json(r, JsonRequestBehavior.AllowGet);
            //jsonResult.MaxJsonLength = int.MaxValue;
            //return jsonResult;
        }
        #endregion
        
    }
}