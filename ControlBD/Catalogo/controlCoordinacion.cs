using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Windows;
using HelpDeskWeb.EntityFrameWork;

namespace HelpDeskWeb.Datos
{

    public class controlCoordinacion
    {
        
        public static IList<tblcoordinacion> obtenerDataSource(bool esFiltro, string txtFiltro)
        {
            try
            {
                var Coordinaciones = dbhelp.modelo.tblcoordinacion.Where(a => a.nombre.Contains(txtFiltro)).OrderBy(a => a.nombre).ToList();
                if (esFiltro)
                {
                    Coordinaciones.Insert(0, new tblcoordinacion { id = 0, nombre = "" });
                }
                return Coordinaciones;
            }
            catch
            {              
                return null;
            }

        }

        public static bool borrar(int id)
        {
            try
            {
                var ItemARemover = dbhelp.modelo.tblcoordinacion.SingleOrDefault(x => x.id == id);
                if (ItemARemover != null)
                {
                    dbhelp.modelo.tblcoordinacion.Remove(ItemARemover);
                    dbhelp.modelo.SaveChanges();
                }               
                return true;
            }
            catch
            {            
                return false;
            }
        }

        public static bool insertar(string nombre)
        {
            try
            {
                var cord = new tblcoordinacion { nombre = nombre };
                if (cord != null)
                {
                    dbhelp.modelo.tblcoordinacion.Attach(cord);
                    dbhelp.modelo.tblcoordinacion.Add(cord);
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
                var ItemAmodificar = dbhelp.modelo.tblcoordinacion.SingleOrDefault(x => x.id == id);
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

        public static tblcoordinacion obtenerCoordinacion(int id)
        {
            try
            {
                return dbhelp.modelo.tblcoordinacion.SingleOrDefault(a => a.id == id);
            }catch{
                return null;
            }
        }
    }
}
