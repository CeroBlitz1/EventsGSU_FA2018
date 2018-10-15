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
                var getusersObj = (from e in g.UserTables
                                   join ev in g.EventsTables on e.UserID equals ev.UserID
                                   join tt in g.TicketsTables on e.UserID equals tt.UserID
                                     select new
                                     {
                                         e.UserEmail,
                                         e.UserID,
                                         e.UserName,
                                         e.UserTypeID,
                                         e.UserPhoneNumber,
                                         e.UserPassword,
                                         e.isActive,





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
    }
}
