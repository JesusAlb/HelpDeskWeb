using HelpDeskWeb.EntityFrameWork;
using HelpDeskWeb.Reportes.ModeloReportes;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;

namespace HelpDeskWeb.Reportes
{
    public class controlReportesEventos
    {
        public static IList<vt_eventos> dataSourceEventos(int? idSolicitante, string tipo, string status, string filtro, DateTime? limiteIn, DateTime? limiteSp)
        {
           try
            {
                 DateTime busquedaFecha;
                 DateTime.TryParse(filtro, out busquedaFecha);
                 if (busquedaFecha < new DateTime(1753, 1, 1))
                 {
                     busquedaFecha = new DateTime(1753, 1, 1);
                 }

                 if (idSolicitante != null)
                 {

                     return dbhelp.modelo.tblevento.Where(a => (a.acomodo.Contains(filtro) || a.tblservicio.descripcion.Contains(filtro) || a.tbltipoevento.nombre.Contains(filtro) ||
                                 a.tblservicio.tblusuario.nombre_usuario.Contains(filtro) || a.tbllugar.nombre.Contains(filtro) || a.tblservicio.tblusuario1.nombre.Contains(filtro) || a.tblservicio.tblusuario1.apellidos.Contains(filtro) ||
                                 a.tblservicio.tblusuario2.nombre_usuario.Contains(filtro) || a.tblservicio.fecha_cierre.Value.Equals(busquedaFecha) || a.tblservicio.fecha_solicitud.Equals(busquedaFecha) ||
                                 a.nombre.Contains(filtro)) && (a.tblservicio.tblestatus.nombre.Contains(status) && a.tblservicio.fk_idusuario_solicitante == idSolicitante)).Select(
                                         x => new vt_eventos
                                         {
                                             id = x.id,
                                             nombre = x.nombre,
                                             descripcion = x.tblservicio.descripcion,
                                             solicitante = x.tblservicio.tblusuario1.nombre + " "+ x.tblservicio.tblusuario1.apellidos,
                                             soporte = x.tblservicio.tblusuario2.nombre_usuario,
                                             apoyo = x.tblservicio.tblusuario.nombre_usuario,
                                             fecha_realizacion = x.fecha_realizacion,
                                             fecha_solicitud = x.tblservicio.fecha_solicitud,
                                             hora_inicial = x.tblservicio.hora_inicial,
                                             hora_final = x.tblservicio.hora_final,
                                             fecha_cierre = x.tblservicio.fecha_cierre    

                                         }).ToList();
                 }
                 else
                 {
                     return dbhelp.modelo.tblevento.Where(a => (a.acomodo.Contains(filtro) || a.tblservicio.descripcion.Contains(filtro) || a.tblservicio.tblusuario1.nombre.Contains(filtro) || a.tblservicio.tblusuario1.apellidos.Contains(filtro) ||
                             a.tblservicio.tblusuario.nombre_usuario.Contains(filtro) || a.tblservicio.tblusuario1.nombre_usuario.Contains(filtro) || a.tbltipoevento.nombre.Contains(filtro) ||
                             a.tblservicio.tblusuario2.nombre_usuario.Contains(filtro) || a.tblservicio.fecha_cierre.Value.Equals(busquedaFecha) || a.tblservicio.fecha_solicitud.Equals(busquedaFecha) ||
                             a.nombre.Contains(filtro)) && (a.tblservicio.tblestatus.nombre.Contains(status))).Select(
                                         x => new vt_eventos
                                         {
                                             id = x.id,
                                             nombre = x.nombre,
                                             descripcion = x.tblservicio.descripcion,
                                             solicitante = x.tblservicio.tblusuario1.nombre + " " + x.tblservicio.tblusuario1.apellidos,
                                             soporte = x.tblservicio.tblusuario2.nombre_usuario,
                                             apoyo = x.tblservicio.tblusuario.nombre_usuario,
                                             fecha_realizacion = x.fecha_realizacion,
                                             fecha_solicitud = x.tblservicio.fecha_solicitud,
                                             hora_inicial = x.tblservicio.hora_inicial,
                                             hora_final = x.tblservicio.hora_final,
                                             fecha_cierre = x.tblservicio.fecha_cierre    
                                         }).ToList();
                 }
            }
            catch
            {
                return null;
            }  
        }

        public static IList<vt_elemento_por_usuario> dataSourceEventosPorUsuario(DateTime? fechaInicial, DateTime? fechaFinal)
        {
            try
            {
                var query = from c in dbhelp.modelo.tblevento
                            join o in dbhelp.modelo.vt_servicios on c.fk_idservicio equals o.id
                            where o.fk_idestatus == 2 && (o.fecha_cierre >= fechaInicial && o.fecha_cierre <= fechaFinal)
                            group c by c.tblservicio.tblusuario2.nombre into g
                            select new vt_elemento_por_usuario
                            {
                                nombre = g.Key,
                                cantidad = g.Count(),
                            };
                return query.OrderByDescending(a => a.cantidad).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static IList<vt_elemento_por_tiempo> dataSourceEventosPorTiempo(DateTime? fechaInicial, DateTime? fechaFinal)
        {
            try
            {

                var result = (
                                from device in dbhelp.modelo.tblevento
                                join o in dbhelp.modelo.tblservicio on device.fk_idservicio equals o.id
                                where o.fk_idestatus == 2 && (o.fecha_cierre >= fechaInicial && o.fecha_cierre <= fechaFinal)
                                group device by new { Date = System.Data.Entity.DbFunctions.TruncateTime(device.fecha_realizacion) } into g
                                select new vt_elemento_por_tiempo
                                {
                                    tiempo = g.Key.Date.Value,
                                    cantidad = g.Count()
                                }
                                ).OrderBy(nda => nda.tiempo);

                return result.OrderByDescending(a => a.tiempo).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static IList<vt_recursos_usados> dataSourceRecursosMasUsados(DateTime? fechaInicial, DateTime? fechaFinal)
        {
            try
            {

                var query = from c in dbhelp.modelo.tblrecurso
                            join o in dbhelp.modelo.tblrecursoasignado on c.id equals o.fk_idrequerimiento
                            where o.tblevento.tblservicio.fk_idestatus == 2 && (o.tblevento.tblservicio.fecha_solicitud >= fechaInicial && o.tblevento.tblservicio.fecha_solicitud <= fechaFinal)
                            group o by o.tblrecurso.nombre into g
                            select new vt_recursos_usados
                            {
                                recurso = g.Key,
                                cantidad = g.Sum(o => o.cantidad.Value),
                            };
                return query.OrderByDescending(a=>a.cantidad).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static IList dataSourceEventosConRequerimientos(string filtro)
        {
            try
            {
               return  dbhelp.modelo.tblrecursoasignado.Where(a => a.tblevento.nombre.Contains(filtro)).Select(a => new
                {
                    id = a.fk_idevento,
                    nombre = a.tblevento.nombre,
                    fecha_realizacion = a.tblevento.fecha_realizacion
                }).Distinct().ToList();

            }
            catch
            {
                return null;
            }
        }

        public static IList<vt_recursos_asignados> dataSourceRecursosPorEventos(int id)
        {
            try
            {
                return dbhelp.modelo.vt_recursos_asignados.Where(a => a.idevento == id).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static IList<vt_calidad_por_objeto> dataSourceCalidadPorUsuario(DateTime? fechaInicial, DateTime? fechaFinal)
        {
            try
            {
                var query = from o in dbhelp.modelo.vt_eventos_cerrados
                            where o.estatus_evento == 2  && o.estatus_calidad == true && (o.fecha_cierre >= fechaInicial && o.fecha_cierre <= fechaFinal)
                            group o by o.soporte into g
                            select new vt_calidad_por_objeto
                            {
                                elemento = g.Key,
                                promedio = g.Average(o => o.promedio),
                            };
                return query.OrderByDescending(a => a.promedio).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static IList<vt_calidad_por_tiempo> dataSourceCalidadPorTiempo(DateTime? fechaInicial, DateTime? fechaFinal)
        {
            try
            {
                var result = (
                               from o in dbhelp.modelo.vt_eventos_cerrados
                               where o.estatus_evento == 2 && o.estatus_calidad == true && (o.fecha_cierre >= fechaInicial && o.fecha_cierre <= fechaFinal)
                               group o by new { Date = System.Data.Entity.DbFunctions.TruncateTime(o.fecha_realizacion) } into g
                               select new vt_calidad_por_tiempo
                               {
                                   tiempo = g.Key.Date.Value,
                                   promedio = g.Average(m => m.promedio)
                               }
                               ).OrderBy(nda => nda.tiempo);

                return result.OrderByDescending(a => a.tiempo).ToList();
            }
            catch
            {
                return null;
            }
        }
    }
}