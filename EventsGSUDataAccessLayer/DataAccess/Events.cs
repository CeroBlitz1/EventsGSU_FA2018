using EventsGSUDataAccessLayer.Models;
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
        GsuEventsDBEntities1 g = new GsuEventsDBEntities1();

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
                    eModel.EventDate = e.CreatedDate.ToString();
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
            var eventObj = new List<EventDetailsModel>();

            

            try
            {
                var ed = g.EventDetails.Where(s => s.EventID == eventID).ToList(); 
                var et = g.EventsTables.Where(s => s.EventID == eventID).ToList();
                var tic = g.TicketsTables.Where(s => s.EventID == eventID).ToList();
                
                foreach (var e in et)
                {
                    var eModel = new EventDetailsModel();
                    eModel.EventImage = e.EventImage;
                    eModel.EventTitle = e.EventTitle;
                    eModel.EventDate = e.CreatedDate.ToString();
                    eModel.EventID = e.EventID;
                    eventObj.Add(eModel);
                }
                foreach(var e in ed)
                {
                    var eModel1 = new EventDetailsModel();
                    eModel1.EventsDescription = e.EventsDescription;
                    eventObj.Add(eModel1);
                }
                foreach(var e in tic)
                {
                    var eModel2 = new EventDetailsModel();
                    eModel2.TicketID = e.TicketID;
                    eModel2.TicketPrice = e.TicketPrice;
                    eventObj.Add(eModel2);
                    
                }
                
                

            }       
            catch(Exception ex)
            {
                string d = ex.Message;
            }
            return eventObj;
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
