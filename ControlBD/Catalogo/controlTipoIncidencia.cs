
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
   public class controlTipoIncidencia
    {

       public static IList<tbltipoincidencia> obtenerDataSource(string filtro)
       {
           try
           {
               return dbhelp.modelo.tbltipoincidencias.Where(a => a.nomTipoIncidente.Contains(filtro)).OrderBy(a=>a.nomTipoIncidente).ToList();
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
               var tipoIncidente = new tbltipoincidencia { nomTipoIncidente = nombre };
               if (tipoIncidente != null)
               {
                   dbhelp.modelo.tbltipoincidencias.Attach(tipoIncidente);
                   dbhelp.modelo.tbltipoincidencias.Add(tipoIncidente);
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
