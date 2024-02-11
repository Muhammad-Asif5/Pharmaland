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
    public class ApprovalRateController : Controller
    {
        // GET: ApprovalRate
        Entities con = new Entities();
        DateTime dateFrom;
        DateTime dateTo;
        string date_From;
        string date_To;

        #region ApprovalRate
        public ActionResult ApprovalRate()
        {
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            //var check = cObj.CheckAutentication(UserID, Branch_No);

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                string actionName = this.ControllerContext.RouteData.Values["action"].ToString();
                string ControName = this.ControllerContext.RouteData.Values["controller"].ToString();

                bool authorize =AllCommon.CheckAuthorization(UserID, actionName, ControName);

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

                List<Disc_Appr_Vend_Cust> listObj = new List<Disc_Appr_Vend_Cust>();

                var r = (from v in con.Vendors
                         join da in con.Discount_Approval
                         on v.vendor_code equals da.vendor_code
                         join c in con.Customers on da.Customer_code equals c.Customer_code
                         select new
                         {
                             v.Name,
                             c.Cust_Name,
                             da.vendor_code,
                             da.Customer_code,
                             da.SNO,
                             da.Valid_Date_from,
                             da.Valid_Date_to,
                             da.Status
                         }).ToList();
                for (int i = 0; i < r.Count; i++)
                {
                    Disc_Appr_Vend_Cust obj = new Disc_Appr_Vend_Cust();
                    dateFrom = (DateTime)r[i].Valid_Date_from;
                    dateTo = (DateTime)r[i].Valid_Date_to;

                    date_From = dateFrom.ToString("dd/MMM/yyy");
                    date_To = dateTo.ToString("dd/MMM/yyy");

                    obj.Name = r[i].Name;
                    obj.vendor_code = r[i].vendor_code;
                    obj.Cust_Name = r[i].Cust_Name;
                    obj.Customer_code = r[i].Customer_code;
                    obj.SNO = r[i].SNO;
                    obj.Valid_Date_from = date_From;
                    obj.Valid_Date_to = date_To;
                    obj.Status = r[i].Status;

                    listObj.Add(obj);
                }

                GetAllVendor();
                GetAllItemStock();
                GetAllCustomer();

                ViewBag.Data = listObj;
                return View(vm);
            }
        }}

        public ActionResult LoadAllRateInTable()
        {
            var r = (from v in con.Vendors join da in con.Discount_Approval
                                           on v.vendor_code equals da.vendor_code
                                           join c in con.Customers on da.Customer_code equals c.Customer_code
                     select new
                     {
                         v.Name,
                         c.Cust_Name,
                         da.vendor_code,
                         da.Customer_code,
                         da.SNO,
                         da.Valid_Date_from,
                         da.Valid_Date_to,
                         da.Status
                     }).ToList();
            return Json(r,JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetARByID(string vCode, string CCode, string no)
        {
            con.Configuration.ProxyCreationEnabled = false;

            string UserID = Session["UserID"] as string;

            UserID = "123";
            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                int sno = int.Parse(no);

                var r = (from q in con.Discount_Approval
                         where q.vendor_code == vCode && q.Customer_code == CCode && q.SNO == sno
                         select q).ToList();

                return Json(r);
            }
        }
        public ActionResult SaveAR(Discount_Approval model)
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

                var viewData = (from q in con.Discount_Approval
                                where q.vendor_code == model.vendor_code
                                && q.Customer_code == model.Customer_code
                                && q.SNO==model.SNO
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        var total =(from q in con.Discount_Approval
                                     where q.vendor_code == model.vendor_code
                                     && q.Customer_code == model.Customer_code
                                    select q.SNO).ToList();
                        int sno = 0;
                        if (total.Count > 0)
                        {
                            sno = total.Max();
                            sno++;
                        }
                        else
                            sno = 1;

                        model.SNO = sno;
                        con.Discount_Approval.Add(model);
                        con.SaveChanges();
                        message = "Approval Rate is Added Successfully";
                        var info= (from da in con.Discount_Approval
                         join v in con.Vendors
                             on da.vendor_code equals v.vendor_code
                         join c in con.Customers on da.Customer_code equals c.Customer_code
                         where da.vendor_code == model.vendor_code && da.Customer_code == model.Customer_code && da.SNO==sno
                         select new
                         {
                             v.Name,
                             c.Cust_Name,
                             da.vendor_code,
                             da.Customer_code,
                             da.SNO,
                             da.Valid_Date_from,
                             da.Valid_Date_to,
                             da.Status,
                         }).ToList();
                        var id = info[0].vendor_code + info[0].Customer_code + info[0].SNO;

                        var final = new { info[0].Cust_Name, info[0].Name,id};
                        return Json(new { success = true, message = message, final = final }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    viewData.Valid_Date_from = model.Valid_Date_from;
                    viewData.Valid_Date_to = model.Valid_Date_to;
                    viewData.Status = model.Status;

                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();

                    return Json(new { success = true, message = "Approval Rate has been Updated" }, JsonRequestBehavior.AllowGet);
                }

            }
        }
        public ActionResult DeleteDisAproval(string Vcode,string Ccode, int Sno)
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

                var viewData = (from q in con.Discount_Approval
                                where q.vendor_code == Vcode
                                && q.Customer_code == Ccode
                                && q.SNO == Sno
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    return Json(new { success = true, message = "" }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    try
                    {
                        con.Entry(viewData).State = EntityState.Deleted;
                        con.SaveChanges();
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }

                    return Json(new { success = true, message = "Approval Rate has been Deleted" }, JsonRequestBehavior.AllowGet);
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

        #endregion

        #region ApprovalRateDetails
        public ActionResult ApprovalRateDetails()
        {
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            //var check = cObj.CheckAutentication(UserID, Branch_No);

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

                    return View(vm);
                }
            }
        }

        public ActionResult LoadAllRateDetailsInTable(string vc_cc_sn)
        {
            con.Configuration.ProxyCreationEnabled = false;

            string UserID = Session["UserID"] as string;

            UserID = "123";
            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                string vendorCode = vc_cc_sn.Substring(0, 3);
                string customerCode = vc_cc_sn.Substring(3, 3);
                int sno = int.Parse(vc_cc_sn.Substring(6));

                var r = (from da in con.Discount_Approval
                         join dad in con.Discount_ApprovalDET on new {da.vendor_code,da.Customer_code,da.SNO}
                         equals new{dad.vendor_code,dad.Customer_code,dad.SNO}
                         join v in con.Vendors
                             on da.vendor_code equals v.vendor_code
                         join c in con.Customers on da.Customer_code equals c.Customer_code
                         join i in con.Item_Stock on dad.Stock_no equals i.Stock_no
                         where da.vendor_code == vendorCode && da.Customer_code == customerCode && da.SNO == sno
                         select new
                         {
                             v.Name,
                             c.Cust_Name,
                             i.Brand_name,
                             i.Trade_PriceItem,
                             da.vendor_code,
                             da.Customer_code,
                             da.SNO,
                             da.Valid_Date_from,
                             da.Valid_Date_to,
                             da.Status,
                             dad.Stock_no,
                             dad.Q_Percentage,
                             dad.Q_Rate,
                             dad.D_Percentage,
                             dad.D_Rate,
                             dad.Cum_Dis,
                             dad.Expected_BsUnits
                         }).ToList();
                return Json(r);
            }
        }
        public ActionResult GetARDetail(string VCode, string CCode, string StockNo, string SNO)
        {
            con.Configuration.ProxyCreationEnabled = false;

            string UserID = Session["UserID"] as string;

            UserID = "123";
            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
               int sno = int.Parse(SNO);

               var info = (from q in con.Discount_ApprovalDET
                           join i in con.Item_Stock on q.Stock_no equals i.Stock_no
                           where q.vendor_code == VCode
                           && q.Customer_code == CCode
                           && q.SNO == sno
                           && q.Stock_no == StockNo
                           select new
                           {
                               q.Stock_no,
                               q.Q_Percentage,
                               q.Q_Rate,
                               q.D_Percentage,
                               q.D_Rate,
                               q.Cum_Dis,
                               q.Expected_BsUnits,
                               i.Trade_PriceItem
                           }).ToList();
                if (info.Count>0)
                {
                    return Json(info);
                }
                return Json("");
            }
        }
        public ActionResult EditUpdateARDetail(Discount_ApprovalDET model, string VCode, string CCode, string SNO)
        {
            con.Configuration.ProxyCreationEnabled = false;

            string UserID = Session["UserID"] as string;
            string message = string.Empty;

            UserID = "123";
            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                int sno = int.Parse(SNO);

                var info = (from q in con.Discount_ApprovalDET
                            where q.vendor_code == VCode
                            && q.Customer_code == CCode
                            && q.SNO == sno
                            && q.Stock_no == model.Stock_no
                            select q).FirstOrDefault();
                if (info == null)
                {
                    //Add
                    model.SNO = int.Parse(SNO);
                    model.Customer_code = CCode;
                    model.vendor_code = VCode;

                    con.Entry(model).State = EntityState.Added;
                    con.SaveChanges();
                    message = "Added Success";
                    var i = (from d in con.Discount_Approval
                             join c in con.Customers on d.Customer_code equals c.Customer_code
                             join v in con.Vendors on d.vendor_code equals v.vendor_code
                             where d.vendor_code==VCode && d.Customer_code ==CCode && d.SNO==sno
                             select new
                             {
                                 d.Customer_code,
                                 d.vendor_code,
                                 d.SNO,
                                 c.Cust_Name,
                                 v.Name
                             }).ToList();
                    var bName = con.Item_Stock.Where(x => x.Stock_no == model.Stock_no).FirstOrDefault();
                    return Json(new { success = true, message = message, id = i, bName = bName.Brand_name,TP=bName.Trade_PriceItem }, JsonRequestBehavior.AllowGet);
                    //return Json(message);
                }
                else
                {
                    //Update
                    info.Q_Percentage = model.Q_Percentage;
                    info.Q_Rate = model.Q_Rate;
                    info.D_Percentage = model.D_Percentage;
                    info.D_Rate = model.D_Rate;
                    info.Cum_Dis = model.Cum_Dis;
                    info.Expected_BsUnits = model.Expected_BsUnits;

                    con.Configuration.ValidateOnSaveEnabled = false;
                    con.SaveChanges();
                    message = "Updated Success";
                    return Json(message);
                }
            }
        }
       
        public ActionResult DeleteDisAprovalDetails(string VCode, string CCode, string StockNo, string SNO)
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
                int sno = int.Parse(SNO);
                var viewData = (from q in con.Discount_ApprovalDET
                                where q.vendor_code == VCode
                                && q.Customer_code == CCode
                                && q.SNO == sno
                                && q.Stock_no == StockNo
                                select q).FirstOrDefault();

                if (viewData == null)
                {
                    return Json(new { success = true, message = "" }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    try
                    {
                        con.Entry(viewData).State = EntityState.Deleted;
                        con.SaveChanges();
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }

                    return Json(new { success = true, message = "Approval Rate has been Deleted" }, JsonRequestBehavior.AllowGet);
                }

            }
        }

        public JsonResult GetQuantityOfStock(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;
            //var r = con.Item_Stock.Where(x => x.Stock_no == id).ToList();
            var r = (from da in con.Item_Stock
                     where da.Stock_no == id && da.Available_status == "Y"
                     select new
                     {
                         da.Stock_no,
                         da.Brand_name,
                         da.Generic_name,
                         da.Trade_PriceItem,
                         da.Units_PerItem
                     }).ToList();
            return Json(r);
        }
        #endregion
    }
}