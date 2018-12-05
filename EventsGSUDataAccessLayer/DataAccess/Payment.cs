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
        GsuEventsDBEntities3 g = new GsuEventsDBEntities3();

        public PaymentModel SavePayment(PaymentModel model)
        {
            var pm = new PaymentModel
            {
                PMessage="Payment Success",
                PFlag = false,

            };
            try
            {
                
                var paymentObj = new PaymentTable();
                var paymentHobj = new PaymentHistoryTable();
                paymentObj.FirstName = model.FirstName;
                paymentObj.LastName = model.LastName;
                paymentObj.UserEmail = model.UserEmail;
                paymentObj.UserPhoneNumber = model.UserPhoneNumber;
                paymentObj.UserCardNumber = model.UserCardNumber;
                paymentObj.UserCardExpiration = Convert.ToDateTime(model.UserCardExpiration);
                paymentObj.UserID = model.UserID;
                paymentObj.UserCardCVV = model.UserCardCVV;
                paymentObj.UserAddress = model.UserAddress;
                paymentObj.UserZipCode = model.UserZipCode;
                paymentObj.UserState = model.UserState;
                paymentObj.isDelete = 0;
                var ema = new System.Net.Mail.MailAddress(model.UserEmail);
                if(ema == null)
                {
                    pm.PMessage = "Please Check Email Address";
                    pm.PFlag = false;
                    
                }
                if ( model.UserCardNumber== null )
                {
                    pm.PMessage = "Fail";
                    pm.PFlag = false;
                }
                else
                {
                    g.PaymentTables.Add(paymentObj);
                    g.SaveChanges();
                }




                
                paymentHobj.PaymentID = paymentObj.PaymentID;
                paymentHobj.isDelete = 0;
                paymentHobj.UserPaymentPaid = model.UserPaymentPaid;
                paymentHobj.UserID = model.UserID;
                paymentHobj.UserTypeID = model.UserTypeID.ToString();
                paymentHobj.EventID = model.EventID;
                paymentHobj.TicketID = model.TicketID;
                paymentHobj.TicketsPurchased = model.TicketsPurchased ;

                if (paymentHobj.PaymentID == 0)
                {
                    pm.PMessage = "Fail";
                    pm.PFlag = false;
                }
                else
                {
                    g.PaymentHistoryTables.Add(paymentHobj);
                    g.SaveChanges();
                }
               


            }
            catch (Exception ex)
            {
              
                string d = ex.Message;
                pm.PMessage = d;
              }
            return pm;
        }
        
        public PaymentModel SavePaymentWithcard(PaymentModel model)
        {

            var pm = new PaymentModel
            {
                PMessage = "Payment SuccessFul",
                PFlag = false,

            };
            try
            {
               
                var paymentHobj = new PaymentHistoryTable();
      
                paymentHobj.PaymentID = model.PaymentID;
                paymentHobj.isDelete = 0;
                paymentHobj.UserPaymentPaid = model.UserPaymentPaid;
                paymentHobj.UserID = model.UserID;
                paymentHobj.UserTypeID = model.UserTypeID.ToString();
                paymentHobj.EventID = model.EventID;
                paymentHobj.TicketID = model.TicketID;
                paymentHobj.TicketsPurchased = model.TicketsPurchased;

              



                pm.PFlag = true;
                if(model.PaymentID == 0)
                {
                    pm.PMessage = "Fail";
                      pm.PFlag = false;
                }
                else
                {
                    g.PaymentHistoryTables.Add(paymentHobj);
                    g.SaveChanges();
                }

                //var query = g.PaymentHistoryTables.Where(x => x.PaymentID == 0);
                //if(query != null)
                //{
                //    pm.PMessage = "Fail";
                //    pm.PFlag = false;
                //}
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return pm;
        }

        public List<PaymentModel> GetCardDetails(int? UserID)
        {
            var CardDetailsList = new List<PaymentModel>();

            try
            {
                var getCardDetailsObject = (from pt in g.PaymentTables
                                         join ut in g.UserTables on pt.UserID equals ut.UserID
                                         where pt.UserID == UserID && pt.isDelete==0
                                         select new
                                         {
                                             pt.FirstName,
                                             pt.LastName,
                                             pt.UserCardNumber,
                                             pt.UserCardCVV,
                                             pt.UserCardExpiration,
                                             pt.UserEmail,
                                             pt.UserPhoneNumber,
                                             pt.UserAddress,
                                             pt.UserZipCode,
                                             pt.UserState,
                                             pt.PaymentID,
                                         }
                                                                           
                                         ).ToList();
                foreach (var item in getCardDetailsObject)
                {
                    var cardetailsobject = new PaymentModel();

                    cardetailsobject.FirstName = item.FirstName;
                    cardetailsobject.LastName = item.LastName;
                    cardetailsobject.UserCardNumber = item.UserCardNumber;
                    cardetailsobject.UserCardCVV = item.UserCardCVV;
                    cardetailsobject.UserCardExpiration = item.UserCardExpiration;
                    cardetailsobject.UserEmail = item.UserEmail;
                    cardetailsobject.UserPhoneNumber = item.UserPhoneNumber;
                    cardetailsobject.UserAddress = item.UserAddress;
                    cardetailsobject.UserZipCode = item.UserZipCode;
                    cardetailsobject.UserState = item.UserState;
                    cardetailsobject.PaymentID = item.PaymentID;

                    CardDetailsList.Add(cardetailsobject);
                }
            }
            catch(Exception ex)
            {
                string d = ex.Message;
            }
            return CardDetailsList;
        }
        
        public List<PaymentModel> GetUserDetails(int? UserID)
        {
            var UserhistoryDetailsList = new List<PaymentModel>();
            try
            {
                var getUserHistoryDetailsObject = (from pt in g.PaymentTables
                                                   join ph in g.PaymentHistoryTables on pt.UserID equals ph.UserID
                                                   join et in g.EventsTables on ph.EventID equals et.EventID
                                                   where ph.UserID == UserID && ph.isDelete == 0
                                                   select new
                                                   {
                                                       pt.FirstName,
                                                       pt.LastName,
                                                       pt.UserEmail,
                                                       ph.TicketsPurchased,
                                                       pt.UserCardExpiration,
                                                       et.EventTitle
                                                   }

                                        ).Distinct().ToList();
                foreach (var item in getUserHistoryDetailsObject)
                {
                    var userdetailsobject = new PaymentModel();

                    userdetailsobject.FirstName = item.FirstName;
                    userdetailsobject.LastName = item.LastName;
                    userdetailsobject.UserEmail = item.UserEmail;
                    userdetailsobject.TicketsPurchased = item.TicketsPurchased;
                    userdetailsobject.UserCardExpiration = item.UserCardExpiration;
                    userdetailsobject.EventTitle = item.EventTitle;
                    UserhistoryDetailsList.Add(userdetailsobject);
                }
            }
            catch(Exception ex)
            {
                string d = ex.Message;
            }
            return UserhistoryDetailsList;
        }

        public UserModel UpdateUserTypeCode(UserModel model)
        {
            var um = new UserModel
            {
                UMessage = "Update Success.. Please relogin to See changes",
                UFlag = false,
            };
            try
            {
                var usersObj = new UserTable();

                usersObj.UserPassword = model.UserPassword;
                usersObj.UserName = model.UserName;
                usersObj.UserEmail = model.UserEmail;
                usersObj.UserPhoneNumber = model.UserPhoneNumber;
                usersObj.UserTypeID = 2;
                usersObj.UserID = model.UserID;
                usersObj.isActive = "Y";
                usersObj.CreatedDate = DateTime.Now;
                usersObj.ModifiedDate = DateTime.Now;
                usersObj.isDelete = 0;

                g.UserTables.Attach(usersObj);
                g.Entry(usersObj).State = System.Data.Entity.EntityState.Modified;
                g.SaveChanges();
                um.UFlag = true;

            }
            catch (Exception ex)
            {

                um.UMessage = ex.Message;
            }

            return um;
        }

        public AdminModel DeletePayment(AdminModel model)
        {
            var um = new AdminModel
            {
                UMessage = "Update Success",
                UFlag = false,
            };
            try
            {
                var usersObj = new PaymentHistoryTable();

                usersObj.PaymentHistoryID = model.PaymentHistoryID;
                usersObj.UserTypeID = model.UserTypeID;
                usersObj.UserID = model.UserID;
                usersObj.PaymentID = model.PaymentID;
                usersObj.TicketsPurchased = model.TicketsPurchased;
                usersObj.UserPaymentPaid = model.UserPaymentPaid;
                usersObj.TicketID =model.TicketID;
                usersObj.EventID = model.EventID;
                usersObj.isDelete = 1;

                g.PaymentHistoryTables.Attach(usersObj);
                g.Entry(usersObj).State = System.Data.Entity.EntityState.Modified;
                g.SaveChanges();
                um.UFlag = true;

            }
            catch (Exception ex)
            {

                um.UMessage = ex.Message;
            }

            return um;
        }
    }
}
