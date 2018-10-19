using EventsGSUDataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace EventsGSUDataAccessLayer.DataAccess
{
    public class Admin
    {
        GsuEventsDBEntities g = new GsuEventsDBEntities();

        public List<AdminModel> GetPaymentHistoryadmin(AdminModel model)
        {
            var getallPaymentlist = new List<AdminModel>();
            try
            {
                var getpaymentObj = (from e in g.PaymentTables
                                    select new
                                    {
                                        e.PaymentID,
                                        e.FirstName,
                                        e.LastName,
                                        e.UserEmail,
                                        e.UserPhoneNumber,
                                        e.UserState,
                                        e.UserZipCode,
                                        e.UserCardNumber,
                                        e.UserCardExpiration,
                                        e.UserCardCVV,
                                        e.UserPaymentPaid
                                        
                                        
                                    }).ToList();

                foreach (var item in getpaymentObj)
                {
                    var getallpaymentobj = new AdminModel();

                   getallpaymentobj.PaymentID = item.PaymentID;
                   getallpaymentobj.FirstName = item.FirstName;
                   getallpaymentobj.LastName = item.LastName;
                   getallpaymentobj.UserEmail = item.UserEmail;
                   getallpaymentobj.UserPhoneNumber = item.UserPhoneNumber;
                   getallpaymentobj.UserState = item.UserState;
                   getallpaymentobj.UserZipCode = item.UserZipCode;
                   getallpaymentobj.UserCardNumber = item.UserCardNumber;
                   getallpaymentobj.UserCardExpiration = item.UserCardExpiration;
                   getallpaymentobj.UserCardCVV = item.UserCardCVV;
                   getallpaymentobj.UserPaymentPaid = item.UserPaymentPaid;



                    getallPaymentlist.Add(getallpaymentobj);
                }
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return getallPaymentlist;
        }
        public List<AdminModel> GetUserHistoryadmin(AdminModel model)
        {
            var getallUserslist = new List<AdminModel>();
            try
            {
                var getusersObj = (from u in g.UserTables
                                   join et in g.EventsTables on u.UserID equals et.UserID
                                   join ph in g.PaymentHistoryTables on u.UserID equals ph.UserID
                                     select new
                                     {
                                         u.UserEmail,
                                         u.UserID,
                                         u.UserName,
                                         u.UserTypeID,
                                         u.UserPhoneNumber,
                                         u.UserPassword,
                                         u.isActive,





                                     }).ToList();

                foreach (var item in getusersObj)
                {
                    var getallUsersobj = new AdminModel();

                    getallUsersobj.UserEmail = item.UserEmail;
                    getallUsersobj.UserID = item.UserID;
                    getallUsersobj.UserName = item.UserName;
                    getallUsersobj.UserPassword = item.UserPassword;
                    getallUsersobj.UserTypeID = item.UserTypeID;
                    getallUsersobj.UserPhoneNumber = item.UserPhoneNumber;
                    getallUsersobj.isActive = item.isActive;




                    getallUserslist.Add(getallUsersobj);
                }
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return getallUserslist;
        }
        public List<AdminModel> GetEventHistoryadmin(AdminModel model)
        {
            var getalleventlist = new List<AdminModel>();
            try
            {
                var getEventsObj = (from u in g.UserTables
                                   join et in g.EventsTables on u.UserID equals et.UserID
                                   join tt in g.TicketsTables on u.UserID equals tt.UserID
                                   join ed in g.EventDetails on u.UserID equals ed.UserID                                   
                                   select new
                                   {
                                       u.UserID,
                                       u.UserName,
                                       u.UserTypeID,
                                       et.EventID,
                                       et.EventImage,
                                       et.EventTitle,
                                       et.EventType,
                                       et.EventLocation,
                                       ed.EventsDescription,
                                       tt.TicketID,
                                       tt.TicketImage,
                                       tt.TicketPrice,
                                       tt.TicketQuantity,
                                   }).ToList();

                foreach (var item in getEventsObj)
                {
                    var getallEventssobj = new AdminModel();

                    getallEventssobj.UserName = item.UserName;
                    getallEventssobj.UserID = item.UserID;
                    getallEventssobj.UserTypeID = item.UserTypeID;
                    getallEventssobj.EventID = item.EventID;
                    getallEventssobj.EventImage = item.EventImage;
                    getallEventssobj.EventTitle = item.EventTitle;
                    getallEventssobj.EventType = item.EventType;
                    getallEventssobj.EventsDescription = item.EventsDescription;
                    getallEventssobj.TicketID = item.TicketID;
                    getallEventssobj.TicketImage = item.TicketImage;
                    getallEventssobj.TicketPrice = item.TicketPrice;
                    getallEventssobj.TicketQuantity = item.TicketQuantity;

                    getalleventlist.Add(getallEventssobj);
                }
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return getalleventlist;
        }
    }
}
