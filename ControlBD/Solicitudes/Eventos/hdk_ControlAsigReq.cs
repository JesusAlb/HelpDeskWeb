

using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace HelpDeskWeb.ControlBD.Solicitudes
{
  public  class hdk_ControlAsigReq
    {
          public static IList cargarTablaReqAsig(int idEvento)
           {
               try
               {
                   return dbhelp.modelo.ViewEventoConRequerimientos.Where(a => a.evento == idEvento).Select(x => new {
                       idRequerimiento = x.idRequerimientos,
                       nomRequerimiento = x.nomRequerimiento,
                       cantidad = x.cantidad
                   }).ToList();
               }
               catch
               {                  
                   return null;
               }
           }

          public static bool insertar(int id, int req, int? cantidad)
          {
              try
              {
                  var asigReq = new tblrequerimientoaevento { };
                  
                  if (cantidad == null)
                  {
                      asigReq = new tblrequerimientoaevento
                      {
                          evento = id,
                          requerimiento = req
                      };
                  }
                  else
                  {
                      asigReq = new tblrequerimientoaevento
                      {
                          evento = id,
                          requerimiento = req,
                          cantidad = cantidad
                      };                
                  }           
                  if (asigReq != null)
                  {
                      dbhelp.modelo.tblrequerimientoaeventoes.Attach(asigReq);
                      dbhelp.modelo.tblrequerimientoaeventoes.Add(asigReq);
                      dbhelp.modelo.SaveChanges();
                  }
                  return true;
              }
              catch
              {                
                  return false;
              }
          }

          public static bool editar(int id, int req, int cantidad)
          {
              try
              {
                  var ItemAmodificar = dbhelp.modelo.tblrequerimientoaeventoes.SingleOrDefault(x => x.evento == id && x.requerimiento == req);
                  if (ItemAmodificar != null)
                  {
                      ItemAmodificar.cantidad = cantidad;
                      dbhelp.modelo.SaveChanges();                     
                  }
                  return true;
              }
              catch
              {
                  return false;
              }
          }

          public static bool borrar(int id, int idreq)
          {
              try
              {
                  var itemRemover = dbhelp.modelo.tblrequerimientoaeventoes.SingleOrDefault(x => x.evento == id && x.requerimiento == idreq);
                  if (itemRemover != null)
                  {
                      dbhelp.modelo.tblrequerimientoaeventoes.Remove(itemRemover);
                      dbhelp.modelo.SaveChanges();
                  }
                  return true;
              }
              catch
              {
                  return false;
              }
          }

          public static tblrequerimientoaevento obtenerRequerimientoAsignado(int req, int idEv)
          {
              try
              {
                  return dbhelp.modelo.tblrequerimientoaeventoes.SingleOrDefault(x => x.evento == idEv && x.requerimiento == req);
              }
              catch
              {
                  return null;
              }
          }

    }
}
