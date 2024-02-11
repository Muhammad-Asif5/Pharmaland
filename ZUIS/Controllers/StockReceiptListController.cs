using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZUIS.Models;

namespace ZUIS.Controllers
{
    public class StockReceiptListController : Controller
    {
        // GET: StockReceiptList
        Entities con = new Entities();
        public ActionResult StockReceiptList()
        {
            return View();
        }
        public JsonResult GetAllPOInTable(DateTime PO_Date, DateTime PO_Date1)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var r = (from po in con.Purchase_Order
                     join v in con.Vendors on po.Vendor_code equals v.vendor_code
                     where po.PO_Date >= PO_Date && po.PO_Date <= PO_Date1
                     select new
                     {
                         po.PO_No,
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