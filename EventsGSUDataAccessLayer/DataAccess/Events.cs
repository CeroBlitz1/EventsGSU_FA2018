using EventsGSUDataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Data.Linq;

namespace EventsGSUDataAccessLayer.DataAccess
{
    public class Events
    {
        GsuEventsDBEntities1 g = new GsuEventsDBEntities1();

        public EventModel SaveEvents(EventModel model)
        {

            var em = new EventModel
            {
                EFlag= false,
                EMessage = "Update Successful"
            };
            try
            {
                var et = new EventsTable();
                var tt = new TicketsTable();
                var ed = new EventDetail();


                //userObj.EventID
                //et.EventID = model.EventID;
                et.EventLocation = model.EventLocation;
                et.EventDate = model.EventDate;
                et.EventType = model.EventType;
                et.EventImage = model.EventImage;
                et.EventTitle = model.EventTitle;
                //et.UserID = model.UserId;

                //tt.TicketImage = model.TicketImage;
                tt.TicketPrice = model.TicketPrice;
                tt.TicketQuantity = model.TicketQuantity;
                //tt.MaxTickets = model.MaxTickets;
                //tt.UserID = model.UserId;
                //tt.EventID = et.EventID;

                //ed.EventID = et.EventID;
                ed.EventsDescription = model.EventsDescription;
                //ed.UserID = model.UserId;







                g.EventsTables.Add(et);
                g.TicketsTables.Add(tt);
                g.EventDetails.Add(ed);

                
                g.SaveChanges();



                em.EFlag = true;
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return em;
        }

        public List<EventModel> GetEvents(EventModel model)
        {
            var eventObj = new List<EventModel>();

            try
            {
                //var et = g.EventsTables.OrderByDescending(i => i).Take(3).ToList();
                var et = g.EventsTables.Take(3).ToList();
                //var et = g.EventsTables.Where(x=>x.IsValid != 0).Take(3).ToList();
                foreach (var e in et)
                {
                    var eModel = new EventModel();
                    eModel.EventImage = e.EventImage;
                    eModel.EventTitle = e.EventTitle;
                    eModel.EventDate = e.EventDate;
                    eModel.EventLocation = e.EventLocation;
                    eModel.EventID = e.EventID;

                    eventObj.Add(eModel);
                }
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return eventObj;
        }
        #region Commented
        //public List<EventDetailsModel> GetDetailsById(int? eventID)
        //{
        //    var eventdetailslist = new List<EventDetailsModel>();



        //    try
        //    {
        //        #region
        //        //var ed = g.EventDetails.Where(s => s.EventID == eventID).ToList();
        //        //var et = g.EventsTables.Where(s => s.EventID == eventID).ToList();
        //        //var tic = g.TicketsTables.Where(s => s.EventID == eventID).ToList();
        //        #endregion //Old Code //Old code





        //        var GetDetailsidObj = (from e in g.EventsTables
        //                               join edd in g.EventDetails on e.EventID equals edd.EventID
        //                               join tt in g.TicketsTables on e.EventID equals tt.EventID

        //                               where e.EventID == eventID
        //                               select new
        //                               {
        //                                   e.EventImage,
        //                                   e.EventTitle,
        //                                   e.EventDate,
        //                                   e.EventID,
        //                                   edd.EventsDescription,
        //                                   tt.TicketID,
        //                                   tt.TicketPrice
        //                               }
        //                     ).ToList();


        //        foreach (var item in GetDetailsidObj)
        //        {
        //            var eventdetailsobject = new EventDetailsModel(); // eventObject

        //            eventdetailsobject.EventID = item.EventID;
        //            eventdetailsobject.EventTitle = item.EventTitle;
        //            eventdetailsobject.EventImage = item.EventImage;
        //            eventdetailsobject.TicketID = item.TicketID;
        //            eventdetailsobject.TicketPrice = item.TicketPrice;
        //            eventdetailsobject.EventsDescription = item.EventsDescription;
        //            eventdetailsobject.EventDate = item.EventDate.ToString();
        //            eventdetailslist.Add(eventdetailsobject);
        //        }
        //        //return eventObj2;



        //        #region
        //        //foreach (var e in et)
        //        //{
        //        //    var eModel = new EventDetailsModel();
        //        //    eModel.EventImage = e.EventImage;
        //        //    eModel.EventTitle = e.EventTitle;
        //        //    eModel.EventDate = e.CreatedDate.ToString();
        //        //    eModel.EventID = e.EventID;
        //        //    eventObj.Add(eModel);
        //        //}
        //        //foreach (var e in ed)
        //        //{
        //        //    var eModel1 = new EventDetailsModel();
        //        //    eModel1.EventsDescription = e.EventsDescription;
        //        //    eventObj.Add(eModel1);
        //        //}
        //        //foreach (var e in tic)
        //        //{
        //        //    var eModel2 = new EventDetailsModel();
        //        //    eModel2.TicketID = e.TicketID;
        //        //    eModel2.TicketPrice = e.TicketPrice;
        //        //    eventObj.Add(eModel2);

        //        //}
        //        #endregion // Old code


        //    }
        //    catch (Exception ex)
        //    {
        //        string d = ex.Message;
        //    }
        //    return eventdetailslist;
        //}
        #endregion


        public EventDetailsModel GetDetailsById(int? eventID)
        {
            var eventdetailslist = new EventDetailsModel();



            try
            {
                #region
                //var ed = g.EventDetails.Where(s => s.EventID == eventID).ToList();
                //var et = g.EventsTables.Where(s => s.EventID == eventID).ToList();
                //var tic = g.TicketsTables.Where(s => s.EventID == eventID).ToList();
                #endregion //Old Code //Old code





                eventdetailslist = (from e in g.EventsTables
                                       join edd in g.EventDetails on e.EventID equals edd.EventID
                                       join tt in g.TicketsTables on e.EventID equals tt.EventID

                                       where e.EventID == eventID
                                       select new EventDetailsModel()
                                       {
                                          EventImage=  e.EventImage,
                                           EventTitle = e.EventTitle,
                                           EventDate= e.EventDate.ToString(),
                                           EventID= e.EventID,
                                           EventType = e.EventType,
                                           EventsDescription=edd.EventsDescription,
                                           EventDetailsID = edd.EventDetailsID,
                                           TicketID=tt.TicketID,
                                           TicketPrice=tt.TicketPrice,
                                           TicketQuantity = tt.TicketQuantity,
                                           EventLocation = e.EventLocation,
                                           
                                       }
                             ).FirstOrDefault();
                #region Commneted 11 6 2018 8:36
                //foreach (var item in GetDetailsidObj)
                //{
                //    var eventdetailsobject = new EventDetailsModel(); // eventObject

                //    eventdetailsobject.EventID = item.EventID;
                //    eventdetailsobject.EventTitle = item.EventTitle;
                //    eventdetailsobject.EventImage = item.EventImage;
                //    eventdetailsobject.TicketID = item.TicketID;
                //    eventdetailsobject.TicketPrice = item.TicketPrice;
                //    eventdetailsobject.EventsDescription = item.EventsDescription;
                //    eventdetailsobject.EventDate = item.EventDate.ToString();
                //    eventdetailslist.Add(eventdetailsobject);
                //}
                //return eventObj2;
                #endregion
                                                          
                #region
                //foreach (var e in et)
                //{
                //    var eModel = new EventDetailsModel();
                //    eModel.EventImage = e.EventImage;
                //    eModel.EventTitle = e.EventTitle;
                //    eModel.EventDate = e.CreatedDate.ToString();
                //    eModel.EventID = e.EventID;
                //    eventObj.Add(eModel);
                //}
                //foreach (var e in ed)
                //{
                //    var eModel1 = new EventDetailsModel();
                //    eModel1.EventsDescription = e.EventsDescription;
                //    eventObj.Add(eModel1);
                //}
                //foreach (var e in tic)
                //{
                //    var eModel2 = new EventDetailsModel();
                //    eModel2.TicketID = e.TicketID;
                //    eModel2.TicketPrice = e.TicketPrice;
                //    eventObj.Add(eModel2);

                //}
                #endregion // Old code


            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return eventdetailslist;
        }

        public List<EventModel> GetAllEvents(EventModel model)
        {
            var getalleventslist = new List<EventModel>();
            try
            {
                var geteventsObj = (from e in g.EventsTables
                                    select new
                                    {
                                        e.EventID,
                                        e.EventImage,
                                        e.EventLocation,
                                        e.EventDate,
                                        e.EventType,
                                        e.EventTitle
                                    }).ToList();

                foreach (var item in geteventsObj)
                {
                    var getalleventsobj = new EventModel();

                    getalleventsobj.EventID = item.EventID;
                    getalleventsobj.EventImage = item.EventImage;
                    getalleventsobj.EventLocation = item.EventLocation;
                    getalleventsobj.EventDate = item.EventDate;
                    getalleventsobj.EventType = item.EventType;
                    getalleventsobj.EventTitle = item.EventTitle;
                    getalleventslist.Add(getalleventsobj);
                }
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return getalleventslist;
        }

        public List<EventDetailsModel> GetEventDetails(EventDetailsModel model)
        {
            var eventObj = new List<EventDetailsModel>();



            try
            {
                var ed = g.EventDetails.ToList();
                var et = g.EventsTables.ToList();
                var tic = g.TicketsTables.ToList();

                foreach (var e in et)
                {
                    var eModel = new EventDetailsModel();
                    eModel.EventImage = e.EventImage;
                    eModel.EventTitle = e.EventTitle;
                    eModel.EventDate = e.CreatedDate.ToString();
                    eModel.EventID = e.EventID;
                    eventObj.Add(eModel);
                }
                foreach (var e in ed)
                {
                    var eModel1 = new EventDetailsModel();
                    eModel1.EventsDescription = e.EventsDescription;
                    eventObj.Add(eModel1);
                }
                foreach (var e in tic)
                {
                    var eModel2 = new EventDetailsModel();
                    eModel2.TicketID = e.TicketID;
                    eModel2.TicketPrice = e.TicketPrice;
                    eventObj.Add(eModel2);

                }



            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return eventObj;
        }
        #region Commented
        //public List<EventsTable> SearchEvents(string query = "")
        //{
        //    var getalleventslist = new List<EventsTable>();
        //    try
        //    {
        //        //g.Configuration.ProxyCreationEnabled = false;
        //        //var geteventsObj = (from e in g.EventsTables
        //        //                    .Where(et => et.EventTitle.Contains(query))
        //        //                    select new
        //        //                    {
        //        //                        e.EventID,
        //        //                        e.EventTitle
        //        //                    }).ToList();
        //        //foreach (var item in geteventsObj)
        //        //{
        //        //    var getalleventsobj = new SearchModel();


        //        //    getalleventsobj.EventTitle = item.EventTitle;
        //        //    getalleventslist.Add(getalleventsobj);
        //        //}
        //        //getalleventslist = String.IsNullOrEmpty(query) ? g.EventsTables.ToList() :
        //        //g.EventsTables.Where(p => p.EventTitle.Contains(query)).ToList();



        //        //if (String.IsNullOrEmpty(query))
        //        //{
        //        //    getalleventslist = g.EventsTables.Select(t=>t.EventTitle).ToList();

        //        //}
        //        //else
        //        //{
        //        //    getalleventslist = g.EventsTables.Where(p => p.EventTitle.Contains(query)).Select(t => t.EventTitle).ToList();
        //        //}
        //        if (String.IsNullOrEmpty(query))
        //        {
        //            getalleventslist = g.EventsTables.ToList();

        //        }
        //        else
        //        {
        //            getalleventslist = g.EventsTables.Where(p => p.EventTitle.Contains(query)).ToList();
        //        }

        //    }


        //    catch (Exception ex)
        //    {
        //        string d = ex.Message;
        //    }
        //    return getalleventslist;
        //}
        #endregion

        #region Notes
        /*
                 * index page dynamic table populate
                 * serach result page
                 * serch controller
                 * fix jistry tble ui
                 * */
        #endregion

        public List<SearchModel> SearchEvents(string query = "")
        {
            var getAllEventsList = new List<SearchModel>();
            try
            {
                #region commented
                //g.Configuration.ProxyCreationEnabled = false;
                //var geteventsObj = (from e in g.EventsTables
                //                    .Where(et => et.EventTitle.Contains(query))
                //                    select new
                //                    {
                //                        e.EventID,
                //                        e.EventTitle
                //                    }).ToList();
                //foreach (var item in geteventsObj)
                //{
                //    var getalleventsobj = new SearchModel();


                //    getalleventsobj.EventTitle = item.EventTitle;
                //    getalleventslist.Add(getalleventsobj);
                //}
                //getalleventslist = String.IsNullOrEmpty(query) ? g.EventsTables.ToList() :
                //g.EventsTables.Where(p => p.EventTitle.Contains(query)).ToList();



                //if (String.IsNullOrEmpty(query))
                //{
                //    getalleventslist = g.EventsTables.Select(t=>t.EventTitle).ToList();

                //}
                //else
                //{
                //    getalleventslist = g.EventsTables.Where(p => p.EventTitle.Contains(query)).Select(t => t.EventTitle).ToList();
                //}
                #endregion

                if (String.IsNullOrEmpty(query))
                {
                    var geteventsObj = (from e in g.EventsTables
                                        select new
                                        {
                                            e.EventID,

                                            e.EventTitle
                                        }).ToList();
                    foreach (var item in geteventsObj)
                    {
                        var searchModelObj = new SearchModel();


                        searchModelObj.EventId = item.EventID;
                        searchModelObj.EventTitle = item.EventTitle;

                        getAllEventsList.Add(searchModelObj);
                    }

                }
                else
                {

                    var geteventsObj = (from e in g.EventsTables
                                                .Where(et => et.EventTitle.Contains(query))
                                        select new
                                        {
                                            e.EventID,

                                            e.EventTitle
                                        }).ToList();
                    foreach (var item in geteventsObj)
                    {
                        var searchModelObj = new SearchModel();


                        searchModelObj.EventId = item.EventID;
                        searchModelObj.EventTitle = item.EventTitle;

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


        public List<EventModel> SearchResults(string query = "")
        {
            var getAllEventsList = new List<EventModel>();
            try
            {
                #region commented
                //g.Configuration.ProxyCreationEnabled = false;
                //var geteventsObj = (from e in g.EventsTables
                //                    .Where(et => et.EventTitle.Contains(query))
                //                    select new
                //                    {
                //                        e.EventID,
                //                        e.EventTitle
                //                    }).ToList();
                //foreach (var item in geteventsObj)
                //{
                //    var getalleventsobj = new SearchModel();


                //    getalleventsobj.EventTitle = item.EventTitle;
                //    getalleventslist.Add(getalleventsobj);
                //}
                //getalleventslist = String.IsNullOrEmpty(query) ? g.EventsTables.ToList() :
                //g.EventsTables.Where(p => p.EventTitle.Contains(query)).ToList();



                //if (String.IsNullOrEmpty(query))
                //{
                //    getalleventslist = g.EventsTables.Select(t=>t.EventTitle).ToList();

                //}
                //else
                //{
                //    getalleventslist = g.EventsTables.Where(p => p.EventTitle.Contains(query)).Select(t => t.EventTitle).ToList();
                //}
                #endregion

                if (String.IsNullOrEmpty(query))
                {
                    var geteventsObj = (from e in g.EventsTables
                                       
                                       select new
                                       {
                                           e.EventImage,
                                           e.EventTitle,
                                           e.EventDate,
                                           e.EventID,
                                           e.EventLocation
                                       }
                             ).ToList();
                    foreach (var item in geteventsObj)
                    {
                        var searchModelObj = new EventModel();


                        searchModelObj.EventID = item.EventID;
                        searchModelObj.EventTitle = item.EventTitle;
                        searchModelObj.EventDate = item.EventDate;
                        searchModelObj.EventLocation = item.EventLocation;
                        searchModelObj.EventImage = item.EventImage;

                        

                        getAllEventsList.Add(searchModelObj);
                    }

                }
                else
                {

                    var geteventsObj = (from e in g.EventsTables

                                                .Where(et => et.EventTitle.Contains(query))
                                        select new
                                        {
                                            e.EventImage,
                                            e.EventTitle,
                                            e.EventDate,
                                            e.EventID,
                                            e.EventLocation
                                        }).ToList();
                    foreach (var item in geteventsObj)
                    {
                        var searchModelObj = new EventModel();


                        searchModelObj.EventID = item.EventID;
                        searchModelObj.EventTitle = item.EventTitle;
                        searchModelObj.EventDate = item.EventDate;
                        searchModelObj.EventLocation = item.EventLocation;
                        searchModelObj.EventImage = item.EventImage;

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
        public List<EventModel> EventsByUserID(int UserID)
        {
            var getalleventslist = new List<EventModel>();
            try
            {
                var geteventsObj = (from e in g.EventsTables
                                    where e.UserID == UserID
                                    select new
                                    {
                                        e.EventID,
                                        e.EventImage,
                                        e.EventTitle,
                                        e.EventDate,
                                        e.EventLocation,
                                        
                                    }).ToList();

                foreach (var item in geteventsObj)
                {
                    var getalleventsobj = new EventModel();

                    getalleventsobj.EventID = item.EventID;
                    getalleventsobj.EventTitle = item.EventTitle;
                    getalleventsobj.EventImage = item.EventImage;
                    getalleventsobj.EventDate = item.EventDate;
                    getalleventsobj.EventLocation = item.EventLocation;
                    getalleventslist.Add(getalleventsobj);
                }

            }
            catch(Exception ex)
            {
                string d = ex.Message;
            }
            return getalleventslist;
        }
        public List<EventModel> TicktesByEventID(int? eventID)
        {
            var getalleventslist = new List<EventModel>();
            try
            {
                //join edd in g.EventDetails on e.EventID equals edd.EventID
                var geteventsObj = (from ph in g.PaymentHistoryTables
                                    join pt in g.PaymentTables on ph.UserID equals pt.UserID
                                    where ph.EventID == eventID
                                    select new
                                    {
                                        pt.FirstName,
                                        pt.LastName,
                                        ph.TicketsPurchased,
                                        

                                    }).ToList();

                foreach (var item in geteventsObj)
                {
                    var getalleventsobj = new EventModel();

                    getalleventsobj.FirstName = item.FirstName;
                    getalleventsobj.LastName = item.LastName;
                    getalleventsobj.TicketsPurchased = item.TicketsPurchased;
                    getalleventslist.Add(getalleventsobj);
                }

            }
            catch(Exception ex)
            {
                string d = ex.Message;
            }
            return getalleventslist;
        }
        #region Notes
        /*
        for user_mange_event
        GET method to populate the page
        public EventDetailsModel GetDetailsById(int? eventID)

           and then use
            public bool SaveEvents(EventModel model)

            */
        #endregion
        #region Code commented on 11/10/2018
        //public EventModel UpdateByEventID(int? eventID, EventModel model)
        //{

        //    var em = new EventModel
        //    {
        //        EFlag = false,
        //        EMessage = "Update Successful"
        //    };
        //    try
        //    {
        //        var et = new EventsTable();
        //        var tt = new TicketsTable();
        //        var ed = new EventDetail();


        //        //userObj.EventID
        //        //et.EventID = model.EventID;
        //        et.EventLocation = model.EventLocation;
        //        et.EventDate = model.EventDate;
        //        et.EventType = model.EventType;
        //        //et.EventImage = model.EventImage;
        //        et.EventTitle = model.EventTitle;
        //        //et.UserID = model.UserId;

        //        //tt.TicketImage = model.TicketImage;
        //        tt.TicketPrice = model.TicketPrice;
        //        tt.TicketQuantity = model.TicketQuantity;
        //        //tt.MaxTickets = model.MaxTickets;
        //        //tt.UserID = model.UserId;
        //        //tt.EventID = et.EventID;

        //        //ed.EventID = et.EventID;
        //        ed.EventsDescription = model.EventsDescription;
        //        //ed.UserID = model.UserId;







        //        g.EventsTables.Add(et);
        //        g.Entry(et).State = System.Data.Entity.EntityState.Modified;
        //        g.TicketsTables.Add(tt);
        //        g.Entry(tt).State = System.Data.Entity.EntityState.Modified;
        //        g.EventDetails.Add(ed);
        //        g.Entry(et).State = System.Data.Entity.EntityState.Modified;
        //        g.SaveChanges();






        //        em.EFlag = true;
        //    }
        //    catch (Exception ex)
        //    {
        //        string d = ex.Message;
        //    }
        //    return em;
        //}
        #endregion

    }

}
