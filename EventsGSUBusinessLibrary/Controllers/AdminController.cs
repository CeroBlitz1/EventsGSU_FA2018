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
    [RoutePrefix("api/Admin")]
    public class AdminController : ApiController
    {
        [Route("GetAdminDetailsById")]
        public EventDetailsModel GetAdminDetailsById(int? eventID)
        {
            return new Admin().GetDetailsById(eventID);
        }
        [Route("GetSearchUserName")]
        public List<SearchModel> GetSearchUserName(string query = "")
        {
            return new Admin().SearchUsers(query);
        }
        [HttpGet]
        [Route("GetUserResults")]
        public List<UserModel> GetUserResults(string query = "")
        {
            return new Admin().SearchUserResults(query);
        }
        [Route("GetUserInfobyIDAdmin")]
        public UserModel GetUserInfobyIDAdmin(int UserID)
        {
            return new Admin().GetAdminUserInfobyID(UserID);
        }


    }

}
