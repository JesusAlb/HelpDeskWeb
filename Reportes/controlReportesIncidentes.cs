using HelpDeskWeb.EntityFrameWork;
using HelpDeskWeb.Reportes.ModeloReportes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HelpDeskWeb.Reportes
{
    public class controlReportesIncidentes
    {
        public static IList<vt_incidentes> dataSourceIncidentesCerrados(int? idSolicitante, string tipo, int status, string filtro, DateTime? limiteIn, DateTime? limiteSp)
        {
            try
            {
                DateTime busquedaFecha;
                int numero;
                DateTime.TryParse(filtro, out busquedaFecha);
                if (busquedaFecha < new DateTime(1753, 1, 1))
                {
                    busquedaFecha = new DateTime(1753, 1, 1);
                }
                int.TryParse(filtro, out numero);

                IList<vt_incidentes_cerrados> incidentesCerrados;

                if (idSolicitante != null)
                {


                    incidentesCerrados = dbhelp.modelo.vt_incidentes_cerrados.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                                a.apoyo.Contains(filtro) || a.tipo.Contains(filtro) ||
                                a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                                a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                                a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.fk_idusuario_solicitante == idSolicitante && a.tipo.Contains(tipo))).ToList();
                }
                else
                {
                    incidentesCerrados = dbhelp.modelo.vt_incidentes_cerrados.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.apoyo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.tipo.Contains(tipo))).ToList();
                }

                return incidentesCerrados.Select(x => new vt_incidentes
                {
                    id = x.id,
                    descripcion = x.descripcion,
                    tipo = x.tipo,
                    solicitante = x.solicitante,
                    prioridad = x.prioridad,
                    soporte = x.soporte,
                    apoyo = x.apoyo,
                    fecha_solicitud = x.fecha_solicitud,
                    fecha_cierre = x.fecha_cierre.Value,
                    hora_inicial = x.hora_inicial.Value,
                    hora_final = x.hora_final.Value,
                    acciones = x.acciones,
                    solucion = x.solucion

                }).ToList();

            }
            catch
            {
                return null;
            }

        }

        public static IList<vt_incidentes> dataSourceIncidentesSinCerrar(int? idSolicitante, string tipo, int status, string filtro, DateTime? limiteIn, DateTime? limiteSp)
        {
            try
            {

                DateTime busquedaFecha;
                int numero;
                DateTime.TryParse(filtro, out busquedaFecha);
                if (busquedaFecha < new DateTime(1753, 1, 1))
                {
                    busquedaFecha = new DateTime(1753, 1, 1);
                }
                int.TryParse(filtro, out numero);

                IList<vt_incidente_sin_cerrar> incidentes_sin_cerrar;

                if (idSolicitante != null)
                {
                    incidentes_sin_cerrar = dbhelp.modelo.vt_incidente_sin_cerrar.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                                a.apoyo.Contains(filtro) || a.tipo.Contains(filtro) ||
                                a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                                a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                                a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.fk_idusuario_solicitante == idSolicitante && a.tipo.Contains(tipo))).ToList();
                }
                else
                {
                    incidentes_sin_cerrar = dbhelp.modelo.vt_incidente_sin_cerrar.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.apoyo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.tipo.Contains(tipo))).ToList();
                }

                return incidentes_sin_cerrar.Select(x => new vt_incidentes
                {
                    id = x.id,
                    descripcion = x.descripcion,
                    tipo = x.tipo,
                    solicitante = x.solicitante,
                    prioridad = x.prioridad,
                    soporte = x.soporte,
                    apoyo = x.apoyo,
                    fecha_solicitud = x.fecha_solicitud,
                    fecha_cierre = x.fecha_cierre.Value,
                    hora_inicial = x.hora_inicial.Value,
                    hora_final = x.hora_final.Value,
                    acciones = x.acciones,
                    solucion = x.solucion

                }).ToList();

            }
            catch
            {
                return null;
            }

        }
    }
}