﻿using EventsGSUDataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace EventsGSUDataAccessLayer.DataAccess
{
    public class Events
    {
        GsuEventsDBEntities g = new GsuEventsDBEntities();

        public bool SaveEvents(EventModel  model)
        {
            
            var retVal = false;
            try
            {
                var userObj = new EventsTable();
                var userObj1 = new TicketsTable();
                var userObj2 = new EventDetail();
                

                //userObj.EventID
                userObj.EventLocation =model.EventLocation;
                userObj.EventDate = model.EventDate;
                userObj.EventType = model.EventType;
                userObj.EventImage = model.EventImage;
                userObj.EventTitle = model.EventTitle;
                userObj1.TicketImage = model.TicketImage;
                userObj1.TicketPrice = model.TicketPrice;
                userObj1.TicketQuantity = model.TicketQuantity;
                userObj2.EventsDescription = model.EventsDescription;





                g.EventsTables.Add(userObj);

                userObj1.EventID = userObj.EventID;
                g.TicketsTables.Add(userObj1);
                g.SaveChanges();

                userObj2.EventID = userObj.EventID;
               
                //userObj2.UserID = 2;

                g.EventDetails.Add(userObj2);
                g.SaveChanges();



                retVal = true;
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return retVal;
        }

        public List<EventModel> GetEvents(EventModel model)
        {
            var eventObj = new List<EventModel>();

            try
            {
                //var et = g.EventsTables.OrderByDescending(i => i).Take(3).ToList();
                var et = g.EventsTables.Take(3).ToList();
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
        public List<EventDetailsModel> GetDetailsById(int? eventID)
        {
            var eventdetailslist = new List<EventDetailsModel>();



            try
            {
                #region
                //var ed = g.EventDetails.Where(s => s.EventID == eventID).ToList();
                //var et = g.EventsTables.Where(s => s.EventID == eventID).ToList();
                //var tic = g.TicketsTables.Where(s => s.EventID == eventID).ToList();
                #endregion //Old Code //Old code





                var GetDetailsidObj = (from e in g.EventsTables
                            join edd in g.EventDetails on e.EventID equals edd.EventID
                            join tt in g.TicketsTables on e.EventID equals tt.EventID

                            where e.EventID == eventID
                            select new
                            {
                                e.EventImage,
                                e.EventTitle,
                                e.EventDate,
                                e.EventID
                            ,
                                edd.EventsDescription,
                                tt.TicketID,
                                tt.TicketPrice
                            }
                             ).ToList();


                foreach (var item in GetDetailsidObj)
                {
                    var eventdetailsobject = new EventDetailsModel(); // eventObject

                    eventdetailsobject.EventID = item.EventID;
                    eventdetailsobject.EventTitle = item.EventTitle;
                    eventdetailsobject.EventImage = item.EventImage;
                    eventdetailsobject.TicketID = item.TicketID;
                    eventdetailsobject.TicketPrice = item.TicketPrice;
                    eventdetailsobject.EventsDescription = item.EventsDescription;
                    eventdetailsobject.EventDate = item.EventDate.ToString();
                    eventdetailslist.Add(eventdetailsobject);
                }
                //return eventObj2;



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
                var geteventsObj = (from e in g.EventsTables select new {
                    e.EventID,
                    e.EventImage,
                    e.EventLocation,
                    e.EventDate,
                    e.EventType,
                    e.EventTitle
                }).ToList();

                foreach(var item in geteventsObj)
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
            catch(Exception ex)
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

    }
      
 

}
