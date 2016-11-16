﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MicroLoanApp
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["LenderID"] = null;
            Session["EntrepreneurID"] = null;

            Response.Redirect("Default.aspx");
        }
    }
}