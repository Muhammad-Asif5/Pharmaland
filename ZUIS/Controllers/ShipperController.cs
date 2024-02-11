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
    public class ShipperController : Controller
    {
        // GET: Shipper
        Entities con = new Entities();
        public ActionResult Shipper()
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

                    var r = (from q in con.Shippers
                             select q).ToList();
                    GetAllCity();
                    GetAllCountry();

                    ViewBag.Data = r;
                    return View(vm);
                }
            }
        }
        public JsonResult GetShipperById(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var viewData = (from q in con.Shippers
                            where q.Shipper_code == id
                            select q).ToList();
            return Json(viewData);
        }
        public ActionResult DeleteShipper(string code)
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
                var viewData = (from q in con.Shippers
                                where q.Shipper_code == code
                                select q).FirstOrDefault();

                try
                {
                    con.Entry(viewData).State = EntityState.Deleted;
                    con.SaveChanges();
                    message = "Shipper is Deleted Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted, its using another table" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult UpdateShipper(Shipper model)
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
                var viewData = (from q in con.Shippers
                                where q.Shipper_code == model.Shipper_code
                                select q).FirstOrDefault();

                try
                {
                    viewData.Shipper_Name = model.Shipper_Name;
                    viewData.Contact_Person = model.Contact_Person;
                    viewData.Address = model.Address;
                    viewData.City_code = model.City_code;
                    viewData.Region = model.Region;
                    viewData.Country_code = model.Country_code;
                    viewData.Postal_Code = model.Postal_Code;
                    viewData.Tel_No = model.Tel_No;
                    viewData.Fax_No = model.Fax_No;
                    viewData.Email = model.Email;
                    viewData.Mobile_No = model.Mobile_No;


                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();
                    message = "Shipper is Updated Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult SaveShipper(Shipper model)
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
                var viewData = (from q in con.Shippers
                                where q.Shipper_code == model.Shipper_code
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        con.Shippers.Add(model);
                        con.SaveChanges();
                        message = "Shipper is Added Successfully";
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Shipper is already Added with this Code" }, JsonRequestBehavior.AllowGet);
                }

            }
        }

        public void GetAllCity()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = con.Cities.ToList();
            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLCity = viewData.Select(x => new SelectListItem
                {
                    Value = x.City_code.ToString(),
                    Text = x.City_code + " : " + x.City_NAME.ToString()
                }).ToList();
            }
            else
            {
                var data = ViewBag.DDLCity = viewData.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found"
                }).ToList();
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
                    Text = x.Country_code + " : " + x.Country_Name.ToString()
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