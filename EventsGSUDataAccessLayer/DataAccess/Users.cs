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
        GsuEventsDBEntities1 Gsu = new GsuEventsDBEntities1();
        public UserModel SaveUsers(UserModel model)
        {


            var um = new UserModel
            {
                UMessage = "Success Please proceed for login",
                UFlag = false,
                
            };
            try
            {
                var usr = Gsu.UserTables.Where(s => s.UserName == model.UserName).FirstOrDefault();
                
                    var usersObj = new UserTable();

                    usersObj.UserPassword = model.UserPassword;
                    usersObj.UserName = model.UserName;
                    usersObj.UserEmail = model.UserEmail;
                    usersObj.UserPhoneNumber = model.UserPhoneNumber;
                    usersObj.isActive = "Y";
                    usersObj.UserTypeID = 1;
                    usersObj.CreatedDate = DateTime.Now;
                    usersObj.ModifiedDate = DateTime.Now;
                    Gsu.UserTables.Add(usersObj);

                if (usr == null)
                {
                    Gsu.SaveChanges();
                    um.UFlag = true;
                }
                else
                {
                    um.UMessage = "Username/Email already Exists";
                }
                
            }
            catch (Exception ex)
            {
                um.UMessage = ex.Message;

            }
            return um;
        }



        //public bool SaveUsers()
        //var usersObj = new UserTable();

        //usersObj.UserPassword = model.UserPassword;
        //usersObj.UserName = model.UserName;
        //usersObj.UserEmail = model.UserEmail;
        //usersObj.UserPhoneNumber = model.UserPhoneNumber;
        //usersObj.isActive = "Y";
        //usersObj.UserTypeID = 1;
        //usersObj.CreatedDate = DateTime.Now;
        //usersObj.ModifiedDate = DateTime.Now;
        //g.UserTables.Add(usersObj);

        //g.SaveChanges();
        //Um.UMessage = "Success";
        //Uflag = true;
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
                var usr = Gsu.UserTables.Where(s => s.UserName == model.UserName).FirstOrDefault();

                if (usr != null && usr.UserPassword == model.UserPassword)
                {
                    um.UserTypeID = usr.UserTypeID;
                    um.UserID = usr.UserID;
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