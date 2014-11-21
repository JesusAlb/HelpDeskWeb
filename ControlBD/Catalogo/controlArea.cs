
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
    class controlArea
    {

        public static IList<tblarea> obtenerDataSource(string area)
        {
            try
            {
                return dbhelp.modelo.tblarea.Where(a => a.nombre.Contains(area)).OrderBy(a => a.nombre).ToList();
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
                var area = new tblarea { nombre = nombre };
                if (area != null)
                {
                    dbhelp.modelo.tblarea.Attach(area);
                    dbhelp.modelo.tblarea.Add(area);
                    dbhelp.modelo.SaveChanges();            
                }
                return true;
            }
            catch 
            {
                dbhelp.modelo.Dispose();
                return false;
            }
        }

        public static bool modificar(int id, string nombre)
        {
            try
            {

                var ItemAmodificar = dbhelp.modelo.tblarea.SingleOrDefault(x => x.id == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nombre = nombre;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch 
            {
                dbhelp.modelo.Dispose();
                return false;
            }
        }

        public static tblarea obtenerArea(int id)
        {
            try
            {
                return dbhelp.modelo.tblarea.SingleOrDefault(a => a.id == id);
            }
            catch
            {
                return null;
            }
        }

    }
}
