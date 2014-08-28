

using HelpDeskWeb.Control.Acceso;
using HelpDeskWeb.Modelo;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace HelpDeskWeb.Control.Solicitudes
{
  public  class hdk_ControlAsigReq
    {
        hdk_ControlAcceso dbHelp;

        public hdk_ControlAsigReq(hdk_ControlAcceso ca)
        {
            dbHelp = ca;
        }

        public int getIdUltimoEvento(){
            try
            {
                var registro = dbHelp.DB.UltimoEvento().SingleOrDefault();
                return registro.Value;
            }
            catch
            {              
                return -1;
            }
        }

          public IList cargarTablaReqAsig(int evento)
           {
               try
               {
                   return dbHelp.DB.ViewEventoConRequerimientos.Where(a => a.evento == evento).ToList();
               }
               catch
               {                  
                   return null;
               }
           }

          public bool insertar(int id, int req, int cantidad)
          {
              try
              {
                  var asigReq = new tblrequerimientoaevento { };
                  
                  if (cantidad == 0)
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
                      dbHelp.DB.tblrequerimientoaeventoes.Attach(asigReq);
                      dbHelp.DB.tblrequerimientoaeventoes.Add(asigReq);
                      dbHelp.DB.SaveChanges();
                  }
                  return true;
              }
              catch
              {                
                  return false;
              }
          }

          public bool editar(int id, int req, int cantidad)
          {
              try
              {
                  var ItemAmodificar = dbHelp.DB.tblrequerimientoaeventoes.SingleOrDefault(x => x.evento == id && x.requerimiento == req);
                  if (ItemAmodificar != null)
                  {
                      ItemAmodificar.cantidad = cantidad;
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

          public bool borrar(int id, int idreq)
          {
              try
              {
                  var itemRemover = dbHelp.DB.tblrequerimientoaeventoes.SingleOrDefault(x => x.evento == id && x.requerimiento == idreq);
                  if (itemRemover != null)
                  {
                      dbHelp.DB.tblrequerimientoaeventoes.Remove(itemRemover);
                      dbHelp.DB.SaveChanges();
                  }
                  return true;
              }
              catch
              {
                  return false;
              }
          }


    }
}
