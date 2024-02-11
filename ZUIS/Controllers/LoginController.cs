using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZUIS.Models;

namespace ZUIS.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        Entities con = new Entities();

       [HttpGet]
        public ActionResult Login1()
        {

            return View();
        }

       public ActionResult Login()
       {
           string Emp_Code = Session["Emp_Code"] as string;         //1
           string UserID = Session["UserID"] as string;             // Asif
           string Admin = Session["UserGroup"] as string;           // 10
           string Branch_No = Session["Branch_No"] as string;       // 01
           string Emp_Name = Session["Emp_Name"] as string;         // M Asif

           if (String.IsNullOrEmpty(UserID))
           {
               return View();
           }
           else
           {
               if (Admin == "01")
               {
                   string QueryUserType = (from a in con.Menu_UserReg
                                           where a.User_id.Equals(UserID)
                                           select a.UserType).SingleOrDefault().ToString();

                   if (QueryUserType == "Admin")
                   {
                       return RedirectToAction("Home", "Home");
                   }
                   else if (QueryUserType == "A")
                   {
                       return RedirectToAction("Home", "Home");
                   }
               }
               return RedirectToAction("Home", "Home");
           }
       }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Menu_UserReg menu_userreg)
        {
            con.Configuration.ProxyCreationEnabled = false;

            string time = DateTime.Now.AddMinutes(25).ToString("hh:mm:ss");
            string WarningTime = DateTime.Now.AddMinutes(20).ToString("hh:mm:ss");
            Session["SessTime"] = time;
            Session["SessTimeWarning"] = WarningTime;

            string UserId = menu_userreg.User_id;
            string UserPas = menu_userreg.User_Password;

            var result = con.Menu_UserReg.Where(m => m.User_Password.Equals(UserPas) &&
                         m.User_id.Equals(UserId)).FirstOrDefault();

            if (result != null)
            {
                int empId = result.Emp_ID;
                Session["UserID"] = result.User_id.ToString();  // asif
                Session["Emp_Code"] = result.Emp_ID.ToString();  // 1,2,3
                Session["UserPassword"] = result.User_Password.ToString();   //Password of the User.
                Session["UserType"] = result.UserType.ToString(); // User type

                var emp = (from q in con.Employees
                           where q.Emp_ID == empId
                           select q).ToList();

                Session["Branch_No"] = emp[0].Branch_No;
                Session["Emp_Name"] = emp[0].Emp_Name;

                string id = result.User_id.ToString();

                var menuIds = (from a in con.Menu_User
                               where a.user_id.Contains(id)
                               select a.Menu_id).ToList();
                string isHod = "";
                List<string> lstMenuIds = new List<string>();

                for (int i = 0; i < menuIds.Count(); i++)
                {
                    string M_id = menuIds[i].ToString();
                    lstMenuIds.Add(M_id);
                }

                string QueryUserType = (from a in con.Menu_UserReg
                                        where a.User_id.Equals(UserId)
                                        select a.UserType).SingleOrDefault().ToString();

                return RedirectToAction("Home", "Home");
            }
            else
            {
                //Session["LoginMsg"] = " Invalid User Id or Password.Try Again";
                ViewBag.ErrorMessage = " Invalid User Id or Password.Try Again";
                //return RedirectToAction("Login", "Login");
                return View();
            }
            // return View(menu_userreg);
        }
        public ActionResult Login23(Employee model)
        {
            con.Configuration.ProxyCreationEnabled = false;

            string time = DateTime.Now.AddMinutes(25).ToString("hh:mm:ss");
            string WarningTime = DateTime.Now.AddMinutes(20).ToString("hh:mm:ss");
            Session["SessTime"] = time;
            Session["SessTimeWarning"] = WarningTime;

            string UserId = model.User_id;
            string UserPas = model.User_password;

            var result = con.Employees.Where(m => m.User_password.Equals(UserPas) &&
                         m.User_id.Equals(UserId)).FirstOrDefault();

            if (result != null)
            {
                Session["Emp_Code"] = result.Emp_ID.ToString();  // User Name
                Session["UserID"] = result.User_id.ToString();  // User Name
                Session["Branch_No"] = result.Branch_No.ToString();  // User Id
                Session["UserGroup"] = result.Group_id.ToString();   //Password of the User.
                Session["UserPassword"] = result.User_password.ToString(); // User type
                string id = result.User_id.ToString();

                return RedirectToAction("Index", "Default");
            }
            else
            {
                ViewBag.ErrorMessage = "Please Enter User Name and Password";
                return View();
            }
        }
        public ActionResult SignOut()
        {
            Session["LoggedPaswrd"] = null;
            Session["LoggedID"] = null;
            Session["OrgName"] = null;
            Session["DbHitCount"] = null;
            Session["imageData"] = null;
            Session["MenuGroupCount"] = null;
            Session["Menus"] = null;
            Session["UserType"] = null;

            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();

            return RedirectToAction("Login", "Login");
        }
    }
}