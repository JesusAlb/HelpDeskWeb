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
    public class controlReportes
    {
        public static IList<vt_reporte_equipos> dataSourceReporteEquipos(string filtro)
        {
            try
            {
                return dbhelp.modelo.vt_reporte_equipos.Where(a => a.disco_duro.Contains(filtro) || a.ip.Contains(filtro) ||
                    a.mac.Contains(filtro) || a.memoria_ram.Contains(filtro) || a.nom_area.Contains(filtro) ||
                    a.nom_completo.Contains(filtro) || a.nom_coordinacion.Contains(filtro) || a.nom_depto.Contains(filtro) ||
                    a.nom_marca_equipo.Contains(filtro) || a.nom_marca_monitor.Contains(filtro) || a.nom_marca_mouse.Contains(filtro) ||
                    a.nom_marca_teclado.Contains(filtro) || a.nom_puesto.Contains(filtro) || a.nom_tipo_equipo.Contains(filtro) ||
                    a.procesador.Contains(filtro) || a.serie_equipo.Contains(filtro) || a.serie_monitor.Contains(filtro) ||
                    a.serie_mouse.Contains(filtro) || a.serie_teclado.Contains(filtro)
                    ).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static IList<vt_elemento_por_usuario> dataSourceEventosPorUsuario()
        {
            try
            {

                var query = from c in dbhelp.modelo.tblevento
                            join o in dbhelp.modelo.vt_servicios on c.fk_idservicio equals o.id
                            where o.estatus == 2
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

        public static IList<vt_eventos_por_mes> dataSourceEventosPorMes()
        {
            try
            {
                var result = (
                                from device in dbhelp.modelo.tblevento
                                join o in dbhelp.modelo.tblservicio on device.fk_idservicio equals o.id
                                where o.estatus == 2
                                group device by new { Date = System.Data.Entity.DbFunctions.TruncateTime(device.fecha_realizacion) } into g
                                select new vt_eventos_por_mes
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

        public static IList<vt_recursos_usados> dataSourceRecursosMasUsados()
        {
            try
            {

                var query = from c in dbhelp.modelo.tblrecurso
                            join o in dbhelp.modelo.tblrecursoasignado on c.id equals o.fk_idrequerimiento
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
    }
}