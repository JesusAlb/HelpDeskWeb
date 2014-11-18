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
    class controlRequerimientos
    {

        public static IList<sp_requerimientos_sin_asignar_Result> obtenerDataSource(string filtro, string tipo, int? evento)
       {
           try
           {
               return dbhelp.modelo.sp_requerimientos_sin_asignar(evento).Where(a => a.nombre.Contains(filtro) && a.tipo.Contains(tipo)).ToList();
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
               var ItemARemover = dbhelp.modelo.tblrecurso.SingleOrDefault(x => x.id == id);
               if (ItemARemover != null)
               {
                   dbhelp.modelo.tblrecurso.Remove(ItemARemover);
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
               var cord = new tblrecurso { nombre = nombre, cuantificable = tipo };
               if (cord != null)
               {
                   dbhelp.modelo.tblrecurso.Attach(cord);
                   dbhelp.modelo.tblrecurso.Add(cord);
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
               var ItemAmodificar = dbhelp.modelo.tblrecurso.SingleOrDefault(x => x.id == id);
               if (ItemAmodificar != null)
               {
                   ItemAmodificar.nombre = nombre;
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

       public static tblrecurso obtenerRequerimiento(int id, int? idEvento)
       {
           try
           {
               return dbhelp.modelo.tblrecurso.SingleOrDefault(a => a.id == id);
           }
           catch
           {
               return null;
           }
       }

    }
}
