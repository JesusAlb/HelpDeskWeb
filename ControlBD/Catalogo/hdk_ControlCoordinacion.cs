using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Windows;
using HelpDeskWeb.EntityFrameWork;
using HelpDeskWeb.ControlBD.Acceso;

namespace HelpDeskWeb.Datos
{
    

    public class hdk_ControlCoordinacion
    {
        

        public static IList cargarTabla(string filtro)
        {
            try
            {
                return dbhelp.modelo.tblcoordinacions.Where(a => a.nomCoordinacion.Contains(filtro)).ToList();
            }
            catch
            {              
                return null;
            }

        }

        public static bool borrarRegistro(int id)
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
