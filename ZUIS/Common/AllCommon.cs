using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ZUIS.Models;

namespace ZUIS.Common
{
    public class AllCommon
    {
        Entities con = new Entities();
        static List<string> tempLst = new List<string>();
        public string GetConStr
        {
            get
            {
                string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["ZUIS.Properties.Settings.Setting"].ConnectionString;
                return strConnection;
            }
        }
        public List<Customer> AllCustomer()
        {
            
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = con.Customers.ToList();
            return viewData;
        }
        public List<Item_Stock> AllItemStock()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = con.Item_Stock.ToList();
            return viewData;
        }
        public List<Vendor> AllSupplier()
        {
            con.Configuration.ProxyCreationEnabled = false;

            var viewData = con.Vendors.ToList();
            return viewData;
        }
        public static bool CheckAuthorization(string UserId, string ActionName, string ControName)
        {
            Entities db = new Entities();

            if (UserId == null)
            {
                return false;
            }
            else
            {
                string queryMenuId = (from a in db.Menus
                                      join q in db.Menu_User on a.Menu_ID equals q.Menu_id
                                      where a.Action.Equals(ActionName) && a.Controller_name.Equals(ControName)
                                      && q.user_id.Equals(UserId)
                                      select a.Menu_ID).SingleOrDefault().ToString();
                int id = int.Parse(queryMenuId);

                if (id == 0)
                {
                    return false;
                }
                else
                {
                    tempLst.Add(queryMenuId);
                    bool authorize = tempLst.Contains(queryMenuId);

                    return authorize;
                }
            }
        }

       
    }
}