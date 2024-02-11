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
    
    public partial class Purchase_Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Purchase_Order()
        {
            this.PO_ItemDetail = new HashSet<PO_ItemDetail>();
            this.Stock_Receipt = new HashSet<Stock_Receipt>();
        }
    
        public string PO_No { get; set; }
        public string Branch_No { get; set; }
        public string PO_Title { get; set; }
        public System.DateTime PO_Date { get; set; }
        public Nullable<System.DateTime> Delivery_date { get; set; }
        public string Delivery_status { get; set; }
        public string Currency { get; set; }
        public Nullable<decimal> Gross_Amount { get; set; }
        public Nullable<decimal> Tax_Percentage { get; set; }
        public Nullable<decimal> Disc_Percentage { get; set; }
        public Nullable<decimal> NET_Amount { get; set; }
        public string Customer_Code { get; set; }
        public string Ship_toCustAddr { get; set; }
        public string Ship_toCustCity { get; set; }
        public string Ship_Via { get; set; }
        public string Vendor_code { get; set; }
        public string PO_CreatedBy { get; set; }
        public string PO_Dept_code { get; set; }
        public Nullable<int> PG_ApprovedBy { get; set; }
        public Nullable<int> HOD_ApprovedBy { get; set; }
        public Nullable<int> DIR_ApprovedBy { get; set; }
        public string Comments { get; set; }
        public string Received_Status { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Employee Employee1 { get; set; }
        public virtual Employee Employee2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PO_ItemDetail> PO_ItemDetail { get; set; }
        public virtual Vendor Vendor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Stock_Receipt> Stock_Receipt { get; set; }
    }
}