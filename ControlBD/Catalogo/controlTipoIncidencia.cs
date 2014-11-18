
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
               return dbhelp.modelo.tbltipoincidencia.Where(a => a.nombre.Contains(filtro)).OrderBy(a=>a.nombre).ToList();
           }
           catch
           {
               return null;
           }
       }

       public static IList<tbltipoincidencia> obtenerDataSourceCombBoxTipo()
       {
           try
           {
               var items = dbhelp.modelo.tbltipoincidencia.ToList();
               items.Insert(0, new tbltipoincidencia { id = 0, nombre = "" });
               return items.ToList();
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
               var ItemARemover = dbhelp.modelo.tbltipoincidencia.SingleOrDefault(x => x.id == id);
               if (ItemARemover != null)
               {
                   dbhelp.modelo.tbltipoincidencia.Remove(ItemARemover);
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
               var tipoIncidente = new tbltipoincidencia { nombre = nombre };
               if (tipoIncidente != null)
               {
                   dbhelp.modelo.tbltipoincidencia.Attach(tipoIncidente);
                   dbhelp.modelo.tbltipoincidencia.Add(tipoIncidente);
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
               var ItemAmodificar = dbhelp.modelo.tbltipoincidencia.SingleOrDefault(x => x.id == id);
               if (ItemAmodificar != null)
               {
                   ItemAmodificar.nombre = nombre;
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
               return dbhelp.modelo.tbltipoincidencia.SingleOrDefault(a => a.id == id);
           }
           catch
           {
               return null;
           }
       }

       public static int obtenerTipoIncidenciaGeneral()
       {
           try
           {
              return dbhelp.modelo.tbltipoincidencia.SingleOrDefault(a => a.nombre.Equals("General")).id;
           }
           catch
           {
               return 1;
           }
       }

    }

}
