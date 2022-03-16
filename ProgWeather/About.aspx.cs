using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgWeather
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                lbl_Session.Text = Session["username"].ToString();
            }
            else
            {
                Session["username"] = "Not logged in";
                lbl_Session.Text = Session["username"].ToString();
            }
        }

    }
}