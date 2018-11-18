using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventsGSU_FA2018
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            var urlRef = Request.Url.AbsoluteUri;
            if (urlRef == "http://localhost/EventsGSU_FA2018/Index" ||
                urlRef == "http://localhost/EventsGSU_FA2018/Account/Login" ||
                urlRef == "http://localhost/EventsGSU_FA2018/Account/Registration" ||
                urlRef == "http://localhost/EventsGSU_FA2018/Events/AllEvents")
            {
                return;
            }


            string strPreviousPage = string.Empty;
            if (Request.UrlReferrer != null)
            {
                strPreviousPage = Request.UrlReferrer.Segments[Request.UrlReferrer.Segments.Length - 1];
            }
            if (strPreviousPage == "")
            {
                Logout();
            }

            
        }

        protected void Logout()
        {
            string logInUrl = "http://localhost/EventsGSU_FA2018/Account/Login.aspx";
            //Session.RemoveAll();
            //Session.Abandon();
            //Session.Clear();
            Response.Redirect(logInUrl, false);
        }
    }
}
