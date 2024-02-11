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
    public class PurchaseController : Controller
    {
        // GET: Purchase
        Entities con = new Entities();
        AllCommon cObj = new AllCommon();

        #region Purchase
        
        public ActionResult Purchase()
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
                    GetAllItemStock();
                    GetAllCustomer();
                    var getPO = (from q in con.Purchase_Order
                                 where q.Branch_No == Branch_No
                                 select q.PO_No).ToList();
                    string MaxPO = "";
                    if (getPO.Count > 0)
                    {
                        string rMaxPO = con.Purchase_Order.Where(x => x.Branch_No == Branch_No).Select(x => x.PO_No).Max(); //01-1
                        int no = int.Parse(rMaxPO.Substring(3));//1
                        no++;
                        MaxPO = no.ToString();
                    }
                    else
                    {
                        MaxPO = "1";
                    }
                    ViewBag.PO = MaxPO.ToString();

                    return View(vm);
                }
            }
        }
        public JsonResult GetAddressofCust(string VCode, string CCode)
        {
            con.Configuration.ProxyCreationEnabled = false;

            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
            //string Admin = Session["UserGroup"] as string;           // 10
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            DateTime dt = DateTime.Now;

            //var r = con.Customers.Where(x => x.Customer_code == id).ToList();
            var r = (from da in con.Discount_Approval
                     join dad in con.Discount_ApprovalDET on new { da.vendor_code, da.Customer_code, da.SNO }
                     equals new { dad.vendor_code, dad.Customer_code, dad.SNO }
                     join c in con.Customers on da.Customer_code equals c.Customer_code
                     join i in con.Item_Stock on dad.Stock_no equals i.Stock_no
                     where da.Customer_code == CCode && da.vendor_code==VCode && da.Valid_Date_to>=dt && da.Status=="Y"
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
        public ActionResult CalculateBottomDisc(decimal Disc, decimal Tax, decimal NET, string PONO)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
            //string Admin = Session["UserGroup"] as string;           // 10
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            if (String.IsNullOrEmpty(UserID) && ModelState.IsValid)
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                var viewData = (from q in con.Purchase_Order
                                where q.PO_No == PONO
                                select q).FirstOrDefault();
                if (viewData != null)
                {
                    try
                    {
                        viewData.PO_CreatedBy = UserID;

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
                        viewData.PO_CreatedBy = UserID;

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
        public JsonResult x(decimal Disc, decimal Tax, decimal NET, string PONO)
        {
            var data = (from q in con.Purchase_Order
                        where q.PO_No == PONO
                        select q).FirstOrDefault();
            if (data != null && Tax != 0 && Disc != 0)
            {
                var r = con.PO_ItemDetail.Where(x => x.PO_No == PONO).ToList();
                decimal NetAmount = 0;
                decimal Discount = 0;
                decimal Taxt = 0;
                for (int i = 0; i < r.Count; i++)
                {
                    NetAmount = NetAmount + (decimal)(r[i].POExtend_Price);
                }
                Taxt = NetAmount * (Tax / 100);
                Taxt = NetAmount - Taxt;
                Discount = Taxt * (Disc / 100);
                NetAmount = Taxt - Discount;

                data.Disc_Percentage = Disc;
                data.Tax_Percentage = Tax;
                data.NET_Amount = NetAmount;

                con.Entry(data).State = EntityState.Modified;
                con.SaveChanges();
                string message = "Amount Calculated";
                return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
            }


            return Json("");
        }
        public ActionResult GetAllPurchaseInTable(string PO_No)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
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
                    var r = (from q in con.PO_ItemDetail
                             join itemS in con.Item_Stock on q.Stock_no equals itemS.Stock_no
                             join p in con.Purchase_Order on q.PO_No equals p.PO_No
                             where q.PO_No == PO_No
                             select new
                             {
                                 q.PO_No,
                                 q.Stock_no,
                                 q.POExtend_Price,
                                 q.POMargin_Percentage,
                                 q.POPrice_PerItem,
                                 q.POQty_PerItem,
                                 itemS.Brand_name,
                                 itemS.Generic_name,
                                 q.Currency,
                                 q.CurrExch_rate,
                                 p.NET_Amount,
                                 p.Gross_Amount,
                                 p.Tax_Percentage,
                                 p.Disc_Percentage,
                                 p.PO_CreatedBy,
                                 q.Status,
                                 q.Qty_Pack
                             }).ToList();
                    //decimal gAmount = 0;
                    //for (int i = 0; i < r.Count; i++)
                    //{
                    //    gAmount = gAmount + (decimal)r[i].POExtend_Price;
                    //}
                    decimal GrossAmountBefMarg = 0;
                    decimal Disc = 0;
                    decimal gAmount = 0;
                    for (int i = 0; i < r.Count; i++)
                    {
                        //GrossAmountBefMarg = GrossAmountBefMarg + (decimal)(r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        GrossAmountBefMarg = GrossAmountBefMarg + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        gAmount = gAmount + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        Disc = (decimal)((r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].POMargin_Percentage / 100);
                        gAmount = gAmount - Disc;

                        // gAmount = gAmount + (decimal)r[i].POExtend_Price;
                    }
                    return Json(new { success = true, r = r, gAmount = gAmount, GrossAmountBefMarg = GrossAmountBefMarg }, JsonRequestBehavior.AllowGet);
                    //var jsonResult = Json(r, JsonRequestBehavior.AllowGet);
                    //jsonResult.MaxJsonLength = int.MaxValue;
                    //return jsonResult;
                    // return Json(r);
                }
                else
                {
                    var r = (from q in con.PO_ItemDetail
                             join itemS in con.Item_Stock on q.Stock_no equals itemS.Stock_no
                             join p in con.Purchase_Order on q.PO_No equals p.PO_No
                             where q.Branch_No == Branch_No && q.PO_No == PO_No
                             select new
                             {
                                 q.PO_No,
                                 q.Stock_no,
                                 q.POExtend_Price,
                                 q.POMargin_Percentage,
                                 q.POPrice_PerItem,
                                 q.POQty_PerItem,
                                 itemS.Brand_name,
                                 itemS.Generic_name,
                                 q.Currency,
                                 q.CurrExch_rate,
                                 p.NET_Amount,
                                 p.Gross_Amount,
                                 p.Tax_Percentage,
                                 p.Disc_Percentage,
                                 p.PO_CreatedBy,
                                 q.Status,
                                 q.Qty_Pack
                             }).ToList();
                    //decimal gAmount = 0;
                    //for (int i = 0; i < r.Count; i++)
                    //{
                    //    gAmount = gAmount + (decimal)r[i].POExtend_Price;
                    //}
                    decimal GrossAmountBefMarg = 0;
                    decimal Disc = 0;
                    decimal gAmount = 0;
                    for (int i = 0; i < r.Count; i++)
                    {
                        //GrossAmountBefMarg = GrossAmountBefMarg + (decimal)(r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        GrossAmountBefMarg = GrossAmountBefMarg + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        gAmount = gAmount + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        Disc = (decimal)((r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].POMargin_Percentage / 100);
                        gAmount = gAmount - Disc;

                        // gAmount = gAmount + (decimal)r[i].POExtend_Price;
                    }
                    return Json(new { success = true, r = r, gAmount = gAmount, GrossAmountBefMarg = GrossAmountBefMarg }, JsonRequestBehavior.AllowGet);
                    //var jsonResult = Json(r, JsonRequestBehavior.AllowGet);
                    //jsonResult.MaxJsonLength = int.MaxValue;
                    //return jsonResult;
                    // return Json(r);
                }
            }
        }
        public JsonResult GetAllPO()
        {
            var GetAllPO = (from q in con.Purchase_Order
                            select new
                            {
                                q.PO_No,
                                q.PO_Title
                            }).ToList();
            return Json(GetAllPO);
        }

        public ActionResult SavePO(Purchase_Order model)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
            //string Admin = Session["UserGroup"] as string;           // 10
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                var viewData = (from q in con.Purchase_Order
                                where q.Branch_No==Branch_No && q.PO_No == model.PO_No
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        model.Branch_No = Branch_No;
                        model.PO_CreatedBy = UserID;
                        model.PO_Title = "Purchase Order";
                        model.Received_Status = "N";

                        con.Purchase_Order.Add(model);
                        con.SaveChanges();
                        message = "Purchase Order is Added Successfully";
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    viewData.Vendor = model.Vendor;
                    viewData.Customer_Code = model.Customer_Code;
                    viewData.Ship_toCustAddr = model.Ship_toCustAddr;
                    viewData.Currency = model.Currency;
                    viewData.PO_Date = model.PO_Date;
                    viewData.Delivery_status = model.Delivery_status;
                    viewData.Comments = model.Comments;
                    viewData.Received_Status = model.Delivery_status;

                    viewData.Delivery_date = model.Delivery_date;
                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();

                    return Json(new { success = true, message = "Purchase Order is Updated" }, JsonRequestBehavior.AllowGet);
                }

            }
        }
        public ActionResult SavePOItemDetails(PO_ItemDetail model)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
            //string Admin = Session["UserGroup"] as string;           // 10
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                var viewData = (from q in con.PO_ItemDetail
                                where q.Branch_No==Branch_No && q.PO_No == model.PO_No
                                && q.Stock_no == model.Stock_no
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        //if (model.POMargin_Percentage == null)
                        //{
                        //    model.POMargin_Percentage = 0;
                        //}
                        //decimal op = (decimal)(model.POExtend_Price/model.Qty_Pack);
                        //model.POPrice_PerItem = op;
                        model.Branch_No = Branch_No;
                        con.PO_ItemDetail.Add(model);
                        con.SaveChanges();
                        message = "Purchase Order is Added Successfully";
                        var data = (from q in con.PO_ItemDetail
                                    join s in con.Item_Stock on q.Stock_no equals s.Stock_no
                                    where q.Stock_no == model.Stock_no && q.Branch_No==Branch_No && q.PO_No == model.PO_No
                                    select new
                                    {
                                        q.Qty_Pack,
                                        q.Stock_no,
                                        q.PO_No,
                                        s.Brand_name,
                                        s.Generic_name,
                                        q.POQty_PerItem,
                                        q.POPrice_PerItem,
                                        q.POMargin_Percentage,
                                        q.POExtend_Price,
                                        q.CurrExch_rate,
                                        q.Currency
                                    }).ToList();

                        decimal GrossAmount = 0;
                        decimal GABefMarg = 0;
                        //decimal Tax = 0;
                        decimal Disc = 0;
                        decimal NETAmount = 0;
                        var r = con.PO_ItemDetail.Where(x => x.Branch_No == Branch_No && x.PO_No== model.PO_No).ToList();
                        for (int i = 0; i < r.Count; i++)
                        {
                            //GABefMarg = GABefMarg + (decimal)(r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                            //GrossAmount = GrossAmount + (decimal)(r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                            //Disc = (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].POMargin_Percentage / 100);
                            //GrossAmount = GrossAmount - Disc;

                            GABefMarg = GABefMarg + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                            GrossAmount = GrossAmount + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                            Disc = (decimal)((r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].POMargin_Percentage / 100);
                            GrossAmount = GrossAmount - Disc;
                        }
                        var up = con.Purchase_Order.Where(x => x.Branch_No == Branch_No && x.PO_No == model.PO_No).FirstOrDefault();
                        up.Gross_Amount = GrossAmount;
                        //up. = GrossAmount;
                        up.NET_Amount = GrossAmount;
                        up.Disc_Percentage = 0;
                        up.Tax_Percentage = 0;

                        con.Entry(up).State = EntityState.Modified;
                        con.SaveChanges();
                        //decimal GrossAmount = 0;
                        //decimal Disc = 0;
                        //decimal NETAmount = 0;
                        //var r = con.PO_ItemDetail.Where(x => x.PO_No == model.PO_No).ToList();
                        //for (int i = 0; i < r.Count; i++)
                        //{
                        //    if (r[i].POMargin_Percentage == null)
                        //    {
                        //        GrossAmount = GrossAmount + (decimal)(r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        //        //NETAmount = NETAmount + (decimal)r[i].POExtend_Price;
                        //    }
                        //    else
                        //    {
                        //       GrossAmount = GrossAmount + (decimal)(r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        //       Disc = (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].POMargin_Percentage / 100);
                        //      // NETAmount = NETAmount + (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) - Disc;
                        //    }                       
                        //}
                        //var up = con.Purchase_Order.Where(x => x.PO_No == model.PO_No).FirstOrDefault();
                        //up.Gross_Amount = GrossAmount;
                        ////up.NET_Amount = NETAmount;

                        //con.Entry(up).State = EntityState.Modified;
                        //con.SaveChanges();
                        //message = "Stock is Updated Successfully";

                        List<decimal?> l = new List<decimal?>();
                        List<string> PoInfo = new List<string>();
                        l.Add(GrossAmount);
                        l.Add(Disc);
                        l.Add(NETAmount);
                        l.Add(GABefMarg);

                        PoInfo.Add(up.PO_CreatedBy);
                        PoInfo.Add(up.PO_Dept_code);
                        PoInfo.Add(up.HOD_ApprovedBy.ToString());

                        return Json(new { success = true, message = message, data = data, l = l, PoInfo = PoInfo }, JsonRequestBehavior.AllowGet);
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

        public ActionResult UpdatePODetailsData(PO_ItemDetail model)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
            //string Admin = Session["UserGroup"] as string;           // 10
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                var viewData = (from q in con.PO_ItemDetail
                                where q.PO_No == model.PO_No
                                && q.Stock_no == model.Stock_no
                                select q).FirstOrDefault();
                if (viewData != null)
                {
                    try
                    {
                        viewData.Qty_Pack = model.Qty_Pack;
                        viewData.POQty_PerItem = model.POQty_PerItem;
                        viewData.POPrice_PerItem = model.POPrice_PerItem;
                        viewData.Currency = model.Currency;
                        viewData.CurrExch_rate = model.CurrExch_rate;
                        viewData.POMargin_Percentage = model.POMargin_Percentage;
                        viewData.POExtend_Price = model.POExtend_Price;
                        viewData.Qty_Pack = model.Qty_Pack;

                        con.Entry(viewData).State = EntityState.Modified;
                        con.SaveChanges();
                        message = "Purchase Order is Updated Successfully";
                        var data = (from q in con.PO_ItemDetail
                                    join s in con.Item_Stock on q.Stock_no equals s.Stock_no
                                    where q.Stock_no == model.Stock_no && q.PO_No == model.PO_No
                                    select new
                                    {
                                        q.Stock_no,
                                        q.PO_No,
                                        s.Brand_name,
                                        s.Generic_name,
                                        q.POQty_PerItem,
                                        q.POPrice_PerItem,
                                        q.POMargin_Percentage,
                                        q.POExtend_Price,
                                        q.CurrExch_rate,
                                        q.Currency
                                    }).ToList();

                        decimal GrossAmount = 0;
                        //decimal Tax = 0;
                        decimal Disc = 0;
                        decimal NETAmount = 0;
                        decimal GABefMarg = 0;
                        var r = con.PO_ItemDetail.Where(x => x.PO_No == model.PO_No).ToList();
                        for (int i = 0; i < r.Count; i++)
                        {
                            //GABefMarg = GABefMarg + (decimal)(r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                            //GrossAmount = GrossAmount + (decimal)(r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                            //Disc = (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].POMargin_Percentage / 100);
                            //GrossAmount = GrossAmount - Disc;
                            GABefMarg = GABefMarg + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                            GrossAmount = GrossAmount + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                            Disc = (decimal)((r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].POMargin_Percentage / 100);
                            GrossAmount = GrossAmount - Disc;
                        }
                        var up = con.Purchase_Order.Where(x => x.PO_No == model.PO_No).FirstOrDefault();
                        up.Gross_Amount = GrossAmount;
                        //up.Disc_Percentage = Disc;
                        up.NET_Amount = GrossAmount;
                        up.Disc_Percentage = 0;
                        up.Tax_Percentage = 0;

                        con.Entry(up).State = EntityState.Modified;
                        con.SaveChanges();
                        //decimal GrossAmount = 0;
                        //decimal Disc = 0;
                        //decimal NETAmount = 0;
                        //var r = con.PO_ItemDetail.Where(x => x.PO_No == model.PO_No).ToList();
                        //for (int i = 0; i < r.Count; i++)
                        //{
                        //    if (r[i].POMargin_Percentage == null)
                        //    {
                        //        GrossAmount = GrossAmount + (decimal)(r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        //        NETAmount = NETAmount + (decimal)r[i].POExtend_Price;
                        //    }
                        //    else
                        //    {
                        //        GrossAmount = GrossAmount + (decimal)(r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                        //        Disc = (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].POMargin_Percentage / 100);
                        //        NETAmount = NETAmount + (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) - Disc;
                        //    }   
                        //}
                        //var up = con.Purchase_Order.Where(x => x.PO_No == model.PO_No).FirstOrDefault();
                        //up.Gross_Amount = GrossAmount;
                        //up.Disc_Percentage = Disc;
                        //up.NET_Amount = NETAmount;

                        //con.Entry(up).State = EntityState.Modified;
                        //con.SaveChanges();
                        //message = "Stock is Updated Successfully";

                        List<decimal?> l = new List<decimal?>();
                        l.Add(GrossAmount);
                        l.Add(GABefMarg);
                        l.Add(up.Disc_Percentage);
                        l.Add(up.NET_Amount);

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
        public ActionResult ApprovedPO(string PO_No)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
            string UserGroup = Session["UserGroup"] as string;           // 10
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

           
            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                var viewData = (from q in con.Purchase_Order
                                where q.Branch_No == Branch_No && q.PO_No == PO_No
                                select q).FirstOrDefault();
                if (viewData != null)
                {
                    if (UserGroup == "10")
                    {
                        try
                        {
                            viewData.HOD_ApprovedBy = Convert.ToInt32(Emp_Code);

                            con.Entry(viewData).State = EntityState.Modified;
                            con.SaveChanges();
                            message = "Purchase Order is Approved Successfully";
                            return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                        }
                        catch (Exception ex)
                        {
                            return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                        }
                    }
                    else
                    {
                        return Json(new { success = false, message = "You are not authorize" }, JsonRequestBehavior.AllowGet);
                    }

                    //if (UserType == "HOD")
                    //{
                    //    try
                    //    {
                    //        viewData.HOD_ApprovedBy = Convert.ToInt32(Emp_Code);

                    //        con.Entry(viewData).State = EntityState.Modified;
                    //        con.SaveChanges();
                    //        message = "Purchase Order is Approved Successfully";
                    //        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    //    }
                    //    catch (Exception ex)
                    //    {
                    //        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    //    }
                    //}
                    //else
                    //{
                    //    try
                    //    {
                    //        viewData.DIR_ApprovedBy = Convert.ToInt32(Emp_Code);

                    //        con.Entry(viewData).State = EntityState.Modified;
                    //        con.SaveChanges();
                    //        message = "Purchase Order is Approved Successfully";
                    //        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    //    }
                    //    catch (Exception ex)
                    //    {
                    //        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    //    }
                    //}

                }
                else
                {
                    return Json(new { success = false, message = "Purchase Order is already Added with this Code" }, JsonRequestBehavior.AllowGet);
                }

            }
        }
        public ActionResult DeletePODetails(string PONo, string Stock_no)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
            string UserGroup = Session["UserGroup"] as string;           // 10
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            List<decimal?> l = new List<decimal?>();

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                var viewData = (from q in con.PO_ItemDetail
                                where q.Branch_No ==Branch_No && q.Stock_no == Stock_no && q.PO_No == PONo
                                select q).FirstOrDefault();

                try
                {
                    con.Entry(viewData).State = EntityState.Deleted;
                    con.SaveChanges();
                    message = "Purchase Order is Deleted Successfully";
                    var r = con.PO_ItemDetail.Where(x => x.PO_No == PONo).ToList();
                    if (r.Count > 0)
                    {
                        decimal GrossAmount = 0;
                        //decimal Tax = 0;
                        decimal Disc = 0;
                        decimal NETAmount = 0;
                        decimal GABefMarg = 0;
                       
                        for (int i = 0; i < r.Count; i++)
                        {
                            GABefMarg = GABefMarg + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                            GrossAmount = GrossAmount + (decimal)(r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate);
                            Disc = (decimal)((r[i].Qty_Pack * r[i].POPrice_PerItem * r[i].CurrExch_rate)) * (decimal)(r[i].POMargin_Percentage / 100);
                            // NETAmount = NETAmount + (decimal)((r[i].POQty_PerItem * r[i].POPrice_PerItem * r[i].CurrExch_rate)) - Disc;
                            GrossAmount = GrossAmount - Disc;
                        }
                        var up = con.Purchase_Order.Where(x => x.PO_No == PONo).FirstOrDefault();
                        up.Gross_Amount = GrossAmount;
                        up.Disc_Percentage = null;
                        up.NET_Amount = GrossAmount;
                        up.Tax_Percentage = null;

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
                        var up = con.Purchase_Order.Where(x => x.PO_No == PONo).FirstOrDefault();
                        con.Entry(up).State = EntityState.Deleted;
                        con.SaveChanges();
                        // delete
                    }
                    return Json(new { success = true, message = message, l = l }, JsonRequestBehavior.AllowGet);
                    //return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = false, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }
        public ActionResult GetPODetailsById(string PoNo, string Stockno)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
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
                    var viewData = (from q in con.PO_ItemDetail
                                    join i in con.Item_Stock
                                    on q.Stock_no equals i.Stock_no
                                    where q.PO_No == PoNo && q.Stock_no == Stockno
                                    select new
                                    {
                                        q.PO_No,
                                        q.Stock_no,
                                        q.POQty_PerItem,
                                        q.POPrice_PerItem,
                                        q.Currency,
                                        q.CurrExch_rate,
                                        q.POMargin_Percentage,
                                        q.POExtend_Price,
                                        i.Units_PerItem,
                                        q.Qty_Pack

                                    }).ToList();
                    return Json(viewData);
                }
                else
                {
                    var viewData = (from q in con.PO_ItemDetail
                                    join i in con.Item_Stock
                                    on q.Stock_no equals i.Stock_no
                                    where q.Branch_No == Branch_No && q.PO_No == PoNo && q.Stock_no == Stockno
                                    select new
                                    {
                                        q.PO_No,
                                        q.Stock_no,
                                        q.POQty_PerItem,
                                        q.POPrice_PerItem,
                                        q.Currency,
                                        q.CurrExch_rate,
                                        q.POMargin_Percentage,
                                        q.POExtend_Price,
                                        i.Units_PerItem,
                                        q.Qty_Pack

                                    }).ToList();
                    return Json(viewData);
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
        public void GetAllItemStock()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = con.Item_Stock.ToList();
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

        public ActionResult ViewByParameter(string PO_No)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
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
                    var r = (from q in con.Purchase_Order
                             where q.PO_No == PO_No
                             select new
                             {
                                 q.Vendor_code,
                                 q.Customer_Code,
                                 q.Currency,
                                 q.Delivery_status,
                                 q.PO_No,
                                 q.Ship_toCustAddr,
                                 q.Delivery_date,
                                 q.PO_Date,
                                 q.Comments,
                                 q.Received_Status,
                             }).ToList();
                    return Json(r);
                }
                else
                {
                    var r = (from q in con.Purchase_Order
                             where q.Branch_No == Branch_No && q.PO_No == PO_No
                             select new
                             {
                                 q.Vendor_code,
                                 q.Customer_Code,
                                 q.Currency,
                                 q.Delivery_status,
                                 q.PO_No,
                                 q.Ship_toCustAddr,
                                 q.Delivery_date,
                                 q.PO_Date,
                                 q.Comments,
                                 q.Received_Status,
                             }).ToList();
                    return Json(r);
                }
            }
        }
        public ActionResult mAsReceived(string PONo, bool check)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserBranch = Session["Branch_No"] as string;      // 123
            string UserGroup = Session["UserGroup"] as string;           // 10
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                var viewData = (from q in con.Purchase_Order
                                where q.PO_No == PONo
                                select q).FirstOrDefault();
                if (viewData != null)
                {
                    try
                    {
                        if (check == true)
                        {
                            viewData.Received_Status = "Y";
                            con.Entry(viewData).State = EntityState.Modified;
                            con.SaveChanges();
                            message = "Received Successfuly";
                        }
                        else
                        {
                            viewData.Received_Status = "N";
                            con.Entry(viewData).State = EntityState.Modified;
                            con.SaveChanges();
                            message = "Not Received Successfuly";
                        }
                       
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false}, JsonRequestBehavior.AllowGet);
                }
                
            }
        }

        #endregion
        
    }
}