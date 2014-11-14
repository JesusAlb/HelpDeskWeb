﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HelpDeskWeb;
using System.Collections;
using HelpDeskWeb.EntityFrameWork;

namespace HelpDeskWeb.ControlBD.Catalogo
{
    public class controlInstitucion
    {
        public static IList<tblinstitucion> obtenerDataSource()
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

        public static tblinstitucion obtenerInstitucion(int id)
        {
            try
            {
                return dbhelp.modelo.tblinstitucions.SingleOrDefault(a => a.idInstitucion == id);
            }
            catch
            {
                return null;
            }
        }
    }
}