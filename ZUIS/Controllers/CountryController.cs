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
    public class CountryController : Controller
    {
        // GET: Country
        Entities con = new Entities();
        public ActionResult Country()
        {
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            //var check = cObj.CheckAutentication(UserID, Branch_No);

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Unauthorize", "Partial");
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

                    var r = (from q in con.Countries
                             select q).ToList();

                    ViewBag.Data = r;

                    return View(vm);
                }
            }
        }
        public JsonResult GetCountryById(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var viewData = (from q in con.Countries
                            where q.Country_code == id
                            select q).ToList();
            return Json(viewData);
        }
        public ActionResult DeleteCountry(string code)
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
                var viewData = (from q in con.Countries
                                where q.Country_code == code
                                select q).FirstOrDefault();

                try
                {
                    con.Entry(viewData).State = EntityState.Deleted;
                    con.SaveChanges();
                    message = "Country is Deleted Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted, its using another table" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult UpdateCountry(Country model)
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
                var viewData = (from q in con.Countries
                                where q.Country_code == model.Country_code
                                select q).FirstOrDefault();

                try
                {
                    viewData.Country_Name = model.Country_Name;
                    viewData.Country_Abbr = model.Country_Abbr;
                    viewData.Nationality = model.Nationality;

                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();
                    message = "Country is Updated Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult SaveCountry(Country model)
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
                var viewData = (from q in con.Countries
                                where q.Country_code == model.Country_code
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        con.Countries.Add(model);
                        con.SaveChanges();
                        message = "Country is Added Successfully";
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Manufacture is already Added with this Code" }, JsonRequestBehavior.AllowGet);
                }

            }
        }

    }
}