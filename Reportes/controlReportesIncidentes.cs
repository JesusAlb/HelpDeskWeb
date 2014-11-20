using HelpDeskWeb.EntityFrameWork;
using HelpDeskWeb.Reportes.ModeloReportes;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HelpDeskWeb.Reportes
{
    public class controlReportesIncidentes
    {
        public static IList<vt_incidentes> dataSourceIncidentes(int? idSolicitante, string tipo, string status, string filtro, DateTime? limiteIn, DateTime? limiteSp)
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

                    return dbhelp.modelo.tblincidente.Where(a => (a.acciones.Contains(filtro) || a.tblservicio.descripcion.Contains(filtro) ||
                                a.tblservicio.tblusuario.nombre_usuario.Contains(filtro) || a.tbltipoincidencia.nombre.Contains(filtro) || a.tblservicio.tblusuario1.nombre.Contains(filtro) || a.tblservicio.tblusuario1.apellidos.Contains(filtro) ||
                                a.tblservicio.tblusuario2.nombre_usuario.Contains(filtro) || a.tblservicio.fecha_cierre.Value.Equals(busquedaFecha) || a.tblservicio.fecha_solicitud.Equals(busquedaFecha) ||
                                a.solucion.Contains(filtro)) && (a.tblservicio.tblestatus.nombre.Contains(status) && a.tblservicio.fk_idusuario_solicitante == idSolicitante)).Select(
                                        x => new vt_incidentes
                                        {
                                            id = x.id,
                                            descripcion = x.tblservicio.descripcion,
                                            tipo = x.tbltipoincidencia.nombre,
                                            solicitante = x.tblservicio.tblusuario1.nombre + " " + x.tblservicio.tblusuario1.apellidos,
                                            estatus = x.tblservicio.tblestatus.nombre,                                           
                                            prioridad = x.tblprioridad.nombre,
                                            soporte = x.tblservicio.tblusuario2.nombre_usuario,
                                            apoyo = x.tblservicio.tblusuario.nombre_usuario,
                                            fecha_solicitud = x.tblservicio.fecha_solicitud,
                                            fecha_cierre = x.tblservicio.fecha_cierre,
                                            hora_inicial = x.tblservicio.hora_inicial.Value,
                                            hora_final = x.tblservicio.hora_final,
                                            acciones = x.acciones,
                                            solucion = x.solucion
                                        }).ToList();
                }
                else
                {
                    return dbhelp.modelo.tblincidente.Where(a => (a.acciones.Contains(filtro) || a.tblservicio.descripcion.Contains(filtro) || a.tblservicio.tblusuario1.nombre.Contains(filtro) || a.tblservicio.tblusuario1.apellidos.Contains(filtro) ||
                            a.tblservicio.tblusuario.nombre_usuario.Contains(filtro) || a.tblservicio.tblusuario1.nombre_usuario.Contains(filtro) ||
                            a.tblservicio.tblusuario2.nombre_usuario.Contains(filtro) || a.tblservicio.fecha_cierre.Value.Equals(busquedaFecha) || a.tblservicio.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.tblservicio.tblestatus.nombre.Contains(status))).Select(
                                        x => new vt_incidentes
                                        {
                                            id = x.id,
                                            descripcion = x.tblservicio.descripcion,
                                            tipo = x.tbltipoincidencia.nombre,
                                            solicitante = x.tblservicio.tblusuario1.nombre + " " + x.tblservicio.tblusuario1.apellidos,
                                            estatus = x.tblservicio.tblestatus.nombre,
                                            prioridad = x.tblprioridad.nombre,
                                            soporte = x.tblservicio.tblusuario2.nombre_usuario,
                                            apoyo = x.tblservicio.tblusuario.nombre_usuario,
                                            fecha_solicitud = x.tblservicio.fecha_solicitud,
                                            fecha_cierre = x.tblservicio.fecha_cierre,
                                            hora_inicial = x.tblservicio.hora_inicial.Value,
                                            hora_final = x.tblservicio.hora_final,
                                            acciones = x.acciones,
                                            solucion = x.solucion
                                        }).ToList();
                }
                
            }
            catch
            {
                return null;
            }

        }

        public static IList<vt_elemento_por_usuario> dataSourceIncidentesPorUsuario(DateTime? fechaInicial, DateTime? fechaFinal)
        {
            try
            {

                var query = from c in dbhelp.modelo.tblincidente
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

        public static IList<vt_elemento_por_usuario> dataSourceIncidentesPorTipo(DateTime? fechaInicial, DateTime? fechaFinal)
        {
            try
            {

                var query = from c in dbhelp.modelo.tblincidente
                            join o in dbhelp.modelo.vt_servicios on c.fk_idservicio equals o.id
                            where o.fk_idestatus == 2 && (o.fecha_cierre >= fechaInicial && o.fecha_cierre <= fechaFinal)
                            group c by c.tbltipoincidencia.nombre into g
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

        public static IList<vt_elemento_por_usuario> dataSourceIncidentesPorDepartamento(DateTime? fechaInicial, DateTime? fechaFinal)
        {
            try
            {
                var query = from c in dbhelp.modelo.tblincidente
                            join o in dbhelp.modelo.vt_servicios on c.fk_idservicio equals o.id
                            where o.fk_idestatus == 2 && (o.fecha_cierre >= fechaInicial && o.fecha_cierre <= fechaFinal)
                            group c by c.tblservicio.tblusuario1.tbldepartamento.nombre into g
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

        public static IList<vt_elemento_por_tiempo> dataSourceIncidentesPorMes(DateTime? fechaInicial, DateTime? fechaFinal)
        {
            try
            {

                var result = (
                                from device in dbhelp.modelo.tblincidente
                                join o in dbhelp.modelo.tblservicio on device.fk_idservicio equals o.id
                                where o.fk_idestatus == 2 && (o.fecha_cierre >= fechaInicial && o.fecha_cierre <= fechaFinal)
                                group device by new { Date = System.Data.Entity.DbFunctions.TruncateTime(device.tblservicio.fecha_cierre) } into g
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

    }
}