using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZUIS.Models;

namespace ZUIS.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Default
        Entities con = new Entities();
        public ActionResult Index()
        {
            var r = con.Vendors.ToList();
            GetAllCountry();
            return View(r);
        }
        public JsonResult GetSupplierById(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;
            
            var viewData = (from q in con.Vendors
                            where q.vendor_code == id
                            select q).ToList();
            return Json(viewData);
        }
        public ActionResult DeleteSupplier(string code)
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
                var viewData = (from q in con.Vendors
                                where q.vendor_code == code
                                select q).FirstOrDefault();

                try
                {
                    con.Entry(viewData).State = EntityState.Deleted;
                    con.SaveChanges();
                    message = "Supplier is Deleted Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult UpdateSupplier(Vendor model)
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
                var viewData = (from q in con.Vendors
                                where q.vendor_code == model.vendor_code
                                select q).FirstOrDefault();

                try
                {
                    viewData.vendor_Title = model.vendor_Title;
                    viewData.Name = model.Name;
                    viewData.Contact_Person = model.Contact_Person;
                    viewData.Address = model.Address;
                    viewData.City = model.City;
                    viewData.Region = model.Region;
                    viewData.Country_code = model.Country_code;
                    viewData.Postal_Code = model.Postal_Code;
                    viewData.Tel_No = model.Tel_No;
                    viewData.Fax_No = model.Fax_No;
                    viewData.Email = model.Email;
                    viewData.Alt_Address = model.Alt_Address;
                    viewData.Alt_City = model.Alt_City;
                    viewData.Alt_Country = model.Alt_Country;
                    viewData.Lang_Code = model.Lang_Code;
                    viewData.Record_date = DateTime.Now;
                    viewData.User_id = UserID;

                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();
                    message = "Vendor is Updated Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult SaveSupplier(Vendor model)
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
                var viewData = (from q in con.Vendors
                                where q.vendor_code == model.vendor_code
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        con.Vendors.Add(model);
                        con.SaveChanges();
                        message = "Supplier is Added Successfully";
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Supplier is already Added with this Code" }, JsonRequestBehavior.AllowGet);
                }
                
            }
        }

        public void GetAllCountry()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = con.Countries.ToList();
            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLCountry = viewData.Select(x => new SelectListItem
                {
                    Value = x.Country_code.ToString(),
                    Text = x.Country_code +":" + x.Country_Name.ToString()
                }).ToList();
            }
            else
            {
                var data = ViewBag.DDLCountry = viewData.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found"
                }).ToList();
            }
        }
    }
}