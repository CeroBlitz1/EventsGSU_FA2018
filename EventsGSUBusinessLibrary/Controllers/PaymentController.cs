using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
//using EventsGSUBusinessLibrary.Models;
//using EventsGSUBusinessLibrary.Models;
using EventsGSUDataAccessLayer;
using EventsGSUDataAccessLayer.DataAccess;
using EventsGSUDataAccessLayer.Models;

namespace EventsGSUBusinessLibrary.Controllers
{
    [RoutePrefix("api/payment")]
    public class PaymentController : ApiController
    {
        GsuEventsDBEntities g = new GsuEventsDBEntities();
        [Route("PaymentV")]
        public string PaymentV(PaymentModel model)
        {
            var retVal = "";
            try
            {


                var rVal = new Payment().SavePayment(model);


            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }
    }
}
