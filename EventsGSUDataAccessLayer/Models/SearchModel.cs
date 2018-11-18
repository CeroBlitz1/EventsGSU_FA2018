using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventsGSUDataAccessLayer.Models
{
    public class SearchModel
    {
        public int EventId { get; set; }
        public string EventTitle { get; set; }
        public string UserName { get; set; }
        public int UserID { get; set; }
    }
}
