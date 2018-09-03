using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventsGSU_FA2018.Payment
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Proceed_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment_Processing.aspx");
        }
    }
}