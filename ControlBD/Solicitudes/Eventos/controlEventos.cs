
using HelpDeskWeb.ControlBD.Catalogo;
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

        public static IList obtenerDataSourceSolicitante(int idSolicitante, int status, string filtro, DateTime? FechaInicio, DateTime? FechaFinal)
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
                if (status == 2)
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbhelp.modelo.vt_eventos_cerrados.Where(a => (a.estatus_evento == status && a.idsolicitante == idSolicitante) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.fecha_solicitud.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_realizacion.Equals(busquedaFecha) ||
                                                         a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.soporte.Contains(filtro) ||
                                                         a.tipo.Contains(filtro))).Select(x => new
                                                         {
                                                             id = x.id,
                                                             descripcion = x.descripcion,
                                                             tipo = x.tipo,
                                                             estatus_calidad = x.estatus_calidad,
                                                             solicitante = x.solicitante,
                                                             soporte = x.soporte,
                                                             apoyo = x.apoyo,
                                                             nombre = x.nombre,
                                                             lugar = x.lugar,
                                                             fecha_realizacion = x.fecha_realizacion,
                                                             fecha_solicitud = x.fecha_solicitud,
                                                             fecha_cierre = x.fecha_cierre,
                                                             hora_inicial = x.hora_inicial,
                                                             hora_final = x.hora_final,
                                                             acomodo = x.acomodo,
                                                             asistencia = x.asistencia
                                                         }).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_eventos_cerrados.Where(a => (a.estatus_evento == status && a.idsolicitante == idSolicitante && (a.fecha_realizacion >= FechaInicio && a.fecha_realizacion <= FechaFinal)) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                           a.fecha_solicitud.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_realizacion.Equals(busquedaFecha) ||
                                           a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.soporte.Contains(filtro) || a.tipo.Contains(filtro))).Select(x => new
                                           {
                                               id = x.id,
                                               descripcion = x.descripcion,
                                               tipo = x.tipo,
                                               estatus_calidad = x.estatus_calidad,
                                               solicitante = x.solicitante,
                                               soporte = x.soporte,
                                               apoyo = x.apoyo,
                                               nombre = x.nombre,
                                               lugar = x.lugar,
                                               fecha_realizacion = x.fecha_realizacion,
                                               fecha_solicitud = x.fecha_solicitud,
                                               fecha_cierre = x.fecha_cierre,
                                               hora_inicial = x.hora_inicial,
                                               hora_final = x.hora_final,
                                               acomodo = x.acomodo,
                                               asistencia = x.asistencia
                                           }).ToList();

                    }
                }
                else
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbhelp.modelo.vt_evento_sin_cerrar.Where(a => (a.estatus_evento == status && a.idsolicitante == idSolicitante) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.fecha_solicitud.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_realizacion.Equals(busquedaFecha) ||
                                                         a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.soporte.Contains(filtro) ||
                                                         a.tipo.Contains(filtro))).Select(x => new
                                                         {
                                                             id = x.id,
                                                             descripcion = x.descripcion,
                                                             tipo = x.tipo,
                                                             solicitante = x.solicitante,
                                                             soporte = x.soporte,
                                                             apoyo = x.apoyo,
                                                             nombre = x.nombre,
                                                             lugar = x.lugar,
                                                             fecha_realizacion = x.fecha_realizacion,
                                                             fecha_solicitud = x.fecha_solicitud,
                                                             fecha_cierre = x.fecha_cierre,
                                                             hora_inicial = x.hora_inicial,
                                                             hora_final = x.hora_final,
                                                             acomodo = x.acomodo,
                                                             asistencia = x.asistencia
                                                         }).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_evento_sin_cerrar.Where(a => (a.estatus_evento == status && a.idsolicitante == idSolicitante && (a.fecha_realizacion >= FechaInicio && a.fecha_realizacion <= FechaFinal)) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                           a.fecha_solicitud.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_realizacion.Equals(busquedaFecha) ||
                                           a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.soporte.Contains(filtro) || a.tipo.Contains(filtro))).Select(x => new
                                           {
                                               id = x.id,
                                               descripcion = x.descripcion,
                                               tipo = x.tipo,
                                               solicitante = x.solicitante,
                                               soporte = x.soporte,
                                               apoyo = x.apoyo,
                                               nombre = x.nombre,
                                               lugar = x.lugar,
                                               fecha_realizacion = x.fecha_realizacion,
                                               fecha_solicitud = x.fecha_solicitud,
                                               fecha_cierre = x.fecha_cierre,
                                               hora_inicial = x.hora_inicial,
                                               hora_final = x.hora_final,
                                               acomodo = x.acomodo,
                                               asistencia = x.asistencia
                                           }).ToList();

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
                return dbhelp.modelo.tblevento.SingleOrDefault(a => a.id == evento);
            }
            catch
            {
                return null;
            }
        }

        public static vt_eventos_cerrados obtenerventoCerrado(int evento)
        {
            try
            {
                return dbhelp.modelo.vt_eventos_cerrados.SingleOrDefault(a => a.id == evento);
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
                if (status == 2)
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbhelp.modelo.vt_eventos_cerrados.Where(a => (a.descripcion.Contains(filtro) || a.nombre.Contains(filtro) ||
                                                         a.fecha_solicitud.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.fecha_realizacion.Equals(busquedaFecha) ||
                                                         a.nombre.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.soporte.Contains(filtro) || a.tipo.Contains(filtro)
                                                         ) && a.estatus_evento == status).Select(x => new
                                                         {
                                                             id = x.id,
                                                             descripcion = x.descripcion,
                                                             tipo = x.tipo,
                                                             estatus_calidad = x.estatus_calidad,
                                                             solicitante = x.solicitante,
                                                             soporte = x.soporte,
                                                             apoyo = x.apoyo,
                                                             nombre = x.nombre,
                                                             lugar = x.lugar,
                                                             fecha_realizacion = x.fecha_realizacion,
                                                             fecha_solicitud = x.fecha_solicitud,
                                                             fecha_cierre = x.fecha_cierre,
                                                             hora_inicial = x.hora_inicial,
                                                             hora_final = x.hora_final,
                                                             acomodo = x.acomodo,
                                                             asistencia = x.asistencia
                                                         }).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_eventos_cerrados.Where(a => (a.descripcion.Contains(filtro) || a.nombre.Contains(filtro) ||
                                                         a.fecha_solicitud.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.fecha_realizacion.Equals(busquedaFecha) ||
                                                         a.nombre.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.soporte.Contains(filtro) || a.tipo.Contains(filtro)
                                                         ) && (a.estatus_evento == status) && (a.fecha_realizacion >= FechaInicio && a.fecha_realizacion <= FechaFinal)).Select(x => new
                                                         {
                                                             id = x.id,
                                                             descripcion = x.descripcion,
                                                             tipo = x.tipo,
                                                             estatus_calidad = x.estatus_calidad,
                                                             solicitante = x.solicitante,
                                                             soporte = x.soporte,
                                                             apoyo = x.apoyo,
                                                             nombre = x.nombre,
                                                             lugar = x.lugar,
                                                             fecha_realizacion = x.fecha_realizacion,
                                                             fecha_solicitud = x.fecha_solicitud,
                                                             fecha_cierre = x.fecha_cierre,
                                                             hora_inicial = x.hora_inicial,
                                                             hora_final = x.hora_final,
                                                             acomodo = x.acomodo,
                                                             asistencia = x.asistencia
                                                         }).ToList();

                    }
                }
                else
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbhelp.modelo.vt_evento_sin_cerrar.Where(a => (a.descripcion.Contains(filtro) || a.nombre.Contains(filtro) ||
                                                         a.fecha_solicitud.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.fecha_realizacion.Equals(busquedaFecha) ||
                                                         a.nombre.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.soporte.Contains(filtro) || a.tipo.Contains(filtro)
                                                         ) && a.estatus_evento == status).Select(x => new
                                                         {
                                                             id = x.id,
                                                             descripcion = x.descripcion,
                                                             tipo = x.tipo,
                                                             solicitante = x.solicitante,
                                                             soporte = x.soporte,
                                                             apoyo = x.apoyo,
                                                             nombre = x.nombre,
                                                             lugar = x.lugar,
                                                             fecha_realizacion = x.fecha_realizacion,
                                                             fecha_solicitud = x.fecha_solicitud,
                                                             fecha_cierre = x.fecha_cierre,
                                                             hora_inicial = x.hora_inicial,
                                                             hora_final = x.hora_final,
                                                             acomodo = x.acomodo,
                                                             asistencia = x.asistencia
                                                         }).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_evento_sin_cerrar.Where(a => (a.descripcion.Contains(filtro) || a.nombre.Contains(filtro) ||
                                                         a.fecha_solicitud.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.fecha_realizacion.Equals(busquedaFecha) ||
                                                         a.nombre.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.soporte.Contains(filtro) || a.tipo.Contains(filtro)
                                                         ) && (a.estatus_evento == status) && (a.fecha_realizacion >= FechaInicio && a.fecha_realizacion <= FechaFinal)).Select(x => new
                                                         {
                                                             id = x.id,
                                                             descripcion = x.descripcion,
                                                             tipo = x.tipo,
                                                             solicitante = x.solicitante,
                                                             soporte = x.soporte,
                                                             apoyo = x.apoyo,
                                                             nombre = x.nombre,
                                                             lugar = x.lugar,
                                                             fecha_realizacion = x.fecha_realizacion,
                                                             fecha_solicitud = x.fecha_solicitud,
                                                             fecha_cierre = x.fecha_cierre,
                                                             hora_inicial = x.hora_inicial,
                                                             hora_final = x.hora_final,
                                                             acomodo = x.acomodo,
                                                             asistencia = x.asistencia
                                                         }).ToList();

                    }
                }
               
            }
            catch
            {
                return null;
            }
        }

        public static bool insertar(int? idSolicitante, string titulo, int? lugar, string acomodo, int? tipo, DateTime? fechaInicial, int? asistencia, DateTime? horaInicial, DateTime? horafinal, string descripcion)
        {       
            try
            {
                int idservicio = controlServicios.obtenerUltimoServicio()+1;
                int idusuario = controlUsuario.obtener_idUsuario_sinAsignar();
                int idevento = obtenerUltimoEvento()+1;
                var evento = dbhelp.modelo.sp_insertar_evento(idevento, titulo, lugar, acomodo, asistencia, horaInicial, horafinal, descripcion, tipo, idSolicitante, fechaInicial, idusuario, idservicio);
                   if (evento != 0)
                   {
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

        public static bool cerrarEvento(int id)
        {
            try
            {

                var eventoModificado = dbhelp.modelo.sp_cerrar_evento(obtenerEvento(id).fk_idservicio);
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
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static bool modificar(int id, string titulo, int lugar, string acomodo, int tipo, DateTime fecha_realizacion, int asistencia, DateTime horaInicio, DateTime horaFinal, string descripcion)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblevento.SingleOrDefault(x => x.id == id);
                if (ItemAmodificar != null)
                {
                    int idservicio = obtenerEvento(id).fk_idservicio;
                    ItemAmodificar.nombre = titulo;
                    ItemAmodificar.fk_idlugar = lugar;
                    ItemAmodificar.acomodo = acomodo;
                    ItemAmodificar.fk_idtipo = tipo;
                    ItemAmodificar.asistencia = asistencia;
                    ItemAmodificar.fecha_realizacion = fecha_realizacion;
                    if (controlServicios.modificar(idservicio, descripcion, horaInicio, horaFinal))
                    {
                        dbhelp.modelo.SaveChanges();
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                return true;
            }
            catch 
            {
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static bool modificarObservacion(int id, String observacion)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblevento.SingleOrDefault(x => x.id == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.observacion = observacion;
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

        public static int obtenerUltimoEvento()
        {
            try
            {
                return dbhelp.modelo.tblevento.Max(a => a.id);
            }
            catch
            {
                return 0;
            }
        }

        public static int obtenerNumeroEventosAbiertos()
        {
            try
            {
                return dbhelp.modelo.tblevento.Where(a => a.tblservicio.fk_idestatus == 0).Count();
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
                return dbhelp.modelo.tblevento.Count(a => a.tblservicio.fk_idusuario_solicitante == usuario);
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
                    return dbhelp.modelo.vt_recursos_asignados.Where(a => a.idsolicitante == solicitante).GroupBy(a=>a.idevento).ToList();
                }
                else
                {
                    return dbhelp.modelo.vt_recursos_asignados.ToList();
                }
            }
            catch
            {
                return null;
            }
        }

        public static bool asignarSoporte(int id, int idSoporte, int idApoyo)
        {
            try
            {
                var evento = dbhelp.modelo.tblevento.SingleOrDefault(a => a.id == id);

                if (evento != null)
                {
                    evento.tblservicio.fk_idestatus = 1;
                    evento.tblservicio.fk_idusuario_soporte = idSoporte;
                    evento.tblservicio.fk_idusuario_apoyo = idApoyo;
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
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

    }
}
