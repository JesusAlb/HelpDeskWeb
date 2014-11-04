﻿using HelpDeskWeb.ControlBD;
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace HelpDeskWeb.ControlBD.Catalogo
{
    class hdk_ControlLugar
    {

        public static IList cargarTabla(string filtro)
        {
            try
            {
                return dbhelp.modelo.tbllugars.Where(a => a.nomLugar.Contains(filtro)).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static IList cargarCombo()
        {
            try
            {
                return dbhelp.modelo.tbllugars.OrderBy(a => a.idLugar).ToList();
            }
            catch
            {
                return null;
            }

        }

        public static bool insertar(string lugar)
        {
            try
            {
                tbllugar Lugar = new tbllugar { nomLugar = lugar };
                if (Lugar != null)
                {
                    dbhelp.modelo.tbllugars.Attach(Lugar);
                    dbhelp.modelo.tbllugars.Add(Lugar);
                    dbhelp.modelo.SaveChanges();                 
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool modificar(int id, string nombre)
        {
            try
            {

                var ItemAmodificar = dbhelp.modelo.tbllugars.SingleOrDefault(x => x.idLugar == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomLugar = nombre;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static tbllugar obtenerLugar(int id)
        {
            try
            {
                return dbhelp.modelo.tbllugars.SingleOrDefault(a => a.idLugar == id);
            }
            catch
            {
                return null;
            }
        }
    }
}
