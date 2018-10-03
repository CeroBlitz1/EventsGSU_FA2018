using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventsGSUDataAccessLayer.Models
{
    public class PaymentModel
    {
        //public int PaymentID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserEmail { get; set; }
        public int UserPhoneNumber { get; set; }
        public int UserCardNumber { get; set; }
        public DateTime UserCardExpiration { get; set; }
        public int UserCardCVV { get; set; }
        public string UserAddress { get; set; }
        public int UserZipCode { get; set; }
        public string UserState { get; set; }
        public int UserPaymentPaid { get; set; }
        //public string UserTypeCode { get; set; }
    }
}
