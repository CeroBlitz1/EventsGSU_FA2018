﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventsGSUDataAccessLayer.Models
{
    public class Login
    {
        GsuEventsDBEntities g = new GsuEventsDBEntities();
        public bool SaveUsers(UserModel model)
        {
            var retVal = false;
            try
            {
                var userObj = new UserTable();

                userObj.UserPassword = model.UserPassword;
                userObj.UserName = model.UserName;

                if (model == null && model.UserName == null && model.UserPassword == null)
                {
                   string d = "This is an error";
                    
                }
                else
                {
                    retVal = true;
                }

                // var s = model.UserEmail;



                //g.UserTables.Add(userObj);
                g.SaveChanges();

                
            }
            catch (Exception ex)
            {
                string d = ex.Message;
            }
            return retVal;
        }
    }
}
