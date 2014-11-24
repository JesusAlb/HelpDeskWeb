
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
  public  class controlRecursosAsignados
    {
      public static IList obtenerDataSource(int idEvento)
           {
               try
               {
                   return dbhelp.modelo.vt_recursos_asignados.Where(a => a.idevento == idEvento).Select(x => new {
                       idRequerimiento = x.idrecurso,
                       nomRequerimiento = x.nom_recurso,
                       cantidad = x.cantidad
                   }).ToList();
               }
               catch
               {                  
                   return null;
               }
           }

          public static bool insertar(int id, int requerimiento, int? cantidad)
          {
              try
              {
                  var recursoAsignado = new tblrecursoasignado
                      {
                          fk_idevento = id,
                          fk_idrequerimiento = requerimiento,
                          cantidad = cantidad
                      };                
                        
                  if (recursoAsignado != null)
                  {
                      dbhelp.modelo.tblrecursoasignado.Attach(recursoAsignado);
                      dbhelp.modelo.tblrecursoasignado.Add(recursoAsignado);
                      dbhelp.modelo.SaveChanges();
                  }
                  return true;
              }
              catch
              {
                  dbhelp.UndoAll(dbhelp.modelo);
                  return false;
              }
          }

          public static bool editar(int id, int req, int cantidad)
          {
              try
              {
                  var ItemAmodificar = dbhelp.modelo.tblrecursoasignado.SingleOrDefault(x => x.fk_idevento == id && x.fk_idrequerimiento == req);
                  if (ItemAmodificar != null)
                  {
                      ItemAmodificar.cantidad = cantidad;
                      dbhelp.modelo.SaveChanges();                     
                  }
                  return true;
              }
              catch
              {
                  dbhelp.UndoAll(dbhelp.modelo);
                  return false;
              }
          }

          public static bool borrar(int id, int idreq)
          {
              try
              {
                  var itemRemover = dbhelp.modelo.tblrecursoasignado.SingleOrDefault(x => x.fk_idevento == id && x.fk_idrequerimiento == idreq);
                  if (itemRemover != null)
                  {
                      dbhelp.modelo.tblrecursoasignado.Remove(itemRemover);
                      dbhelp.modelo.SaveChanges();
                  }
                  return true;
              }
              catch
              {
                  return false;
              }
          }

          public static tblrecursoasignado obtenerRequerimientoAsignado(int requerimiento, int idEvento)
          {
              try
              {
                  return dbhelp.modelo.tblrecursoasignado.SingleOrDefault(x => x.fk_idevento == idEvento && x.fk_idrequerimiento == requerimiento);
              }
              catch
              {
                  return null;
              }
          }

    }
}
