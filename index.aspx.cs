﻿using HelpDeskWeb.ControlBD.Acceso;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void tmIntro_Tick(object sender, EventArgs e){        
            hdk_ControlAcceso Control = new hdk_ControlAcceso();
            Control.DB.tblareas.SingleOrDefault(a => a.idArea == 1);          
        }

        
    }
}