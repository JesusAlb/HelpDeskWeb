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

    public class accionesCoordinacion
    {
        
        public static IList<tblcoordinacion> obtenerDataSource(bool esFiltro, string txtFiltro)
        {
            try
            {
                var Coordinaciones = dbhelp.modelo.tblcoordinacions.Where(a => a.nomCoordinacion.Contains(txtFiltro)).OrderBy(a => a.nomCoordinacion).ToList();
                if (esFiltro)
                {
                    Coordinaciones.Insert(0, new tblcoordinacion { idCoordinacion = 0, nomCoordinacion = "" });
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
                var ItemARemover = dbhelp.modelo.tblcoordinacions.SingleOrDefault(x => x.idCoordinacion == id);
                if (ItemARemover != null)
                {
                    dbhelp.modelo.tblcoordinacions.Remove(ItemARemover);
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
                var cord = new tblcoordinacion { nomCoordinacion = nombre };
                if (cord != null)
                {
                    dbhelp.modelo.tblcoordinacions.Attach(cord);
                    dbhelp.modelo.tblcoordinacions.Add(cord);
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
                var ItemAmodificar = dbhelp.modelo.tblcoordinacions.SingleOrDefault(x => x.idCoordinacion == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomCoordinacion = nombre;
                    dbhelp.modelo.SaveChanges();        
                }
                return true;
            }
            catch
            {            
                return false;
            }
        }

        public static tblcoordinacion obtenerCoordinacion(int id)
        {
            try
            {
                return dbhelp.modelo.tblcoordinacions.SingleOrDefault(a => a.idCoordinacion == id);
            }catch{
                return null;
            }
        }
    }
}
