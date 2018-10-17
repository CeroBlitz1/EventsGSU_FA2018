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
    [RoutePrefix("api/Admin")]
    public class AdminController : ApiController
    {
        [Route("GetPaymentHistoryadmin")]
        public List<AdminModel> GetPaymentHistoryadmin(AdminModel model)
        {
            return new Admin().GetPaymentHistoryadmin(model);
        }
    }
}
