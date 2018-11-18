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
        GsuEventsDBEntities1 g = new GsuEventsDBEntities1();

       
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
        public EventDetailsModel GetDetailsById(int? eventID)
        {
            var eventdetailslist = new EventDetailsModel();



            try
            {
                





                eventdetailslist = (from e in g.EventsTables
                                    join edd in g.EventDetails on e.EventID equals edd.EventID
                                    join tt in g.TicketsTables on e.EventID equals tt.EventID
                                    join ut in g.UserTables on e.UserID equals ut.UserID

                                    where e.EventID == eventID
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
                                   where u.UserID == UserID
                                   select new UserModel()
                                   {
                                       UserName = u.UserName,
                                       UserPassword = u.UserPassword,
                                       UserEmail = u.UserEmail,
                                       UserPhoneNumber = u.UserPhoneNumber,
                                       UserTypeID=u.UserTypeID,
                                       UserID=u.UserID,
                                   }).FirstOrDefault();

            }
            catch (Exception ex)
            {

                string d = ex.Message;

            }
            return userdetailslist;
        }


    }
}
