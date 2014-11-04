
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
    class hdk_ControlArea
    {


        public static IList cargarTabla(string area)
        {
            try
            {
                return dbhelp.modelo.tblareas.Where(a => a.nomArea.Contains(area)).ToList();
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
                return dbhelp.modelo.tblareas.OrderBy(a => a.idArea).ToList();
            }
            catch 
            {
                return null;
            }
        }

        public static bool insertar(string nombre)
        {
            try
            {
                var area = new tblarea { nomArea = nombre };
                if (area != null)
                {
                    dbhelp.modelo.tblareas.Attach(area);
                    dbhelp.modelo.tblareas.Add(area);
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

                var ItemAmodificar = dbhelp.modelo.tblareas.SingleOrDefault(x => x.idArea == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomArea = nombre;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch 
            {
                return false;
            }
        }

        public static tblarea obtenerArea(int id)
        {
            try
            {
                return dbhelp.modelo.tblareas.SingleOrDefault(a => a.idArea == id);
            }
            catch
            {
                return null;
            }
        }

    }
}
