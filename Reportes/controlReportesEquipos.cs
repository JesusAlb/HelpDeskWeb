using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HelpDeskWeb.Reportes
{
    public class controlReportesEquipos
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
    }
}