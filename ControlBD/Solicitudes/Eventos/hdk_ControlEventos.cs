
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace HelpDeskWeb.ControlBD.Solicitudes
{
    class hdk_ControlEventos
    {

        public static IList cargarTablasSolicitante(int idSol, int status, string filtro, DateTime? FechaInicio, DateTime? FechaFinal)
        {
            DateTime busquedaFecha;
            int numero;
            DateTime.TryParse(filtro, out busquedaFecha);
            if (busquedaFecha < new DateTime(1753, 1, 1))
            {
                busquedaFecha = new DateTime(1753, 1, 1);
            }
            int.TryParse(filtro, out numero);

            try
            {
                if (status != 2)
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbhelp.modelo.VistaEventosSinCerrars.Where(a => (a.status == status && a.idSolicitante == idSol) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) ||
                                                         a.tipo_evento.Contains(filtro))).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.VistaEventosSinCerrars.Where(a => (a.status == status && a.idSolicitante == idSol && (a.FechaInicio >= FechaInicio && a.FechaInicio <= FechaFinal)) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                           a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||                          
                                           a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro))).ToList();

                    }
                }
                else
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbhelp.modelo.VistaEventosCerrados.Where(a => (a.status == status && a.idSolicitante == idSol) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) ||
                                                         a.tipo_evento.Contains(filtro))).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.VistaEventosCerrados.Where(a => (a.status == status && a.idSolicitante == idSol && (a.FechaInicio >= FechaInicio && a.FechaInicio <= FechaFinal)) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                           a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||                         
                                           a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro))).ToList();

                    }
                }
            }
            catch
            {
                return null;
            }
        }

        public static tblevento cargarEvento(int evento)
        {
            try
            {
                return dbhelp.modelo.tbleventoes.SingleOrDefault(a => a.idEvento == evento);
            }
            catch
            {
                return null;
            }
        }

        public static VistaEventosCerrado cargarEventoCerrado(int evento)
        {
            try
            {
                return dbhelp.modelo.VistaEventosCerrados.SingleOrDefault(a => a.idEvento == evento);
            }
            catch
            {
                return null;
            }
        }

        public static IList cargarTablasSoporte(int status, string filtro, DateTime? FechaInicio, DateTime? FechaFinal)
        {

            DateTime busquedaFecha;
            int numero;
            DateTime.TryParse(filtro, out busquedaFecha);
            if (busquedaFecha < new DateTime(1753, 1, 1))
            {
                busquedaFecha = new DateTime(1753, 1, 1);
            }
            int.TryParse(filtro, out numero);

            try
            {
                if (status != 2)
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbhelp.modelo.VistaEventosSinCerrars.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.titulo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia_aprox == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.observaciones.Contains(filtro) ||
                                                         a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro)
                                                         ) && a.status == status).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.VistaEventosSinCerrars.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.titulo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia_aprox == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.observaciones.Contains(filtro) ||
                                                         a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro)
                                                         ) && (a.status == status) && (a.FechaInicio >= FechaInicio && a.FechaInicio <= FechaFinal)).ToList();
                        
                    }
                }
                else
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbhelp.modelo.VistaEventosCerrados.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.titulo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia_aprox == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.observaciones.Contains(filtro) ||
                                                         a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro)
                                                         ) && a.status == status).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.VistaEventosCerrados.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.titulo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia_aprox == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.observaciones.Contains(filtro) ||
                                                         a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro)
                                                         ) && (a.status == status) && (a.FechaInicio >= FechaInicio && a.FechaInicio <= FechaFinal)).ToList();

                    }
                }
            }
            catch
            {
                return null;
            }
        }

        public static bool insertarEvento(int? id, string tit, int? lug, string ac, string tipo, DateTime feIn, int? asis, DateTime? In, DateTime? Fn, string desc)
        {       
            try
            {
                   var evento = dbhelp.modelo.insertarEvento(tit, lug, ac, asis, In, Fn, desc, tipo, id, feIn);
                   if (evento != 0)
                   {
                       dbhelp.modelo.SaveChanges();
                   }
                   return true; 
            }
            catch
            {    
                return false;
            }
            
        }

        public static bool cambiarStatus(int id, int status)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.status = status;
                    dbhelp.modelo.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }
                
            }
            catch
            {
                return false;
            }
        }

        public static bool cerrarEvento(int id)
        {
            try
            {
                var eventoModificado = dbhelp.modelo.cerrarEvento(id);
                if (eventoModificado !=0 )
                {
                    dbhelp.modelo.SaveChanges();               
                    return true;
                }
                else
                {
                    return false;    
                }                     
            }
            catch
            {
                return false;
            }
        }

        public static bool asignarResponsable(int id, int res, int apo)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.status = 1;
                    ItemAmodificar.responsable = res;
                    ItemAmodificar.apoyo = apo;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool editarEvento(int id, string tit, int lug, string aco, string tipo, DateTime feIn, int asis, DateTime In, DateTime Fn, string desc)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.titulo = tit;
                    ItemAmodificar.descripcion = desc;
                    ItemAmodificar.lugar = lug;
                    ItemAmodificar.acomodo = aco;
                    ItemAmodificar.tipo_evento = tipo;
                    ItemAmodificar.asistencia_aprox = asis;
                    ItemAmodificar.FechaInicio = feIn;
                    ItemAmodificar.horaIn = In;
                    ItemAmodificar.horaFn = Fn;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch 
            {
                return false;
            }
        }

        public static bool editarObservaciones(int id, String ob)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.observaciones = ob;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static int obtenerUltimoEvento()
        {
            try
            {
                return dbhelp.modelo.tbleventoes.Max(a => a.idEvento);
            }
            catch
            {
                return 1;
            }
        }

        public static int obtenerNumeroEventosAbiertos()
        {
            try
            {
                return dbhelp.modelo.tbleventoes.Where(a => a.status == 0).Count();
            }
            catch
            {
                return 0;
            }
        }

        public static int obtenerNumeroDeEventosSolicitados(int usuario)
        {
            try
            {
                return dbhelp.modelo.tbleventoes.Count(a => a.solicitante == usuario);
            }
            catch{
                return -1;
            }
        }

        public static IList<ViewEventoConRequerimiento> obtenerEventoConRequerimientos(int tipo, int solicitante)
        {
            try
            {
                if (tipo == 1)
                {
                    return dbhelp.modelo.ViewEventoConRequerimientos.Where(a => a.solicitante == solicitante).ToList();
                }
                else
                {
                    return dbhelp.modelo.ViewEventoConRequerimientos.ToList();
                }
            }
            catch
            {
                return null;
            }
        }

    }
}
