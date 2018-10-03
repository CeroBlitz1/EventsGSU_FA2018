using EventsGSUDataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
                //var userObj2 = new EventDetail();
                

                //userObj.EventID
                userObj.EventLocation =model.EventLocation;
                userObj.EventType = model.EventType;
                userObj.EventImage = model.EventImage;
                userObj.EventTitle = model.EventTitle;
                userObj1.TicketImage = model.TicketImage;
                userObj1.TicketPrice = model.TicketPrice;
                userObj1.TicketQuantity = model.TicketQuantity;
                

                g.EventsTables.Add(userObj);
                g.TicketsTables.Add(userObj1);
                g.SaveChanges();

                retVal = true;
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return retVal;
        }
    }
}