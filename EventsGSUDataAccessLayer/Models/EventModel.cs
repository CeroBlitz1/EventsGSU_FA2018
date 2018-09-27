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
    }
}
