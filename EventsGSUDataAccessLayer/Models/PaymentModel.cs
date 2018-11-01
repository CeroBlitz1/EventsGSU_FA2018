using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventsGSUDataAccessLayer.Models
{
    public class PaymentModel
    {
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
        public int UserTypeID { get; set; }
        public int UserID { get; set; }
        public int TicketsPurchased { get; set; }
        public int TicketID { get; set; }
        public int EventID { get; set; }
        public string EventTitle { get; set; }
    }
}
