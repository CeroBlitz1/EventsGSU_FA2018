using EventsGSUDataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventsGSUDataAccessLayer
{
    public class Users
    {
        GsuEventsDBEntities1 g = new GsuEventsDBEntities1();
        public bool SaveUsers(UserModel model)
        {
            var retVal = false;
            try
            {
                var userObj = new UserTable();

                userObj.UserPassword = model.UserPassword;
                userObj.UserName = model.UserName;
                userObj.UserEmail = model.UserEmail;
                userObj.UserPhoneNumber = model.UserPhoneNumber;
                userObj.isActive = "Y";
                userObj.UserTypeID = 1;
                userObj.CreatedDate = DateTime.Now;
                userObj.ModifiedDate = DateTime.Now;

               // var s = model.UserEmail;

                
                
                g.UserTables.Add(userObj);
                g.SaveChanges();

                retVal = true;
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return retVal;
        }


        //public bool SaveUsers()
        //{
        //    var retVal = false;
        //    try
        //    {


        //        retVal = true;
        //    }
        //    catch (Exception ex)
        //    {
        //        string d = ex.Message;
        //    }
        //    return retVal;
        //}


        //GsuEventsDBEntities g = new GsuEventsDBEntities();
        //public bool UserLogin(UserModel model)
        //{
        //    var retVal = false;
        //    try
        //    {

        //        var usr = g.UserTables.Where(s => s.UserName == model.UserName).FirstOrDefault();

        //        if (usr != null && usr.UserPassword == model.UserPassword)
        //        {
        //            retVal = true;
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        string d = ex.Message;
        //    }
        //    return retVal;
        //}


        public UserModel UserLogin(UserModel model)
        {
            var um = new UserModel
            {
                UMessage = "Success",
                UFlag = false,
                ReturnUrl = System.IO.Path.GetDirectoryName(Process.GetCurrentProcess().MainModule.FileName)
            };
            try
            {
                var usr = g.UserTables.Where(s => s.UserName == model.UserName).FirstOrDefault();

                if (usr != null && usr.UserPassword == model.UserPassword)
                {
                    um.UserTypeID = usr.UserTypeID;
                    um.UFlag = true;
                }
                else
                {
                    um.UMessage = "Unable to Login!!";
                }
            }
            catch (Exception ex)
            {
                um.UMessage = ex.Message;
            }
            return um;
        }

    }
}