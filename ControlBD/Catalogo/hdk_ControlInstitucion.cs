using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HelpDeskWeb;
using System.Collections;

namespace HelpDeskWeb.ControlBD.Catalogo
{
    public class hdk_ControlInstitucion
    {
        public static IList cargarTablaInsitucion()
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