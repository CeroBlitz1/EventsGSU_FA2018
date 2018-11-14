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
        public PaymentModel SavePayment(PaymentModel model)
        {

            var pm = new PaymentModel
            {
                PMessage = "Payment SuccessFul",
                PFlag = false,

            };
            try
            {
                var paymentObj = new PaymentTable();
                var paymentHobj = new PaymentHistoryTable();
                var query = g.PaymentTables.Where(x => x.UserCardNumber == model.UserCardNumber);
                if (query == null)
                {
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


                    g.SaveChanges();

                }
                var querypay = g.PaymentTables.Where(x => x.PaymentID == model.PaymentID);
                if (querypay != null)
                {
                    paymentHobj.PaymentID = model.PaymentID;
                }
                else
                {
                    paymentHobj.PaymentID = paymentObj.PaymentID;
                }
                paymentHobj.UserPaymentPaid = model.UserPaymentPaid;
                paymentHobj.UserID = model.UserID;
                paymentHobj.UserTypeID = model.UserTypeID.ToString();
                paymentHobj.EventID = model.EventID;
                paymentHobj.TicketID = model.TicketID;
                paymentHobj.TicketsPurchased = 1;

                g.PaymentHistoryTables.Add(paymentHobj);
                g.SaveChanges();



                pm.PFlag = true;
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
                                         where pt.UserID == UserID
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


        //    public List<PaymentModel> GetPaymentById(int? UserID)
        //    {
        //        var eventdetailslist = new List<EventDetailsModel>();



        //        try
        //        {
        //            #region
        //            //var ed = g.EventDetails.Where(s => s.EventID == eventID).ToList();
        //            //var et = g.EventsTables.Where(s => s.EventID == eventID).ToList();
        //            //var tic = g.TicketsTables.Where(s => s.EventID == eventID).ToList();
        //            #endregion //Old Code //Old code

        //            //from t1 in db.Table1
        //            //join t2 in db.Table2 on t1.field equals t2.field
        //            //select new { t1.field2, t2.field3 }



        //            var GetDetailsidObj = (from pt in g.PaymentTables
        //                                   join pht in g.PaymentHistoryTables on pt.UserID equals pht.UserID


        //                                   where pt.UserID == UserID
        //                                   select new
        //                                   {
        //                                       pt.EventID,
        //                                       pt.TicketID,
        //                                       pt.UserID,
        //                                       pht.UserTypeID
        //                                   ,

        //                                   }
        //                         ).ToList();


        //            foreach (var item in GetDetailsidObj)
        //            {
        //                var eventdetailsobject = new EventDetailsModel(); // eventObject

        //                eventdetailsobject.EventID = item.EventID;
        //                eventdetailsobject.EventTitle = item.EventTitle;
        //                eventdetailsobject.EventImage = item.EventImage;
        //                eventdetailsobject.TicketID = item.TicketID;
        //                eventdetailsobject.TicketPrice = item.TicketPrice;
        //                eventdetailsobject.EventsDescription = item.EventsDescription;
        //                eventdetailsobject.EventDate = item.EventDate.ToString();
        //                eventdetailslist.Add(eventdetailsobject);
        //            }
        //            //return eventObj2;



        //            #region
        //            //foreach (var e in et)
        //            //{
        //            //    var eModel = new EventDetailsModel();
        //            //    eModel.EventImage = e.EventImage;
        //            //    eModel.EventTitle = e.EventTitle;
        //            //    eModel.EventDate = e.CreatedDate.ToString();
        //            //    eModel.EventID = e.EventID;
        //            //    eventObj.Add(eModel);
        //            //}
        //            //foreach (var e in ed)
        //            //{
        //            //    var eModel1 = new EventDetailsModel();
        //            //    eModel1.EventsDescription = e.EventsDescription;
        //            //    eventObj.Add(eModel1);
        //            //}
        //            //foreach (var e in tic)
        //            //{
        //            //    var eModel2 = new EventDetailsModel();
        //            //    eModel2.TicketID = e.TicketID;
        //            //    eModel2.TicketPrice = e.TicketPrice;
        //            //    eventObj.Add(eModel2);

        //            //}
        //            #endregion // Old code


        //        }
        //        catch (Exception ex)
        //        {
        //            string d = ex.Message;
        //        }
        //        return eventdetailslist;
        //    }
        public List<PaymentModel> GetUserDetails(int? UserID)
        {
            var UserhistoryDetailsList = new List<PaymentModel>();
            try
            {
                var getUserHistoryDetailsObject = (from pt in g.PaymentTables
                                            join ph in g.PaymentHistoryTables on pt.UserID equals ph.UserID
                                            join et in g.EventsTables on ph.EventID equals et.EventID
                                            where pt.UserID == UserID
                                            select new
                                            {
                                                pt.FirstName,
                                                pt.LastName,
                                                pt.UserEmail,
                                                ph.TicketsPurchased,
                                                pt.UserCardExpiration,
                                                et.EventTitle
                                            }

                                        ).ToList();
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
    }
}
