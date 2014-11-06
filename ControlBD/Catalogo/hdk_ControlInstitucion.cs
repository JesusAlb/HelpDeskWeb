using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HelpDeskWeb;
using System.Collections;
using HelpDeskWeb.EntityFrameWork;

namespace HelpDeskWeb.ControlBD.Catalogo
{
    public class hdk_ControlInstitucion
    {
        public static IList<tblinstitucion> cargarTablaInsitucion()
        {
            try
            {
                return dbhelp.modelo.tblinstitucions.Where(a => a.status == true).ToList();
            }
            catch
            {
                return null;
            }
        }
    }
}