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
    
    public partial class SO_ItemDetail
    {
        public string SO_No { get; set; }
        public string Branch_No { get; set; }
        public string Stock_no { get; set; }
        public string Currency { get; set; }
        public Nullable<decimal> CurrExch_rate { get; set; }
        public Nullable<decimal> SOPrice_PerItem { get; set; }
        public int SOQty_PerItem { get; set; }
        public Nullable<decimal> SOMargin_Percentage { get; set; }
        public Nullable<decimal> SOExtend_Price { get; set; }
        public string Status { get; set; }
        public Nullable<int> Serial_no { get; set; }
    
        public virtual Item_Stock Item_Stock { get; set; }
    }
}
