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
    
    public partial class EventDetail
    {
        public int EventDetailsID { get; set; }
        public string EventsDescription { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> EventID { get; set; }
    
        public virtual EventsTable EventsTable { get; set; }
        public virtual UserTable UserTable { get; set; }
    }
}
