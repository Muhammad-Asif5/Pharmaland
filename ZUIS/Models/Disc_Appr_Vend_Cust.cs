using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZUIS.Models
{
    public class Disc_Appr_Vend_Cust
    {
        public string vendor_code { get; set; }
        public string Customer_code { get; set; }
        public string Name { get; set; }
        public string Cust_Name { get; set; }
        public int SNO { get; set; }
        public string Valid_Date_from { get; set; }
        public string Valid_Date_to { get; set; }
        public string Status { get; set; }
    }
}