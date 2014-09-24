
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
       hdk_ControlAcceso dbHelp;

       public hdk_ControlTipoIncidencia(hdk_ControlAcceso ca)
       {
           dbHelp = ca;
       }

       public IList cargarTabla(string filtro)
       {
           try
           {
               return dbHelp.DB.tbltipoincidencias.Where(a => a.nomTipoIncidente.Contains(filtro)).ToList();
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
               var ItemARemover = dbHelp.DB.tbltipoincidencias.SingleOrDefault(x => x.idTipoIncidente == id);
               if (ItemARemover != null)
               {
                   dbHelp.DB.tbltipoincidencias.Remove(ItemARemover);
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

       public bool insertar(string nombre)
       {
           try
           {
               var cord = new tbltipoincidencia { nomTipoIncidente = nombre };
               if (cord != null)
               {
                   dbHelp.DB.tbltipoincidencias.Attach(cord);
                   dbHelp.DB.tbltipoincidencias.Add(cord);
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

       public bool modificar(int id, string nombre)
       {
           try
           {
               var ItemAmodificar = dbHelp.DB.tbltipoincidencias.SingleOrDefault(x => x.idTipoIncidente == id);
               if (ItemAmodificar != null)
               {
                   ItemAmodificar.nomTipoIncidente = nombre;
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

       public tbltipoincidencia obtenerTipoIncidencia(int id)
       {
           try
           {
               return dbHelp.DB.tbltipoincidencias.SingleOrDefault(a => a.idTipoIncidente == id);
           }
           catch
           {
               return null;
           }
       }

    }

}
