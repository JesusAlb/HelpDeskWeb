
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
    class controlEventos
    {

        public static IList obtenerDataSourceSolicitante(int idSol, int status, string filtro, DateTime? FechaInicio, DateTime? FechaFinal)
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
                        return dbhelp.modelo.vt_eventos_sin_cerrar.Where(a => (a.status == status && a.idSolicitante == idSol) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) ||
                                                         a.tipo_evento.Contains(filtro))).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_eventos_sin_cerrar.Where(a => (a.status == status && a.idSolicitante == idSol && (a.FechaInicio >= FechaInicio && a.FechaInicio <= FechaFinal)) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                           a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||                          
                                           a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro))).ToList();

                    }
                }
                else
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbhelp.modelo.vt_eventos_cerrados.Where(a => (a.status == status && a.idSolicitante == idSol) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) ||
                                                         a.tipo_evento.Contains(filtro))).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_eventos_cerrados.Where(a => (a.status == status && a.idSolicitante == idSol && (a.FechaInicio >= FechaInicio && a.FechaInicio <= FechaFinal)) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
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

        public static tblevento obtenerEvento(int evento)
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

        public static vt_eventos_cerrados cargarEventoCerrado(int evento)
        {
            try
            {
                return dbhelp.modelo.vt_eventos_cerrados.SingleOrDefault(a => a.idEvento == evento);
            }
            catch
            {
                return null;
            }
        }

        public static IList obtenerDataSourceSoporte(int status, string filtro, DateTime? FechaInicio, DateTime? FechaFinal)
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
                        return dbhelp.modelo.vt_eventos_sin_cerrar.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
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
                        return dbhelp.modelo.vt_eventos_sin_cerrar.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
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
                        return dbhelp.modelo.vt_eventos_cerrados.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
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
                        return dbhelp.modelo.vt_eventos_cerrados.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
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

        public static bool insertar(int? id, string titulo, int? lugar, string acomodo, string tipo, DateTime fechaInicial, int? asistencia, DateTime? horaInicial, DateTime? horafinal, string descripcion)
        {       
            try
            {
                var evento = dbhelp.modelo.sp_insertar_evento(titulo, lugar, acomodo, asistencia, horaInicial, horafinal, descripcion, tipo, id, fechaInicial);
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
                var eventoModificado = dbhelp.modelo.sp_cerrar_evento(id);
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

        public static bool asignarResponsable(int id, int responsable, int apoyo)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.status = 1;
                    ItemAmodificar.responsable = responsable;
                    ItemAmodificar.apoyo = apoyo;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool modificar(int id, string titulo, int lugar, string acomodo, string tipo, DateTime fechaInicial, int asistencia, DateTime horaInicio, DateTime horaFinal, string descripcion)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.titulo = titulo;
                    ItemAmodificar.descripcion = descripcion;
                    ItemAmodificar.lugar = lugar;
                    ItemAmodificar.acomodo = acomodo;
                    ItemAmodificar.tipo_evento = tipo;
                    ItemAmodificar.asistencia_aprox = asistencia;
                    ItemAmodificar.FechaInicio = fechaInicial;
                    ItemAmodificar.horaIn = horaInicio;
                    ItemAmodificar.horaFn = horaFinal;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch 
            {
                return false;
            }
        }

        public static bool modificarObservacion(int id, String observacion)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.observaciones = observacion;
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

        public static IList obtenerEventoConRequerimientos(int tipo, int solicitante)
        {
            try
            {
                if (tipo == 1)
                {
                    return dbhelp.modelo.vt_requerimientos_asignados.Where(a => a.solicitante == solicitante).GroupBy(a=>a.evento).ToList();
                }
                else
                {
                    return dbhelp.modelo.vt_requerimientos_asignados.ToList();
                }
            }
            catch
            {
                return null;
            }
        }

    }
}
