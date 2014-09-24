
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
    class hdk_ControlRequerimientos
    {
        hdk_ControlAcceso dbHelp;

       public hdk_ControlRequerimientos(hdk_ControlAcceso ca)
       {
           dbHelp = ca;
       }


       public IList cargarTabla(string filtro, string tipo, int? evento)
       {
           try
           {
               return dbHelp.DB.requerimientosSinAsignar(evento).Where( a => a.nomRequerimiento.Contains(filtro) && a.tipo.Contains(tipo)).ToList();
           }
           catch
           {
               return null;
           }
       }

       public bool borrarRegistro(int id)
       {
           try
           {
               var ItemARemover = dbHelp.DB.tblrequerimientos.SingleOrDefault(x => x.idRequerimientos == id);
               if (ItemARemover != null)
               {
                   dbHelp.DB.tblrequerimientos.Remove(ItemARemover);
                   dbHelp.DB.SaveChanges();
                   dbHelp.actualizarModelo();
               }
               return true;
           }
           catch
           {
               return false;
           }

       }

       public bool insertar(string nombre, string rtipo)
       {
           try
           {
               var cord = new tblrequerimiento { nomRequerimiento = nombre, tipo = rtipo };
               if (cord != null)
               {
                   dbHelp.DB.tblrequerimientos.Attach(cord);
                   dbHelp.DB.tblrequerimientos.Add(cord);
                   dbHelp.DB.SaveChanges();
                   dbHelp.actualizarModelo();
               }
               return true;
           }
           catch
           {
               return false;
           }

       }

       public bool modificar(int id, string nombre, string rtipo)
       {
           try
           {
               var ItemAmodificar = dbHelp.DB.tblrequerimientos.SingleOrDefault(x => x.idRequerimientos == id);
               if (ItemAmodificar != null)
               {
                   ItemAmodificar.nomRequerimiento = nombre;
                   ItemAmodificar.tipo = rtipo;
                   dbHelp.DB.SaveChanges();
                   dbHelp.actualizarModelo();         
               }
               return true;
           }
           catch 
           {
               return false;
           }
       }

       public requerimientosSinAsignar_Result obtenerRequerimiento(int id, int? evento)
       {
           try
           {
               return dbHelp.DB.requerimientosSinAsignar(evento).SingleOrDefault(a => a.idRequerimientos == id);
           }
           catch
           {
               return null;
           }
       }

    }
}
