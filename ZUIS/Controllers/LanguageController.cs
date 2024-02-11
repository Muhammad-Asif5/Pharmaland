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
    public class LanguageController : Controller
    {
        // GET: Language

        Entities con = new Entities();
        public ActionResult Language()
        {
            con.Configuration.ProxyCreationEnabled = false;

            string UserID = Session["UserID"] as string;
            string UserBranch = Session["Branch_No"] as string;
            string UserGroup = Session["UserGroup"] as string;

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
                    var r = (from q in con.Languages
                             select q).ToList();
                    ViewBag.data = r;
                    return View(vm);
                }
            }
        }
        public JsonResult GetLanguageById(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var viewData = (from q in con.Languages
                            where q.Lang_Code == id
                            select q).ToList();
            return Json(viewData);
        }
        public ActionResult DeleteLanguage(string code)
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
                var viewData = (from q in con.Languages
                                where q.Lang_Code == code
                                select q).FirstOrDefault();

                try
                {
                    con.Entry(viewData).State = EntityState.Deleted;
                    con.SaveChanges();
                    message = "Language is Deleted Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted, its using another table" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult UpdateLanguage(Language model)
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
                var viewData = (from q in con.Languages
                                where q.Lang_Code == model.Lang_Code
                                select q).FirstOrDefault();

                try
                {
                    viewData.Lang_name = model.Lang_name;
                    viewData.Status = model.Status;

                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();
                    message = "Language is Updated Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult SaveLanguage(Language model)
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
                var viewData = (from q in con.Languages
                                where q.Lang_Code == model.Lang_Code
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        con.Languages.Add(model);
                        con.SaveChanges();
                        message = "Language is Added Successfully";
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Language is already Added with this Code" }, JsonRequestBehavior.AllowGet);
                }

            }
        }

    }
}