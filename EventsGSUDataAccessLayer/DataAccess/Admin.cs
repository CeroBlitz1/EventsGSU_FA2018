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
        GsuEventsDBEntities3 g = new GsuEventsDBEntities3();

       
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
                    getallUsersobj.UserTypeID = item.UserTypeID.ToString();
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
        public EventDetailsModel GetDetailsById(int? eventID)
        {
            var eventdetailslist = new EventDetailsModel();



            try
            {
                





                eventdetailslist = (from e in g.EventsTables
                                    join edd in g.EventDetails on e.EventID equals edd.EventID
                                    join tt in g.TicketsTables on e.EventID equals tt.EventID
                                    join ut in g.UserTables on e.UserID equals ut.UserID

                                    where e.EventID == eventID && e.isDelete==0
                                    select new EventDetailsModel()
                                    {
                                        EventImage = e.EventImage,
                                        EventTitle = e.EventTitle,
                                        EventDate = e.EventDate.ToString(),
                                        EventID = e.EventID,
                                        EventType = e.EventType,
                                        EventsDescription = edd.EventsDescription,
                                        EventDetailsID = edd.EventDetailsID,
                                        TicketID = tt.TicketID,
                                        TicketPrice = tt.TicketPrice,
                                        TicketQuantity = tt.TicketQuantity,
                                        EventLocation = e.EventLocation,
                                        UserID= ut.UserID,
                                        

                                    }
                             ).FirstOrDefault();
                

                

            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return eventdetailslist;
        }
        public List<SearchModel> SearchUsers(string query = "")
        {
            var getAllEventsList = new List<SearchModel>();
            try
            {
                

                if (String.IsNullOrEmpty(query))
                {
                    var geteventsObj = (from u in g.UserTables
                                        select new
                                        {
                                            u.UserID,

                                            u.UserName
                                        }).ToList();
                    foreach (var item in geteventsObj)
                    {
                        var searchModelObj = new SearchModel();


                        searchModelObj.UserID = item.UserID;
                        searchModelObj.UserName = item.UserName;

                        getAllEventsList.Add(searchModelObj);
                    }

                }
                else
                {

                    var geteventsObj = (from u in g.UserTables
                                                .Where(un => un.UserName.Contains(query))
                                        select new
                                        {
                                            u.UserID,

                                            u.UserName
                                        }).ToList();
                    foreach (var item in geteventsObj)
                    {
                        var searchModelObj = new SearchModel();


                        searchModelObj.UserID = item.UserID;
                        searchModelObj.UserName = item.UserName;

                        getAllEventsList.Add(searchModelObj);
                    }
                }

            }


            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return getAllEventsList;
        }
        public List<UserModel> SearchUserResults(string query = "")
        {
            var getallUserList = new List<UserModel>();
            try
            {
                

                if (String.IsNullOrEmpty(query))
                {
                    var getUserObj = (from u in g.UserTables

                                        select new
                                        {
                                           u.UserName,
                                           u.UserID,
                                           u.UserEmail                                                                                              
                                        }
                             ).ToList();
                    foreach (var item in getUserObj)
                    {
                        var searchModelObj = new UserModel();


                        searchModelObj.UserName = item.UserName;
                        searchModelObj.UserID = item.UserID;
                        searchModelObj.UserEmail = item.UserEmail;





                        getallUserList.Add(searchModelObj);
                    }

                }
                else
                {

                    var getUserObj = (from u in g.UserTables

                                                .Where(un => un.UserName.Contains(query))
                                        select new
                                        {
                                            u.UserName,
                                            u.UserID,
                                            u.UserEmail
                                        }).ToList();
                    foreach (var item in getUserObj)
                    {
                        var searchModelObj = new UserModel();


                        searchModelObj.UserName = item.UserName;
                        searchModelObj.UserID = item.UserID;
                        searchModelObj.UserEmail = item.UserEmail;

                        getallUserList.Add(searchModelObj);
                    }
                }

            }


            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return getallUserList;
        }
        public UserModel GetAdminUserInfobyID(int UserID)
        {
            var userdetailslist = new UserModel();

            try
            {
                userdetailslist = (from u in g.UserTables
                                   where u.UserID == UserID && u.isDelete==0
                                   select new UserModel()
                                   {
                                       UserName = u.UserName,
                                       UserPassword = u.UserPassword,
                                       UserEmail = u.UserEmail,
                                       UserPhoneNumber = u.UserPhoneNumber,
                                       UserTypeID=u.UserTypeID,
                                       UserID=u.UserID,
                                       isDelete = u.isDelete,
                                   }).FirstOrDefault();

            }
            catch (Exception ex)
            {

                string d = ex.Message;

            }
            return userdetailslist;
        }
        public List<AdminModel> SearchEmail(string query = "")
        {
            var getAllEventsList = new List<AdminModel>();
            try
            {


                if (String.IsNullOrEmpty(query))
                {
                    var geteventsObj = (from p in g.PaymentTables
                                        select new
                                        {
                                           p.UserEmail,
                                           p.PaymentID,
                                        }).ToList();
                    foreach (var item in geteventsObj)
                    {
                        var searchModelObj = new AdminModel();


                        searchModelObj.UserEmail = item.UserEmail;
                        searchModelObj.PaymentID = item.PaymentID;


                        getAllEventsList.Add(searchModelObj);
                    }

                }
                else
                {

                    var geteventsObj = (from p in g.PaymentTables
                                                .Where(ue => ue.UserEmail.Contains(query))
                                        select new
                                        {
                                            p.UserEmail,
                                            p.PaymentID,

                                        }).ToList();
                    foreach (var item in geteventsObj)
                    {
                        var searchModelObj = new AdminModel();


                        searchModelObj.UserEmail = item.UserEmail;
                        searchModelObj.PaymentID = item.PaymentID;
                        

                        getAllEventsList.Add(searchModelObj);
                    }
                }

            }


            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return getAllEventsList;
        }
        public List<AdminModel> SearchEmailResults(string query = "")
        {
            var getallUserList = new List<AdminModel>();
            try
            {


                if (String.IsNullOrEmpty(query))
                {
                    var getUserObj = (from pt in g.PaymentTables

                                      select new
                                      {
                                          pt.UserEmail,
                                          pt.UserID,
                                          pt.isDelete,
                                      }
                             ).ToList();
                    foreach (var item in getUserObj)
                    {
                        var searchModelObj = new AdminModel();


                        searchModelObj.UserEmail = item.UserEmail;
                        searchModelObj.UserID = item.UserID;
                        searchModelObj.isDelete = item.isDelete;





                        getallUserList.Add(searchModelObj);
                    }

                }
                else
                {

                    var getUserObj = (from pt in g.PaymentTables

                                                .Where(ue => ue.UserEmail.Contains(query))
                                      select new
                                      {
                                          pt.UserEmail,
                                          pt.UserID,
                                          pt.isDelete,
                                      }).ToList();
                    foreach (var item in getUserObj)
                    {
                        var searchModelObj = new AdminModel();


                        searchModelObj.UserEmail = item.UserEmail;
                        searchModelObj.UserID = item.UserID;
                        searchModelObj.isDelete = item.isDelete;

                        getallUserList.Add(searchModelObj);
                    }
                }

            }


            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return getallUserList;
        }
        public List<AdminModel> GetAdminPurchaseInfobyID(int UserID)
        {
            var UserhistoryDetailsList = new List<AdminModel>();
            try
            {
                var getUserHistoryDetailsObject = (from pht in g.PaymentHistoryTables
                                                   
                                                   join et in g.EventsTables on pht.EventID equals et.EventID
                                                   where pht.UserID == UserID
                                                   select new
                                                   {
                                                       pht.TicketsPurchased,
                                                       pht.UserPaymentPaid,
                                                       pht.UserID,
                                                       et.EventTitle,
                                                       pht.isDelete
                                                   }

                                        ).Distinct().ToList();
                foreach (var item in getUserHistoryDetailsObject)
                {
                    var userdetailsobject = new AdminModel();

                    userdetailsobject.TicketsPurchased = item.TicketsPurchased;
                    userdetailsobject.UserPaymentPaid = item.UserPaymentPaid;
                    userdetailsobject.UserID = item.UserID;
                    userdetailsobject.EventTitle = item.EventTitle;
                    userdetailsobject.isDelete = item.isDelete;
                    UserhistoryDetailsList.Add(userdetailsobject);
                }
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return UserhistoryDetailsList;
        }

        public AdminModel GetPurchaseList(int UserID)
        {
            var eventdetailslist = new AdminModel();



            try
            {
                
                eventdetailslist = (from pht in g.PaymentHistoryTables
                                    join et in g.EventsTables on pht.EventID equals et.EventID
                                   

                                    where pht.UserID == UserID
                                    select new AdminModel()
                                    {
                                        EventTitle = et.EventTitle,
                                        TicketsPurchased=pht.TicketsPurchased,
                                        UserID=pht.UserID,
                                        UserPaymentPaid=pht.UserPaymentPaid,
                                        isDelete=pht.isDelete,
                                        TicketID=pht.TicketID,
                                        PaymentHistoryID= pht.PaymentHistoryID,
                                        UserTypeID=pht.UserTypeID,
                                        EventID=pht.EventID,
                                        PaymentID=pht.PaymentID
                                    }
                             ).FirstOrDefault();
        

            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return eventdetailslist;
        }

    }
}
