using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventsGSUDataAccessLayer.Models
{
   public class EventModel
    {
        public int EventID { get; set; }
        public string EventLocation { get; set; }
        public string EventType { get; set; }
        public string EventImage { get; set; }
        public string EventTitle { get; set; }
        public string EventDate { get; set; }
        public int TicketID { get; set; }
        public int TicketQuantity { get; set; }
        public int TicketPrice { get; set; }
        public string TicketImage { get; set; }
        public bool EFlag { get; set; }
    }
}
