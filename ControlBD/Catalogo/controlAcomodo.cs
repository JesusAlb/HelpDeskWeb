
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
    class controlAcomodo
    {

        public static IList<tblacomodo> obtenerDataSource(string acomodo)
        {
            try
            {
                return dbhelp.modelo.tblacomodo.Where(a => a.nombre.Contains(acomodo)).OrderBy(a => a.nombre).ToList();
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
                var acomodo = new tblacomodo { nombre = nombre };
                if (acomodo != null)
                {
                    dbhelp.modelo.tblacomodo.Attach(acomodo);
                    dbhelp.modelo.tblacomodo.Add(acomodo);
                    dbhelp.modelo.SaveChanges();            
                }
                return true;
            }
            catch 
            {
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static bool modificar(int id, string nombre)
        {
            try
            {

                var ItemAmodificar = dbhelp.modelo.tblacomodo.SingleOrDefault(x => x.id == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nombre = nombre;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch 
            {
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static tblacomodo obtenerAcomodo(int id)
        {
            try
            {
                return dbhelp.modelo.tblacomodo.SingleOrDefault(a => a.id == id);
            }
            catch
            {
                return null;
            }
        }

    }
}
