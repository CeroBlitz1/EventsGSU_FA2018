//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EventsGSUDataAccessLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class PaymentHistoryTable
    {
        public int PaymentHistoryID { get; set; }
        public string UserPaymentCode { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> PaymentID { get; set; }
    
        public virtual PaymentTable PaymentTable { get; set; }
        public virtual UserTable UserTable { get; set; }
    }
}
