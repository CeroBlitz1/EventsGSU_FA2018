﻿using System;
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
        GsuEventsDBEntities3 g = new GsuEventsDBEntities3();
        [Route("PaymentV")]
        public PaymentModel PaymentV(PaymentModel model)
        {
            return new Payment().SavePayment(model);
        }
        [Route("PaymentWithcard")]
        public PaymentModel PaymentWithcard(PaymentModel model)
        {
            return new Payment().SavePaymentWithcard(model);
        }
       
    }

}
