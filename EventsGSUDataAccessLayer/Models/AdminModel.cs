using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq;

namespace EventsGSUDataAccessLayer.Models
{
    public class AdminModel
    {
        public int EventDetailsID { get; set; }
        public string EventsDescription { get; set; }
        public int EventID { get; set; }
        public string EventImage { get; set; }
        public string EventTitle { get; set; }
        public string EventDate { get; set; }
        public int TicketID { get; set; }
        public int TicketPrice { get; set; }
        public bool EFlag { get; set; }
        public int UserID { get; set; }
        public string EventLocation { get; set; }
        public string EventType { get; set; }
        public int TicketQuantity { get; set; }
        public string TicketImage { get; set; }
        public int PaymentID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserEmail { get; set; }
        public string UserPhoneNumber { get; set; }
        public string UserCardNumber { get; set; }
        public DateTime UserCardExpiration { get; set; }
        public int UserCardCVV { get; set; }
        public string UserAddress { get; set; }
        public string UserZipCode { get; set; }
        public string UserState { get; set; }
        public string UserPaymentPaid { get; set; }
        public string UserTypeCode { get; set; }
        public string UserPassword { get; set; }
        public string UserName { get; set; }
        public int? UserTypeID { get; set; }
        public string UMessage { get; set; }
        public bool UFlag { get; set; }
        public string ReturnUrl { get; set; }
        public string isActive { get; set; }

    }
}

