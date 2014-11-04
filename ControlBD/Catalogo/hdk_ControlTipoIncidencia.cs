
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace HelpDeskWeb.ControlAltas
{
   public class hdk_ControlTipoIncidencia
    {

       public static IList cargarTabla(string filtro)
       {
           try
           {
               return dbhelp.modelo.tbltipoincidencias.Where(a => a.nomTipoIncidente.Contains(filtro)).ToList();
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
               var ItemARemover = dbhelp.modelo.tbltipoincidencias.SingleOrDefault(x => x.idTipoIncidente == id);
               if (ItemARemover != null)
               {
                   dbhelp.modelo.tbltipoincidencias.Remove(ItemARemover);
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
               var cord = new tbltipoincidencia { nomTipoIncidente = nombre };
               if (cord != null)
               {
                   dbhelp.modelo.tbltipoincidencias.Attach(cord);
                   dbhelp.modelo.tbltipoincidencias.Add(cord);
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
               var ItemAmodificar = dbhelp.modelo.tbltipoincidencias.SingleOrDefault(x => x.idTipoIncidente == id);
               if (ItemAmodificar != null)
               {
                   ItemAmodificar.nomTipoIncidente = nombre;
                   dbhelp.modelo.SaveChanges();                 
               }
               return true;
           }
           catch
           {
               return false;
           }
       }

       public static tbltipoincidencia obtenerTipoIncidencia(int id)
       {
           try
           {
               return dbhelp.modelo.tbltipoincidencias.SingleOrDefault(a => a.idTipoIncidente == id);
           }
           catch
           {
               return null;
           }
       }

    }

}
