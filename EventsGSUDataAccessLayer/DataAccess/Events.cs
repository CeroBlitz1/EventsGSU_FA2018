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
        public bool SaveUsers(EventModel model)
        {
            var retVal = false;
            try
            {
                var userObj = new EventsTable();

                //userObj.EventID
                userObj.EventLocation = "Desplaines";
                userObj.EventType = "Food";
                userObj.EventImage = "";
                userObj.EventTitle = "Food Fest";

                g.EventsTables.Add(userObj);
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