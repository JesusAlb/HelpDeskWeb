using HelpDeskWeb.EntityFrameWork;
using HelpDeskWeb.Reportes.ModeloReportes;
using System;
using System.Collections.Generic;
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

        public static IList<vt_eventos_por_usuario> dataSourceEventosPorUsuario()
        {
            try
            {
                return dbhelp.modelo.vt_eventos_cerrados.Select(a => new vt_eventos_por_usuario
                {
                    nombre = a.soporte,
                    cantidad = dbhelp.modelo.vt_eventos_cerrados.Where(z => z.idsolicitante == a.idsolicitante).Count()
                }).ToList();
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
                return dbhelp.modelo.vt_eventos_cerrados.Select(a => new vt_eventos_por_mes
                {
                    usuario = a.soporte,
                    tiempo = a.fecha_cierre.Value.Year + "/" + a.fecha_cierre.Value.Month,
                    año = a.fecha_cierre.Value.Year,
                    mes = a.fecha_cierre.Value.Month,
                    dia = a.fecha_cierre.Value.Day
                }).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static IList<vt_recursos_mas_usados> dataSource5RecursosMasUsados()
        {
            try
            {

            }
            catch
            {

            }
        }
    }
}