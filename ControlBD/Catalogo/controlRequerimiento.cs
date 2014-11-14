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
    class hdk_ControlRequerimientos
    {

        public static IList<sp_requerimientos_sin_asignar_Result> obtenerDataSource(string filtro, string tipo, int? evento)
       {
           try
           {
              return dbhelp.modelo.sp_requerimientos_sin_asignar(evento).Where( a => a.nomRequerimiento.Contains(filtro) && a.tipo.Contains(tipo)).ToList();
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
               var ItemARemover = dbhelp.modelo.tblrequerimientos.SingleOrDefault(x => x.idRequerimientos == id);
               if (ItemARemover != null)
               {
                   dbhelp.modelo.tblrequerimientos.Remove(ItemARemover);
                   dbhelp.modelo.SaveChanges();
               }
               return true;
           }
           catch
           {
               return false;
           }

       }

       public static bool insertar(string nombre, bool tipo)
       {
           try
           {
               var cord = new tblrequerimiento { nomRequerimiento = nombre, cuantificable = tipo };
               if (cord != null)
               {
                   dbhelp.modelo.tblrequerimientos.Attach(cord);
                   dbhelp.modelo.tblrequerimientos.Add(cord);
                   dbhelp.modelo.SaveChanges();
                  
               }
               return true;
           }
           catch
           {
               return false;
           }

       }

       public static bool modificar(int id, string nombre, bool tipo)
       {
           try
           {
               var ItemAmodificar = dbhelp.modelo.tblrequerimientos.SingleOrDefault(x => x.idRequerimientos == id);
               if (ItemAmodificar != null)
               {
                   ItemAmodificar.nomRequerimiento = nombre;
                   ItemAmodificar.cuantificable = tipo;
                   dbhelp.modelo.SaveChanges();                      
               }
               return true;
           }
           catch 
           {
               return false;
           }
       }

       public static tblrequerimiento obtenerRequerimiento(int id, int? idEvento)
       {
           try
           {
               return dbhelp.modelo.tblrequerimientos.SingleOrDefault(a => a.idRequerimientos == id);
           }
           catch
           {
               return null;
           }
       }

    }
}
