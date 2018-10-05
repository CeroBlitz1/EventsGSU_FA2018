using EventsGSUDataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventsGSUDataAccessLayer.DataAccess
{
    public class Payment
    {
        GsuEventsDBEntities1 g = new GsuEventsDBEntities1();
        public bool SavePayment(PaymentModel model)
        {
            var retVal = false;
            try
            {
                var userObj = new PaymentTable();

                userObj.FirstName = model.FirstName;
                userObj.LastName = model.LastName;
                userObj.UserEmail = model.UserEmail;
                userObj.UserPhoneNumber = model.UserPhoneNumber;
                userObj.UserCardNumber = model.UserCardNumber;
                userObj.UserCardExpiration = model.UserCardExpiration;
                userObj.UserCardCVV = model.UserCardCVV;
                userObj.UserAddress = model.UserAddress;
                userObj.UserZipCode = model.UserZipCode;
                userObj.UserState = model.UserState;
                userObj.UserPaymentPaid = model.UserPaymentPaid;

                



                g.PaymentTables.Add(userObj);
                g.SaveChanges();

                retVal = true;
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return retVal;
        }
    }
}
