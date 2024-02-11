using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web;
using System.Web.Mvc;
using ZUIS.Models;
using ZUIS.Common;

namespace ZUIS.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        Entities con = new Entities();
        AllCommon cObj = new AllCommon();

        #region Customer
        public ActionResult Customer()
        {
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif

            //var check = cObj.CheckAutentication(UserID, Branch_No);

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

                    var r = (from q in con.Customers
                             select q).ToList();
                    GetAllCountry();

                    ViewBag.Data = r;

                    return View(vm);
                }
            }
        }
        public JsonResult GetCustomerById(string id)
        {
            con.Configuration.ProxyCreationEnabled = false;
            var viewData = (from q in con.Customers
                            where q.Customer_code == id
                            select q).ToList();
            return Json(viewData);
        }
        public ActionResult DeleteCustomer(string code)
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
                var viewData = (from q in con.Customers
                                where q.Customer_code == code
                                select q).FirstOrDefault();

                try
                {
                    con.Entry(viewData).State = EntityState.Deleted;
                    con.SaveChanges();
                    message = "Customer is Deleted Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted, its using another table" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult UpdateCustomer(Customer model)
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
                var viewData = (from q in con.Customers
                                where q.Customer_code == model.Customer_code
                                select q).FirstOrDefault();

                try
                {
                    viewData.Cust_Name = model.Cust_Name;
                    viewData.Contact_Person = model.Contact_Person;
                    viewData.Address = model.Address;
                    viewData.City = model.City;
                    viewData.Region = model.Region;
                    viewData.Country_code = model.Country_code;
                    viewData.Postal_Code = model.Postal_Code;
                    viewData.Tel_No = model.Tel_No;
                    viewData.Fax_No = model.Fax_No;
                    viewData.Email = model.Email;
                    viewData.Mobile_No = model.Mobile_No;


                    con.Entry(viewData).State = EntityState.Modified;
                    con.SaveChanges();
                    message = "Customer is Updated Successfully";
                    return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        public ActionResult SaveCustomer(Customer model)
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
                var viewData = (from q in con.Customers
                                where q.Customer_code == model.Customer_code
                                select q).FirstOrDefault();
                if (viewData == null)
                {
                    try
                    {
                        con.Customers.Add(model);
                        con.SaveChanges();
                        message = "Customer is Added Successfully";
                        return Json(new { success = true, message = message }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new { success = true, message = ex.Message + "Cannot Deleted" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Customer is already Added with this Code" }, JsonRequestBehavior.AllowGet);
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
        public void GetAllCompany()
        {
            con.Configuration.ProxyCreationEnabled = false;

            //var viewData = con.Companies.ToList();
            var viewData = (from q in con.Companies
                            join b in con.Branches on q.Company_Code equals b.Company_Code
                            select new
                            {
                                q.Company_Code,
                                b.Branch_Code,
                                q.Company_name
                            }).ToList();

            if (viewData.Count > 0)
            {
                var data = ViewBag.DDLCompanies = viewData.Select(x => new SelectListItem
                {
                    Value = x.Company_Code.ToString(),
                    Text = x.Branch_Code + " : " + x.Company_name.ToString()
                }).ToList();
            }
            else
            {
                var data = ViewBag.DDLCompanies = viewData.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found"
                }).ToList();
            }
        }
        public ActionResult CustomerReports()
        {
            var r = (from q in con.Customers
                     select q).ToList();
            GetAllCountry();
            return View(r);
        }
        #endregion

        public ActionResult CRInv()
        {
            string Emp_Code = Session["Emp_Code"] as string;         //1
            string UserID = Session["UserID"] as string;             // Asif
            string UserType = Session["UserType"] as string;           // Admin
            string Branch_No = Session["Branch_No"] as string;       // 01
            string Emp_Name = Session["Emp_Name"] as string;         // M Asif
            string actionName = this.ControllerContext.RouteData.Values["action"].ToString();
            string ControName = this.ControllerContext.RouteData.Values["controller"].ToString();
            
            if (String.IsNullOrEmpty(UserID))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                bool authorize =AllCommon.CheckAuthorization(UserID, actionName, ControName);

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

                    GetAllCompany();

                    return View(vm);
                }
            }
        }
        public ActionResult Download()
        {
            var info = (from c in con.Customers
                        join cit in con.Cities on c.City_code equals cit.City_code
                        select new
                        {
                            c.Customer_code,
                            c.Cust_Name,
                            c.Address,
                            c.City,
                            c.City_code,
                            cit.City_NAME
                        }).ToList();


           // var aa = (from ss in con.Customers select ss).ToList();
            MemoryStream ms = new MemoryStream();
            //TextWriter sw = new StreamWriter(@"E:\\file11.txt");
            TextWriter sw = new StreamWriter(ms);
            sw.WriteLine(string.Format("{0,-8} {1,-10} {2,-28} {3,-60} {4,-15} {5,-10} {6}", "DSTBID", "CUSTID", "CUSTNAME", "ADDRESS", "CT", "TOWNID", "TOWN"));
            for (int i = 0; i < info.Count; i++)
            {
                sw.WriteLine(string.Format("{0,-8} {1,-10} {2,-28} {3,-60} {4,-15} {5,-10} {6}", "369", info[i].Customer_code, info[i].Cust_Name, info[i].Address, info[i].City, info[i].City_code, info[i].City_NAME));
            }
            sw.Close();     //Don't Forget Close the TextWriter Object(sw)
            byte[] bytes = ms.ToArray();

            Response.Clear();
            Response.ContentType = "application/force-download";
            Response.AddHeader("content-disposition", "attachment;  filename=ZIUS-CUST369-Final.txt");
            Response.BinaryWrite(bytes);
            Response.End();

            return View();
        }
        public ActionResult LoadAllDataInTable()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var r = (from i in con.Item_Stock
                     join siD in con.Sale_InvDET on i.Stock_no equals siD.Stock_no
                     join si in con.Sale_Invoice on siD.Invoice_no equals si.Invoice_no
                     join c in con.Customers on si.Customer_Code equals c.Customer_code
                     join cc in con.Cities on c.City_code equals cc.City_code
                     join com in con.Companies on cc.City_code equals com.City_code
                     join b in con.Branches on com.Company_Code equals b.Company_Code
                     //where q.PO_No == PO_No
                     select new
                     {
                         b.Branch_Code,
                         si.Invoice_no,
                         si.Invoice_date,
                         c.Customer_code,
                         cc.City_code,
                         i.Stock_no,
                         i.Brand_name,
                         siD.Batch_NO,
                         siD.PPrice_PerItem,
                         siD.SQty,
                         si.Disc_Percentage,
                         si.NET_Amount,
                         cc.City_NAME

                     }).ToList();
            return Json(new { success = true, r =r }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult LoadCUST369InTable()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var info = (from c in con.Customers
                        join cit in con.Cities on c.City_code equals cit.City_code
                       // where c.Customer_code==id
                        select new
                        {
                            c.Customer_code,
                            c.Cust_Name,
                            c.Address,
                            c.City,
                            c.City_code,
                            cit.City_NAME
                        }).ToList();

            return Json(new { success = true, r = info }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DownloadCUST(DateTime InvoiceDate, DateTime InvoiceDate1, string BCode)
        {
            var info = (from b in con.Branches
                        from c in con.Customers
                        join s in con.Sale_Invoice on c.Customer_code equals s.Customer_Code
                        where b.DSTB_NO == BCode && s.Invoice_date >= InvoiceDate && s.Invoice_date <= InvoiceDate1
                        select new
                        {
                            b.Branch_Code,
                            b.DSTB_NO,
                            s.Customer_Code,
                            c.Cust_Name,
                            c.Address,
                            c.City_code,
                            c.City
                        }).ToList();


            // var aa = (from ss in con.Customers select ss).ToList();
            MemoryStream ms = new MemoryStream();
            //TextWriter sw = new StreamWriter(@"E:\\file11.txt");
            TextWriter sw = new StreamWriter(ms);
            sw.WriteLine(string.Format("{0,-7} {1,-7} {2,-36} {3,-37} {4,-13} {5,-9} {6}", "DSTBID", "CUSTID", "CUSTNAME", "ADDRESS", "CT", "TOWNID", "TOWN"));
            for (int i = 0; i < info.Count; i++)
            {
              string CName = getName(info[i].Cust_Name);
              string address = getAddress(info[i].Address);

                sw.WriteLine(string.Format("{0,-7} {1,-7} {2,-36} {3,-37} {4,-15} {5,-7} {6}", info[i].DSTB_NO, info[i].Customer_Code, CName, address, info[i].City_code, "001", info[i].City));
            }
            sw.Close();     //Don't Forget Close the TextWriter Object(sw)
            byte[] bytes = ms.ToArray();

            Response.Clear();
            Response.ContentType = "application/force-download";
            Response.AddHeader("content-disposition", "attachment;  filename=" + BCode + "CUST.txt");
            Response.BinaryWrite(bytes);
            Response.End();

            return View();
        }
        private string getAddress(string address)
        {
            int length = address.Length;

            if (length > 31)
            {
              return  address = address.Substring(0, 31);
            }
            else
            {
                return address;
            }
        }
        private string getName(string name)
        {
            int length = name.Length;

            if (length > 30)
            {
                return name = name.Substring(0, 30);
            }
            else
            {
                return name;
            }
        }
        public ActionResult getCUST(DateTime InvoiceDate, DateTime InvoiceDate1, string BCode)
        {
            con.Configuration.ProxyCreationEnabled = false;

            var r = (from b in con.Branches
                     from c in con.Customers
                     join s in con.Sale_Invoice on c.Customer_code equals s.Customer_Code
                     where b.DSTB_NO == BCode && s.Invoice_date >= InvoiceDate && s.Invoice_date <= InvoiceDate1
                     select new
                     {
                         b.Branch_Code,
                         b.DSTB_NO,
                         s.Customer_Code,
                         c.Cust_Name,
                         c.Address,
                         c.City_code,
                         c.City
                     }).ToList();

            return Json(r, JsonRequestBehavior.AllowGet);
        }
    }
}