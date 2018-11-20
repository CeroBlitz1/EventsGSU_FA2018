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
    [RoutePrefix("api/Delete")]
    public class DeleteController : ApiController
    {
        [HttpPost]
        [Route("DeleteEvent")]
        public void DeleteEvent()
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

                    GsuEventsDBEntities3 g = new GsuEventsDBEntities3();

                    var EventID = jsonDictionary["eventid"];
                    var query = g.EventsTables.Where(x => x.EventID == int.Parse(EventID));

                    if (query != null)
                    {
                        var EventLocation = jsonDictionary["eventlocation"];
                        var EventTitle = jsonDictionary["eventtitle"];
                        var EventImage = jsonDictionary["eventimage"];
                        var EventType = jsonDictionary["eventtype"];
                        var TicketPrice = jsonDictionary["ticketprice"];
                        var TicketQuantity = jsonDictionary["ticketquantity"];
                        var EventsDescription = jsonDictionary["eventsdescription"];
                        var EventDate = jsonDictionary["eventdate"];
                        var UserID = jsonDictionary["userid"];
                        var TicketID = jsonDictionary["ticketid"];
                        var EventsDescriptionID = jsonDictionary["eventsdescriptionid"];


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
                        et.UserID = Convert.ToInt32(UserID);
                        et.EventID = Convert.ToInt32(EventID);
                        et.isDelete = 1;
                        g.EventsTables.Attach(et);

                        g.Entry(et).State = System.Data.Entity.EntityState.Modified;
                        g.SaveChanges();


                        tt.TicketPrice = Convert.ToInt32(TicketPrice);
                        tt.TicketQuantity = Convert.ToInt32(TicketQuantity);
                        tt.TicketID = Convert.ToUInt16(TicketID);
                        tt.UserID = Convert.ToInt32(UserID);
                        tt.EventID = Convert.ToInt32(EventID);
                        tt.isDelete = 1;
                        g.TicketsTables.Attach(tt);
                        g.Entry(tt).State = System.Data.Entity.EntityState.Modified;
                        g.SaveChanges();

                        ed.EventsDescription = EventsDescription;
                        ed.UserID = Convert.ToInt32(UserID);
                        ed.EventID = Convert.ToInt32(EventID);
                        ed.EventDetailsID = Convert.ToInt32(EventsDescriptionID);
                        ed.isDelete = 1;
                        g.EventDetails.Attach(ed);
                        g.Entry(ed).State = System.Data.Entity.EntityState.Modified;

                        g.SaveChanges();
                    }

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
                var s = "Problem While Updating";
            }
        }

        [HttpPost]
        [Route("DeleteProfile")]
        public UserModel DeleteProfile(UserModel model)
        {
            return new Users().DeleteUsers(model);
        }
        [HttpPost]
        [Route("Deletepayment")]
        public AdminModel Deletepayment(AdminModel model)
        {
            return new Payment().DeletePayment(model);
        }

    }


}
