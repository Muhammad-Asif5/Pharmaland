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
    
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            this.Discount_Approval = new HashSet<Discount_Approval>();
            this.Purchase_Order = new HashSet<Purchase_Order>();
            this.Sale_Invoice = new HashSet<Sale_Invoice>();
            this.Discount_Approval1 = new HashSet<Discount_Approval>();
            this.Discount_ApprovalDET = new HashSet<Discount_ApprovalDET>();
        }
    
        public string Customer_code { get; set; }
        public string Cust_Name { get; set; }
        public string City_code { get; set; }
        public string Contact_Person { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Region { get; set; }
        public string Country_code { get; set; }
        public string Postal_Code { get; set; }
        public string Tel_No { get; set; }
        public string Fax_No { get; set; }
        public string Email { get; set; }
        public string Mobile_No { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Discount_Approval> Discount_Approval { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Purchase_Order> Purchase_Order { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sale_Invoice> Sale_Invoice { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Discount_Approval> Discount_Approval1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Discount_ApprovalDET> Discount_ApprovalDET { get; set; }
    }
}
