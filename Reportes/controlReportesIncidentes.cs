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

                IList<vt_incidentes> incidentes;

                if (idSolicitante != null)
                {

                    incidentes = dbhelp.modelo.tblincidente.Where(a => (a.acciones.Contains(filtro) || a.tblservicio.descripcion.Contains(filtro) ||
                                a.tblservicio.tblusuario.nombre_usuario.Contains(filtro) || a.tbltipoincidencia.nombre.Contains(filtro) ||
                                a.tblservicio.tblusuario2.nombre_usuario.Contains(filtro) || a.id == numero || a.tblservicio.fecha_cierre.Value.Equals(busquedaFecha) || a.tblservicio.fecha_solicitud.Equals(busquedaFecha) ||
                                a.solucion.Contains(filtro)) && (a.tblservicio.fk_idestatus == status && a.tblservicio.fk_idusuario_solicitante == idSolicitante)).Select(
                                        x => new vt_incidentes
                                        {
                                            id = x.id,
                                            descripcion = x.tblservicio.descripcion,
                                            tipo = x.tbltipoincidencia.nombre,
                                            solicitante = x.tblservicio.tblusuario1.nombre + " " + x.tblservicio.tblusuario1.apellidos,
                                            estatus = x.tblservicio.fk_idestatus,                                           
                                            prioridad = x.fk_idprioridad.ToString(),
                                            soporte = x.tblservicio.tblusuario2.nombre_usuario,
                                            apoyo = x.tblservicio.tblusuario.nombre_usuario,
                                            fecha_solicitud = x.tblservicio.fecha_solicitud,
                                            fecha_cierre = x.tblservicio.fecha_cierre.Value,
                                            hora_inicial = x.tblservicio.hora_inicial.Value,
                                            hora_final = x.tblservicio.hora_final.Value,
                                            acciones = x.acciones,
                                            solucion = x.solucion
                                        }).ToList();
                }
                else
                {
                    incidentes = dbhelp.modelo.tblincidente.Where(a => (a.acciones.Contains(filtro) || a.tblservicio.descripcion.Contains(filtro) ||
                            a.tblservicio.tblusuario.nombre_usuario.Contains(filtro) || a.tblservicio.tblusuario1.nombre_usuario.Contains(filtro) ||
                            a.tblservicio.tblusuario2.nombre_usuario.Contains(filtro) || a.id == numero ||
                            a.tblservicio.fecha_cierre.Value.Equals(busquedaFecha) || a.tblservicio.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.tblservicio.fk_idestatus == status)).Select(
                                        x => new vt_incidentes
                                        {
                                            id = x.id,
                                            descripcion = x.tblservicio.descripcion,
                                            tipo = x.tbltipoincidencia.nombre,
                                            solicitante = x.tblservicio.tblusuario1.nombre + " " + x.tblservicio.tblusuario1.apellidos,
                                            estatus = x.tblservicio.fk_idestatus,
                                            prioridad = x.fk_idprioridad.ToString(),
                                            soporte = x.tblservicio.tblusuario2.nombre_usuario,
                                            apoyo = x.tblservicio.tblusuario.nombre_usuario,
                                            fecha_solicitud = x.tblservicio.fecha_solicitud,
                                            fecha_cierre = x.tblservicio.fecha_cierre.Value,
                                            hora_inicial = x.tblservicio.hora_inicial.Value,
                                            hora_final = x.tblservicio.hora_final.Value,
                                            acciones = x.acciones,
                                            solucion = x.solucion
                                        }).ToList();
                }

                return incidentes;

            }
            catch
            {
                return null;
            }

        }

    }
}