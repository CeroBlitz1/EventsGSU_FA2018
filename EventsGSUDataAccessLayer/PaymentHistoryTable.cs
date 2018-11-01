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
        public string UserTypeID { get; set; }
        public Nullable<int> UserID { get; set; }
        public int PaymentID { get; set; }
        public int TicketsPurchased { get; set; }
        public string UserPaymentPaid { get; set; }
        public Nullable<int> TicketID { get; set; }
        public Nullable<int> EventID { get; set; }
    
        public virtual EventsTable EventsTable { get; set; }
        public virtual PaymentTable PaymentTable { get; set; }
        public virtual TicketsTable TicketsTable { get; set; }
        public virtual UserTable UserTable { get; set; }
    }
}
