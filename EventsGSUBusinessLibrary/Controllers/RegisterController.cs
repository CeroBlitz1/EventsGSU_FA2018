using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using EventsGSUDataAccessLayer;
using EventsGSUDataAccessLayer.DataAccess;
using EventsGSUDataAccessLayer.Models;
using Newtonsoft.Json;

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
        [Route("GetSearchEvents")]
        public List<SearchModel> GetSearchEvents(string query = "")
        {
            return new Events().SearchEvents(query);
        }
        [HttpGet]
        [Route("GetResults")]
        public List<EventModel> GetResults(string query="")
        {
            return new Events().SearchResults(query);
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

       

        [Route("GetEventHistoryadmin")]
        public List<AdminModel> GetEventHistoryadmin(AdminModel model)
        {
            return new Admin().GetEventHistoryadmin(model);
        }
        [Route("GetUserHistoryadmin")]
        public List<AdminModel> GetUserHistoryadmin(AdminModel model)
        {
            return new Admin().GetUserHistoryadmin(model);
        }
        [Route("GetCardDetails")]
        public List<PaymentModel> GetCardDetails(int UserID)
        {
            return new Payment().GetCardDetails(UserID);
        }
        [Route("GetUserDetails")]
        public List<PaymentModel> GetUserDetails(int UserID)
        {
            return new Payment().GetUserDetails(UserID);
        }
        [Route("GetEventByUserID")]
        public List<EventModel> GetEventByUserID(int UserID)
        {
            return new Events().EventsByUserID(UserID);
        }
        [Route ("GetTicktsByEventID")]
        public List<EventModel>GetTicktsByEventID(int? eventID)
        {
            return new Events().TicktesByEventID(eventID);
        }
        [HttpPost]
        [Route("PostEventDetails")]
        public List<EventModel>PostEventDetails(int? eventID)
        {
            return new Events().UpdateByEventID(eventID);
        }

        [HttpPost]
        public void UploadFile()
        {
            
            try
            {
                
                if (HttpContext.Current.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];

                    //var eventG = HttpContext.Current.Request.Form["g"];

                    //EventModel eventData1 = HttpContext.Current.Request.Form["h"] as EventModel;

                    //var j = JsonConvert.DeserializeObject<List<EventModel>>(HttpContext.Current.Request.Form.Get("h"));
                    //Dictionary<string, Dictionary<string, string>> jsonDictionary = Newtonsoft.Json.JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, string>>>(HttpContext.Current.Request.Params["h"].ToString());
                    Dictionary<string, string> jsonDictionary = Newtonsoft.Json.JsonConvert.DeserializeObject<Dictionary<string, string>>(HttpContext.Current.Request.Params["h"].ToString());

                    GsuEventsDBEntities1 g = new GsuEventsDBEntities1();


                    var EventLocation = jsonDictionary["eventlocation"];
                    var EventTitle = jsonDictionary["eventtitle"];
                    var EventImage = jsonDictionary["eventimage"];
                    var EventType = jsonDictionary["eventtype"];
                    var TicketImage = jsonDictionary["ticketimage"];
                    var TicketPrice = jsonDictionary["ticketprice"];
                    var TicketQuantity = jsonDictionary["ticketquantity"];
                    var EventsDescription = jsonDictionary["eventsdescription"];
                    var EventDate = jsonDictionary["eventdate"];
                    var UserID = jsonDictionary["userID"];

                    var et = new EventsTable();
                    var tt = new TicketsTable();
                    var ed = new EventDetail();




                    ////userObj.EventID
                    //et.EventID = model.EventID;
                    et.EventLocation = EventLocation;
                    et.EventType = EventType;
                    et.EventImage = EventImage;
                    et.EventTitle = EventTitle;
                    et.EventDate = Convert.ToDateTime(EventDate);

                    et.UserID = Convert.ToInt16(UserID);

                    g.EventsTables.Add(et);

                    tt.TicketImage = TicketImage;
                    tt.TicketPrice = Convert.ToInt32(TicketPrice);
                    tt.TicketQuantity = Convert.ToInt16(TicketQuantity);
                    tt.UserID = Convert.ToInt16(UserID);
                    tt.EventID = et.EventID;
                    g.TicketsTables.Add(tt);

                    ed.EventID = et.EventID;
                    ed.EventsDescription = EventsDescription;
                    ed.UserID = Convert.ToInt16(UserID);

                    g.EventDetails.Add(ed);

                    g.SaveChanges();

                    var qr = HttpContext.Current.Request.QueryString["b"];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/UploadedFiles"), httpPostedFile.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        //httpPostedFile.SaveAs("C:\\AH\\Images");
                        httpPostedFile.SaveAs(fileSavePath);

                        g.SaveChanges();
                    }
                }

            }
            catch (Exception ex)
            {

                var s = "";
            }
        }
        


    }
}
