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
                var paymentObj = new PaymentTable();
                var paymentHobj = new PaymentHistoryTable();

                paymentObj.FirstName = model.FirstName;
                paymentObj.LastName = model.LastName;
                paymentObj.UserEmail = model.UserEmail;
                paymentObj.UserPhoneNumber = model.UserPhoneNumber;
                paymentObj.UserCardNumber = model.UserCardNumber;
                paymentObj.UserCardExpiration =Convert.ToDateTime(model.UserCardExpiration);
                paymentObj.UserID = model.UserID;
                paymentObj.UserCardCVV = model.UserCardCVV;
                paymentObj.UserAddress = model.UserAddress;
                paymentObj.UserZipCode = model.UserZipCode;
                paymentObj.UserState = model.UserState;
                paymentHobj.UserPaymentPaid = model.UserPaymentPaid;
                paymentHobj.UserID = model.UserID;
                paymentHobj.UserTypeID = model.UserTypeID.ToString();
                paymentHobj.EventID = model.EventID;
                paymentHobj.TicketID = model.TicketID;
                paymentHobj.TicketsPurchased = 1;

                g.PaymentTables.Add(paymentObj);
                g.PaymentHistoryTables.Add(paymentHobj);
                g.SaveChanges();

                paymentObj.PaymentID = paymentHobj.PaymentID;
                g.SaveChanges();

                

                retVal = true;
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return retVal;
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

        public List<UserModel> UpdateUserTypeCode(int? UserID)
        {
            var UserModelList = new List<UserModel>();
            try
            {
                var getUserTypeObject = (from ut in g.UserTables
                                                   where ut.UserID == UserID
                                                   select new
                                                   {
                                                       ut.UserTypeID
                                                   }

                                                       ).ToList();
                foreach (var item in getUserTypeObject)
                {
                    var userdetailsobject = new PaymentModel();

                    userdetailsobject.UserTypeID = 2;
                }

            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return UserModelList;

            //List<Person> results = (from p in Context.Persons
            //                        where .... // add where condition here
            //            select p).ToList();

            //foreach (Person p in results)
            //{
            //    p.is_default = false;
            //}

            //Context.SaveChanges();

        }
    }
}
