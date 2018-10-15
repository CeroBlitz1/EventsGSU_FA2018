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
   [RoutePrefix("api/register")]
    public class RegisterController : ApiController
    {
        //GsuEventsDBEntities1 g = new GsuEventsDBEntities1();

        [Route("Register")]
        public  UserModel Register(UserModel model)
        {
            return new Users().SaveUsers(model);
        }
        //[Route("UserLogin")]
        //public bool UserLogin(UserModel model)
        //{
        //    var retVal = false;
        //    try
        //    {
        //        retVal = new Users().UserLogin(model);
        //    }
        //    catch (Exception ex)
        //    {

        //        var val = ex.Message;
        //    }
        //    return retVal;
        //}
        [Route("UserLogin")]
        public UserModel UserLogin(UserModel model)
        {
            return new Users().UserLogin(model);
        }

        [Route("GetEvents")]
        public List<EventModel> GetEvents(EventModel model)
        {
            return new Events().GetEvents(model);
        }

        [Route("GetEventDetails")]
        public List<EventDetailsModel> GetEventDetails(EventDetailsModel model)
        {
            return new Events().GetEventDetails(model);
        }

        [Route("GetDetailsById")]
        public List<EventDetailsModel> GetDetailsById(int? eventID)
        {
            return new Events().GetDetailsById(eventID);
        }
        [Route("GetAllEvents")]
        public List<EventModel> GetAllEvents(EventModel model)
        {
            return new Events().GetAllEvents(model); 
        }

        //[Route("GetEvents")]
        //public EventModel GetEvents(EventModel model)
        //{
        //    return new EventModel();
        //}

        [Route("CreateEvent")]
        public string CreateEvent(EventModel model)       
        {
            var retVal = "";
            try
            {


                var rVal = new Events().SaveEvents(model);


            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }

        //public string EventRegister(EventModel model)
        //{
        //    var Val = "";
        //    try
        //    {
        //        var uval = new Events().SaveUsers(model);
        //    }
        //    catch (Exception ex)
        //    {

        //        Val = ex.Message;
        //    }
        //    return Val; ;
        //}

        [Route ("GetPaymentHistoryadmin")]
        public List<AdminModel> GetPaymentHistoryadmin(AdminModel model)
        {
            return new Admin().GetPaymentHistoryadmin(model);
        }

    }
}
