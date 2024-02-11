using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZUIS.Models;

namespace ZUIS.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        Entities con = new Entities();
        public ActionResult Home1()
        {
            return View();
            
        }
        public ActionResult Home()
        {
            string Emp_Code = Session["Emp_Code"] as string;
            string UserID = Session["UserID"] as string;
            string UserBranch = Session["Branch_No"] as string;
            string Admin = Session["UserGroup"] as string;

            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Unauthorize", "Partial");
            }
            else
            {

                VM vm = new VM();
                var menu = con.Menu_User.Include(x => x.Menu).OrderBy(x=>x.DisplayOrder);
                //var smenu = db.MENU_SUB1.Include(x => x.MENU);
                vm.Menus = menu;
                //vm.SubMenus = smenu;


                List<string> MenuGroupList = new List<string>();
                List<string> SubMenuGroupList = new List<string>();
                List<string> Setting = new List<string>();

                var count = (from menu_count in con.Menu_User
                              orderby menu_count.DisplayOrder ascending
                              where menu_count.user_id.Equals(UserID)
                              select new { menu_count.Menu_Group, menu_count.DisplayOrder}).Distinct().ToList();

                for (int i = 0; i < count.Count(); i++)
                {
                    //MenuGroupList.Add(count.ElementAt(i));
                    MenuGroupList.Add((count[i].Menu_Group));
                }

                ViewBag.MenuGroupCount = MenuGroupList;
                var QueryUserType = (from a in con.Menu_UserReg
                                     where a.User_id.Equals(UserID)
                                     select a.UserType).ToList();
                for (int i = 0; i < QueryUserType.Count(); i++)
                {
                    Setting.Add(QueryUserType.ElementAt(i));

                }
                ViewBag.MySetting = Setting;

                var finalResult = new { listEvals = MenuGroupList, listEvalDetail = SubMenuGroupList };
   
                return View(vm);
            }
        }

    }
}