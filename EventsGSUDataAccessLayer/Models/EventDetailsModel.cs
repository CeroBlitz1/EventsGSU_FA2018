using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventsGSUDataAccessLayer.Models
{
   public class EventDetailsModel
    {
        public int EventDetailsID { get; set; }
        public string EventsDescription { get; set; }
        public int EventID { get; set; }
        public string EventImage { get; set; }
        public string EventTitle { get; set; }
        public string EventDate { get; set; }
        public int TicketID { get; set; }
        public int TicketPrice { get; set; }
        public bool EFlag { get; set; }
        public int UserID { get; set; }

    }
}
