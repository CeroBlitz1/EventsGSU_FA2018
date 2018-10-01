using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using EventsGSUDataAccessLayer;
using EventsGSUDataAccessLayer.DataAccess;
using EventsGSUDataAccessLayer.Models;
namespace EventsGSUBusinessLibrary.Controllers
{
    public class loginController : ApiController
    {
        GsuEventsDBEntities g = new GsuEventsDBEntities();

        public string RegisterLogin(UserModel model)
        {
            var Val = "";
            try
            {
                var uval = new Users().UserLogin(model);
            }
            catch (Exception ex)
            {

                Val = ex.Message;
            }
            return Val;
        }
    }
}
