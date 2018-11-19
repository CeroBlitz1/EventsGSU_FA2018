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
        GsuEventsDBEntities3 g = new GsuEventsDBEntities3();
        public UserModel SaveUsers(UserModel model)
        {


            var um = new UserModel
            {
                UMessage = "Success Please proceed for login",
                UFlag = false,
                
            };
            try
            {
                var usr = g.UserTables.Where(s => s.UserName == model.UserName ).FirstOrDefault();
                
                    var usersObj = new UserTable();

                    usersObj.UserPassword = model.UserPassword;
                    usersObj.UserName = model.UserName;
                    usersObj.UserEmail = model.UserEmail;
                    usersObj.UserPhoneNumber = model.UserPhoneNumber;
                    usersObj.isActive = "Y";
                    usersObj.UserTypeID = 1;
                    usersObj.isDelete = 0;
                    usersObj.CreatedDate = DateTime.Now;
                    usersObj.ModifiedDate = DateTime.Now;
                    g.UserTables.Add(usersObj);

                if (usr == null)
                {
                    g.SaveChanges();
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



        


        public UserModel UserLogin(UserModel model)
        {
            var um = new UserModel
            {
                UMessage = "Success",
                UFlag = false,
                ReturnUrl = ""
            };
            try
            {
                var usr = g.UserTables.Where(s => s.UserName == model.UserName).FirstOrDefault();

                if (usr != null && usr.UserPassword == model.UserPassword)
                {
                    um.UserTypeID = usr.UserTypeID;
                    um.UserID = usr.UserID;
                    um.isDelete = usr.isDelete;
                    um.UFlag = true;
                } 
                if(um.isDelete == 1)
                {
                    um.UMessage = "ID Deleted Contact Admin";
                    um.UFlag = false;
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

        public UserModel GetUserInfobyID(int UserID)
        {
            var userdetailslist = new UserModel();

            try
            {
                userdetailslist = (from u in g.UserTables
                                   where u.UserID == UserID
                                   select new UserModel()
                                   {
                                       UserName= u.UserName,
                                       UserPassword = u.UserPassword,
                                       UserEmail = u.UserEmail,
                                       UserPhoneNumber=u.UserPhoneNumber,
                                   }).FirstOrDefault();
                                   
            }
            catch (Exception ex)
            {

                string d = ex.Message;
                
            }
            return userdetailslist;
        }

        public UserModel UpdateUsers(UserModel model)
        {
            var um = new UserModel
            {
                UMessage = "Update Success",
                UFlag = false,
            };
            try
            {
                var usersObj = new UserTable();

                usersObj.UserPassword = model.UserPassword;
                usersObj.UserName = model.UserName;
                usersObj.UserEmail = model.UserEmail;
                usersObj.UserPhoneNumber = model.UserPhoneNumber;
                usersObj.UserTypeID = model.UserTypeID;
                usersObj.UserID = model.UserID;
                usersObj.isActive = "Y";
                usersObj.CreatedDate = DateTime.Now;
                usersObj.ModifiedDate = DateTime.Now;
                
                g.UserTables.Attach(usersObj);
                g.Entry(usersObj).State = System.Data.Entity.EntityState.Modified;
                g.SaveChanges();
                um.UFlag = true;

            }
            catch (Exception ex)
            {

                um.UMessage = ex.Message;
            }

            return um;
        }

    }
}