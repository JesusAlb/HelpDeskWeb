using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HelpDeskWeb
{
    public class dbhelp
    {
        public static ViewUsuario usuario { get; set; }
        public static dbhelpdeskEntities modelo = new dbhelpdeskEntities();
    }
}