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
   [RoutePrefix("api/account")]
    public class RegisterController : ApiController
    {
        GsuEventsDBEntities g = new GsuEventsDBEntities();


        public string Register(UserModel model)
        {
            var retVal = "";
            try
            {
              
                #region Test Code
                //var userObj = new UserTable();


                ////userObj.UserID
                //userObj.UserPassword = "12345";
                //userObj.UserName = model.UserName;
                //userObj.UserEmail = "shd@gmail.com";
                //userObj.UserPhoneNumber = 12;
                //userObj.isActive = "Y";
                //userObj.UserTypeID = 2;
                //userObj.CreatedDate = DateTime.Now;
                //userObj.ModifiedDate = DateTime.Now;

                //g.UserTables.Add(userObj);
                //g.SaveChanges();
                #endregion

                var rVal = new Users().SaveUsers(model);


            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }
        
        //public string RegisterLogin(UserModel model)
        //{
        //    var Val = "";
        //    try
        //    {
        //        var uval = new Login().SaveUsers(model);
        //    }
        //    catch (Exception ex)
        //    {

        //        Val = ex.Message;
        //    }
        //    return Val;
        //}

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

    }
}
