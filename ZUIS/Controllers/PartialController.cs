using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZUIS.Models;

namespace ZUIS.Controllers
{
    public class PartialController : Controller
    {
        // GET: Partial
        private Entities db = new Entities();

        public ActionResult Index()
        {
            string SessTime = Session["SessTime"] as string;

            string CurrTime = DateTime.Now.ToString("h:mm:ss");

            if (true)
            {

            }

            string sessionId = Session["LoggedID"] as string;

            string SesOrgName = Session["OrgName"] as string;


            string boolDbHitCount = Session["DbHitCount"] as string;
            if (SesOrgName == null || boolDbHitCount == "1")
            {

                if (boolDbHitCount == "1")
                {
                    Session["DbHitCount"] = "0";
                }
                if (SesOrgName == null)
                {

                }

                ///////////////////////
                var queryMenuId = (from a in db.Menu_User
                                   where a.user_id.Equals(sessionId)
                                   select a).OrderBy(a => a.DisplayOrder).ToList();



                ViewBag.Menus = queryMenuId;

                Session["Menus"] = queryMenuId.ToList();

                List<string> MenuGrp = new List<string>();

                MenuGrp = queryMenuId.Select(x => x.Menu_Group).ToList();

                var DisMenuGrp = MenuGrp.Distinct();

                List<string> MenuGroupList = new List<string>();

                for (int i = 0; i < DisMenuGrp.Count(); i++)
                {

                    MenuGroupList.Add(DisMenuGrp.ElementAt(i));
                }

                ViewBag.MenuGroupCount = MenuGroupList;

                Session["MenuGroupCount"] = MenuGroupList;

                //return PartialView(vm);
            }
            return PartialView();
            ///////////////////////

        }
        public ActionResult Unauthorize()
        {
            return View();
        }
    }
}