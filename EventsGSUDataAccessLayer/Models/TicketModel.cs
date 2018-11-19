using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventsGSUDataAccessLayer.Models
{
    public class TicketModel
    {
        public int TicketID { get; set; }
        public int TicketQuantity { get; set; }
        public int TicketPrice { get; set; }
        public int EventID { get; set; }
        public string TicketImage { get; set; }
        public int isDelete { get; set; }
    }
}
