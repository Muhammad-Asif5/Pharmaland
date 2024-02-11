using Newtonsoft.Json;
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
    public class EmployeeController : Controller
    {
        // GET: Employee
        Entities con = new Entities();
        public ActionResult Employee()
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

                    var r = (from q in con.Employees
                             where q.Branch_No == UserBranch.ToString()
                             select q).ToList();
                    ViewBag.Data = r;
                    GetAllCountry();
                    return View(vm);
                }
            }
        }
        public JsonResult GetEmployeeById(int id)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var viewData = (from q in con.Employees
                            where q.Emp_ID == id
                            select q).ToList();
            return Json(viewData);
        }
        public ActionResult DeleteEmployee(int code)
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
                var viewData = (from q in con.Employees
                                where q.Emp_ID == code
                                select q).FirstOrDefault();

                try
                {
                    con.Entry(viewData).State = EntityState.Deleted;
                    con.SaveChanges();
                    message = "Employee is Deleted Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = false, message = ex.Message + "Cannot Deleted, its using another table" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult UpdateEmployee(Employee model)
        {
            con.Configuration.ProxyCreationEnabled = false;
            string message = string.Empty;
            string UserID = Session["UserID"] as string;

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Home", "Home");
            }
            else
            {
                var viewData = (from q in con.Employees
                                where q.Emp_ID == model.Emp_ID
                                select q).FirstOrDefault();

                try
                {
                    viewData.Emp_Name = model.Emp_Name;
                    viewData.Address = model.Address;
                    viewData.DOB = model.DOB;
                    viewData.City = model.City;
                    viewData.Region = model.Region;
                    viewData.Country_code = model.Country_code;
                    viewData.Postal_Code = model.Postal_Code;
                    viewData.Tel_No = model.Tel_No;
                    viewData.Email = model.Email;
                    viewData.Mobile_No = model.Mobile_No;
                    viewData.Dept_Code = model.Dept_Code;

                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();
                    message = "Employee is Updated Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult SaveEmployee(Employee model)
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
                var viewData = (from q in con.Employees
                                where q.User_id == model.User_id
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        con.Employees.Add(model);
                        con.SaveChanges();
                        message = "Employee is Added Successfully";
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Employee is already Added with this Code" }, JsonRequestBehavior.AllowGet);
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