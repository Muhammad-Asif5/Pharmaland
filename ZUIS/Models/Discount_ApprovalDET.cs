//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ZUIS.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Discount_ApprovalDET
    {
        public string vendor_code { get; set; }
        public string Customer_code { get; set; }
        public int SNO { get; set; }
        public string Stock_no { get; set; }
        public decimal Q_Percentage { get; set; }
        public Nullable<decimal> Q_Rate { get; set; }
        public decimal D_Percentage { get; set; }
        public Nullable<decimal> D_Rate { get; set; }
        public Nullable<decimal> Cum_Dis { get; set; }
        public Nullable<decimal> Expected_BsUnits { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Item_Stock Item_Stock { get; set; }
    }
}
