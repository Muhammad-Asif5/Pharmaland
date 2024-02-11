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
    public class POListController : Controller
    {
        // GET: POList
        Entities con = new Entities();
        public ActionResult POList()
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
        public ActionResult GetAllPOInTable()
        {
            con.Configuration.ProxyCreationEnabled = false;
            string UserID = Session["UserID"] as string;
            string UserBranch = Session["Branch_No"] as string;
            string UserType = Session["UserType"] as string;           // Admin
            var BCode = Session["Branch_No"].ToString();

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                if (UserType == "Admin")
                {
                    var r = (from po in con.Purchase_Order
                             join v in con.Vendors on po.Vendor_code equals v.vendor_code
                             join c in con.Customers on po.Customer_Code equals c.Customer_code
                             //join b in con.Branch_Master on po.PO_No.Substring(0,2) equals b.Branch_No
                             join b in con.Branch_Master on po.Branch_No equals b.Branch_No
                             orderby po.PO_Date descending
                             select new
                             {
                                 b.Branch_Abbr,
                                 po.PO_No,
                                 c.Cust_Name,
                                 po.PO_Title,
                                 po.PO_Date,
                                 po.Delivery_date,
                                 po.Delivery_status,
                                 po.Currency,
                                 po.Gross_Amount,
                                 po.Tax_Percentage,
                                 po.Disc_Percentage,
                                 po.NET_Amount,
                                 po.Customer_Code,
                                 po.Ship_toCustAddr,
                                 po.Ship_toCustCity,
                                 po.Ship_Via,
                                 po.Vendor_code,
                                 po.PO_CreatedBy,
                                 po.PO_Dept_code,
                                 po.PG_ApprovedBy,
                                 po.HOD_ApprovedBy,
                                 po.DIR_ApprovedBy,
                                 po.Comments,
                                 v.vendor_code,
                                 v.vendor_Title,
                                 v.Name,
                                 v.Contact_Person,
                                 v.Address,
                                 v.City,
                                 v.Region,
                                 v.Country_code,
                                 v.Postal_Code,
                                 v.Tel_No,
                                 v.Fax_No,
                                 v.Email,
                                 v.Alt_Address,
                                 v.Alt_City,
                                 v.Alt_Country,
                                 v.Lang_Code,
                                 v.Record_date,
                                 v.User_id,
                                 po.Received_Status,
                             }).OrderByDescending(x => x.PO_Date).ToList();
                    return Json(r);
                }
                else
                {
                    var r = (from po in con.Purchase_Order
                             join v in con.Vendors on po.Vendor_code equals v.vendor_code
                             join c in con.Customers on po.Customer_Code equals c.Customer_code
                             //join b in con.Branch_Master on po.PO_No.Substring(0, 2) equals b.Branch_No
                             join b in con.Branch_Master on po.Branch_No equals b.Branch_No
                             orderby po.PO_Date descending
                             where po.Branch_No == BCode
                             select new
                             {
                                 b.Branch_Abbr,
                                 po.PO_No,
                                 c.Cust_Name,
                                 po.PO_Title,
                                 po.PO_Date,
                                 po.Delivery_date,
                                 po.Delivery_status,
                                 po.Currency,
                                 po.Gross_Amount,
                                 po.Tax_Percentage,
                                 po.Disc_Percentage,
                                 po.NET_Amount,
                                 po.Customer_Code,
                                 po.Ship_toCustAddr,
                                 po.Ship_toCustCity,
                                 po.Ship_Via,
                                 po.Vendor_code,
                                 po.PO_CreatedBy,
                                 po.PO_Dept_code,
                                 po.PG_ApprovedBy,
                                 po.HOD_ApprovedBy,
                                 po.DIR_ApprovedBy,
                                 po.Comments,
                                 v.vendor_code,
                                 v.vendor_Title,
                                 v.Name,
                                 v.Contact_Person,
                                 v.Address,
                                 v.City,
                                 v.Region,
                                 v.Country_code,
                                 v.Postal_Code,
                                 v.Tel_No,
                                 v.Fax_No,
                                 v.Email,
                                 v.Alt_Address,
                                 v.Alt_City,
                                 v.Alt_Country,
                                 v.Lang_Code,
                                 v.Record_date,
                                 v.User_id,
                                 po.Received_Status,
                             }).OrderByDescending(x => x.PO_Date).ToList();
                    return Json(r);
                }
                
            }
        }
        public ActionResult GetAllPOInTableByDate(DateTime PO_Date, DateTime PO_Date1)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string UserID = Session["UserID"] as string;
            string UserBranch = Session["Branch_No"] as string;
            string UserGroup = Session["UserGroup"] as string;
            var BCode = Session["Branch_No"].ToString();
            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                if (UserGroup == "10")
                {
                    var r = (from po in con.Purchase_Order
                             join v in con.Vendors on po.Vendor_code equals v.vendor_code
                             join c in con.Customers on po.Customer_Code equals c.Customer_code
                             join b in con.Branch_Master on po.Branch_No equals b.Branch_No
                             where po.PO_Date >= PO_Date && po.PO_Date <= PO_Date1
                             select new
                             {
                                 b.Branch_Abbr,
                                 po.PO_No,
                                 c.Cust_Name,
                                 po.PO_Title,
                                 po.PO_Date,
                                 po.Delivery_date,
                                 po.Delivery_status,
                                 po.Currency,
                                 po.Gross_Amount,
                                 po.Tax_Percentage,
                                 po.Disc_Percentage,
                                 po.NET_Amount,
                                 po.Customer_Code,
                                 po.Ship_toCustAddr,
                                 po.Ship_toCustCity,
                                 po.Ship_Via,
                                 po.Vendor_code,
                                 po.PO_CreatedBy,
                                 po.PO_Dept_code,
                                 po.PG_ApprovedBy,
                                 po.HOD_ApprovedBy,
                                 po.DIR_ApprovedBy,
                                 po.Comments,
                                 v.vendor_code,
                                 v.vendor_Title,
                                 v.Name,
                                 v.Contact_Person,
                                 v.Address,
                                 v.City,
                                 v.Region,
                                 v.Country_code,
                                 v.Postal_Code,
                                 v.Tel_No,
                                 v.Fax_No,
                                 v.Email,
                                 v.Alt_Address,
                                 v.Alt_City,
                                 v.Alt_Country,
                                 v.Lang_Code,
                                 v.Record_date,
                                 v.User_id
                             }).ToList();
                    return Json(r);
                }
                else
                {
                    var r = (from po in con.Purchase_Order
                             join v in con.Vendors on po.Vendor_code equals v.vendor_code
                             join c in con.Customers on po.Customer_Code equals c.Customer_code
                             join b in con.Branch_Master on po.Branch_No equals b.Branch_No
                             where po.PO_No.Substring(0, 2) == BCode && po.PO_Date >= PO_Date && po.PO_Date <= PO_Date1
                             select new
                             {
                                 b.Branch_Abbr,
                                 po.PO_No,
                                 c.Cust_Name,
                                 po.PO_Title,
                                 po.PO_Date,
                                 po.Delivery_date,
                                 po.Delivery_status,
                                 po.Currency,
                                 po.Gross_Amount,
                                 po.Tax_Percentage,
                                 po.Disc_Percentage,
                                 po.NET_Amount,
                                 po.Customer_Code,
                                 po.Ship_toCustAddr,
                                 po.Ship_toCustCity,
                                 po.Ship_Via,
                                 po.Vendor_code,
                                 po.PO_CreatedBy,
                                 po.PO_Dept_code,
                                 po.PG_ApprovedBy,
                                 po.HOD_ApprovedBy,
                                 po.DIR_ApprovedBy,
                                 po.Comments,
                                 v.vendor_code,
                                 v.vendor_Title,
                                 v.Name,
                                 v.Contact_Person,
                                 v.Address,
                                 v.City,
                                 v.Region,
                                 v.Country_code,
                                 v.Postal_Code,
                                 v.Tel_No,
                                 v.Fax_No,
                                 v.Email,
                                 v.Alt_Address,
                                 v.Alt_City,
                                 v.Alt_Country,
                                 v.Lang_Code,
                                 v.Record_date,
                                 v.User_id
                             }).ToList();
                    return Json(r);
                }
            }           
        }
     
    }
}