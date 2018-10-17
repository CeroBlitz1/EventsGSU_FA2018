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
        GsuEventsDBEntities g = new GsuEventsDBEntities();
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
    }
}
