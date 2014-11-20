
using HelpDeskWeb.ControlAltas;
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Windows;

namespace HelpDeskWeb.ControlBD.Solicitudes.Incidentes
{
    public class controlIncidentes
    {

        public static IList obtenerDataSourceSolicitante(int idSolicitante, string tipo, int status, string filtro, DateTime? limiteIn, DateTime? limiteSp)
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
                    if (limiteIn == null || limiteSp == null)
                    {
                        return dbhelp.modelo.vt_incidentes_cerrados.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.apoyo.Contains(filtro) || a.tipo.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.fk_idusuario_solicitante == idSolicitante && a.tipo.Contains(tipo))).Select(x => new {
                                id = x.id,
                                estatus_calidad = x.estatus_calidad,
                                tipo = x.tipo,
                                descripcion = x.descripcion,
                                solicitante = x.solicitante,
                                prioridad = x.prioridad,
                                soporte = x.soporte,
                                apoyo = x.apoyo,
                                fecha_solicitud = x.fecha_solicitud,
                                fecha_cierre = x.fecha_cierre,
                                hora_inicial = x.hora_inicial,
                                hora_final = x.hora_final,
                                acciones = x.acciones,
                                solucion = x.solucion
                                }).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_incidentes_cerrados.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.apoyo.Contains(filtro) || a.tipo.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.fk_idusuario_solicitante == idSolicitante && a.tipo.Contains(tipo) && (a.fecha_solicitud >= limiteIn && a.fecha_solicitud <= limiteSp))).Select(x => new
                            {
                                id = x.id,
                                estatus_calidad = x.estatus_calidad,
                                descripcion = x.descripcion,
                                tipo = x.tipo,
                                solicitante = x.solicitante,
                                prioridad = x.prioridad,
                                soporte = x.soporte,
                                apoyo = x.apoyo,
                                fecha_solicitud = x.fecha_solicitud,
                                fecha_cierre = x.fecha_cierre,
                                hora_inicial = x.hora_inicial,
                                hora_final = x.hora_final,
                                acciones = x.acciones,
                                solucion = x.solucion
                            }).ToList();
                    }
                }
                else
                {
                    if (limiteIn == null || limiteSp == null)
                    {
                        return dbhelp.modelo.vt_incidente_sin_cerrar.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.apoyo.Contains(filtro) || a.tipo.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.fk_idusuario_solicitante == idSolicitante && a.tipo.Contains(tipo))).Select(x => new
                            {
                                id = x.id,
                                descripcion = x.descripcion,
                                tipo = x.tipo,
                                solicitante = x.solicitante,
                                prioridad = x.prioridad,
                                soporte = x.soporte,
                                apoyo = x.apoyo,
                                fecha_solicitud = x.fecha_solicitud,
                                fecha_cierre = x.fecha_cierre,
                                hora_inicial = x.hora_inicial,
                                hora_final = x.hora_final,
                                acciones = x.acciones,
                                solucion = x.solucion
                            }).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_incidente_sin_cerrar.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.apoyo.Contains(filtro) || a.tipo.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.fk_idusuario_solicitante == idSolicitante && a.tipo.Contains(tipo) && (a.fecha_solicitud >= limiteIn && a.fecha_solicitud <= limiteSp))).Select(x => new
                            {
                                id = x.id,
                                descripcion = x.descripcion,
                                solicitante = x.solicitante,
                                tipo = x.tipo,
                                prioridad = x.prioridad,
                                soporte = x.soporte,
                                apoyo = x.apoyo,
                                fecha_solicitud = x.fecha_solicitud,
                                fecha_cierre = x.fecha_cierre,
                                hora_inicial = x.hora_inicial,
                                hora_final = x.hora_final,
                                acciones = x.acciones,
                                solucion = x.solucion
                            }).ToList();
                    }
                }
                
            }
            catch 
            {
                return null;
            }
        }

        public static IList obtenerDataSourceSoporte(int status, string tipo, string filtro, DateTime? limiteIn, DateTime? limiteSp)
        {

            DateTime busquedaFecha;
            int numero;
            DateTime.TryParse(filtro, out busquedaFecha);
            int.TryParse(filtro, out numero);
            if (busquedaFecha < new DateTime(1753, 1, 1))
            {
                busquedaFecha = new DateTime(1753, 1, 1);
            }
            try
            {
                if (status == 2)
                {
                    if (limiteIn == null || limiteSp == null)
                    {
                        return dbhelp.modelo.vt_incidentes_cerrados.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.apoyo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.tipo.Contains(tipo))).Select(x => new
                            {
                                id = x.id,
                                estatus_calidad = x.estatus_calidad,
                                tipo = x.tipo,
                                descripcion = x.descripcion,
                                solicitante = x.solicitante,
                                prioridad = x.prioridad,
                                soporte = x.soporte,
                                apoyo = x.apoyo,
                                fecha_solicitud = x.fecha_solicitud,
                                fecha_cierre = x.fecha_cierre,
                                hora_inicial = x.hora_inicial,
                                hora_final = x.hora_final,
                                acciones = x.acciones,
                                solucion = x.solucion
                            }).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_incidentes_cerrados.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.apoyo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.tipo.Contains(tipo)) && (a.fecha_solicitud >= limiteIn && a.fecha_solicitud <= limiteSp)).Select(x => new
                            {
                                id = x.id,
                                estatus_calidad = x.estatus_calidad,
                                descripcion = x.descripcion,
                                tipo = x.tipo,
                                solicitante = x.solicitante,
                                prioridad = x.prioridad,
                                soporte = x.soporte,
                                apoyo = x.apoyo,
                                fecha_solicitud = x.fecha_solicitud,
                                fecha_cierre = x.fecha_cierre,
                                hora_inicial = x.hora_inicial,
                                hora_final = x.hora_final,
                                acciones = x.acciones,
                                solucion = x.solucion
                            }).ToList();
                    }
                }
                else
                {
                    if (limiteIn == null || limiteSp == null)
                    {
                        return dbhelp.modelo.vt_incidente_sin_cerrar.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.apoyo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.tipo.Contains(tipo))).Select(x => new
                            {
                                id = x.id,
                                descripcion = x.descripcion,
                                tipo = x.tipo,
                                solicitante = x.solicitante,
                                prioridad = x.prioridad,
                                soporte = x.soporte,
                                apoyo = x.apoyo,
                                fecha_solicitud = x.fecha_solicitud,
                                fecha_cierre = x.fecha_cierre,
                                hora_inicial = x.hora_inicial,
                                hora_final = x.hora_final,
                                acciones = x.acciones,
                                solucion = x.solucion
                            }).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_incidente_sin_cerrar.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.apoyo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.id == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_cierre.Value.Equals(busquedaFecha) || a.fecha_solicitud.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.estatus_incidente == status && a.tipo.Contains(tipo)) && (a.fecha_solicitud >= limiteIn && a.fecha_solicitud <= limiteSp)).Select(x => new
                            {
                                id = x.id,
                                descripcion = x.descripcion,
                                solicitante = x.solicitante,
                                tipo = x.tipo,
                                prioridad = x.prioridad,
                                soporte = x.soporte,
                                apoyo = x.apoyo,
                                fecha_solicitud = x.fecha_solicitud,
                                fecha_cierre = x.fecha_cierre,
                                hora_inicial = x.hora_inicial,
                                hora_final = x.hora_final,
                                acciones = x.acciones,
                                solucion = x.solucion
                            }).ToList();
                    }
                }
            }
            catch
            {
                return null;
            }
        }

        public static bool insertarIncidenteCompleto(int solicitante, int soporte, int seguimiento, string descripcion, string acciones, string solucion, int tipo, DateTime feIn, DateTime? feFn, int prioridad, DateTime In, DateTime? Fn)
        {
            try
            {
                var servicio = controlServicios.insertar(descripcion, solicitante, soporte, seguimiento, 2, feIn, feFn, In, Fn);

                if (servicio)
                {
                    var incidente = new tblincidente
                    {
                        id = obtenerUltimoIncidente()+1,
                        acciones = acciones,
                        solucion = solucion,
                        tipo = tipo,
                        fk_idprioridad = prioridad,
                        fk_idservicio = controlServicios.obtenerUltimoServicio()
                    };
                    if (incidente != null)
                    {
                        dbhelp.modelo.tblincidente.Add(incidente);
                        dbhelp.modelo.SaveChanges();

                        var encuesta = controlEncuestas.insertar(controlServicios.obtenerUltimoServicio());
                            if (encuesta)
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                try
                {
                    using (StreamWriter w = File.AppendText("../../altaIncidentes.txt"))
                    {
                        string registro = feIn.ToShortDateString() + "    " + tipo + "    " + descripcion + "    " + solicitante + "    " + prioridad + "    " + In.ToShortTimeString() + "    " + "0";
                        w.WriteLine(registro);
                    }
                }
                catch
                {
                    
                }
                return false;
           }
        }

        public static bool insertarIncidente(int idSolicitante, string descripcion)
        {
            try
            {
                int idservicio = controlServicios.obtenerUltimoServicio();
                int idtipo = controlTipoIncidencia.obtenerTipoIncidenciaGeneral();
                int idusuario = controlUsuario.obtener_idUsuario_sinAsignar();
               var resultado = dbhelp.modelo.sp_insertar_incidente(obtenerUltimoIncidente(),idSolicitante, descripcion, idusuario, idservicio, idtipo );
               if (resultado != 0)
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

        public static bool cerrarIncidente(int id, string acciones, string solucion)
        {
            try
            {
                int idservicio = controlServicios.obtenerUltimoServicio();
                var ItemAmodificar = dbhelp.modelo.sp_cerrar_incidente(id, acciones, solucion, idservicio);
                if (ItemAmodificar != 0)
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

        public static bool asignarSoporte(int id, int soporte, int seguimiento, int prioridad, int tipo)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblincidente.SingleOrDefault(x => x.id == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.tblservicio.fk_idestatus = 1;
                    ItemAmodificar.tipo = tipo;
                    ItemAmodificar.fk_idprioridad = prioridad;
                    ItemAmodificar.tblservicio.fk_idusuario_soporte = soporte;
                    ItemAmodificar.tblservicio.fk_idusuario_apoyo = seguimiento;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch 
            {
               return false;
            }
        }

        public static int obtenerNumeroIncidentes()
        {
            try
            {
                return dbhelp.modelo.vt_incidente_sin_cerrar.Where(a => a.estatus_incidente == 0).Count();
            }
            catch
            {
                return 0;
            }
        }

        public static int obtenerUltimoIncidente()
        {
            try
            {
                return dbhelp.modelo.tblincidente.Max(a => a.id);
            }
            catch
            {
                return 0;
            }
        }

        public static tblincidente obtenerIncidente(int idIncidente)
        {
            try
            {
                return dbhelp.modelo.tblincidente.SingleOrDefault(a => a.id == idIncidente);
            }
            catch
            {
                return null;
            }
        }

        public static vt_incidentes_cerrados obtenerIncidenteCerrado(int idIncidente)
        {
            try
            {
                return dbhelp.modelo.vt_incidentes_cerrados.SingleOrDefault(a => a.id == idIncidente);
            }
            catch
            {
                return null;
            }
        }

        public static int obtenerNumeroDeIncidentesSolicitados(int usuario)
        {
            try
            {
                return dbhelp.modelo.tblincidente.Count(a => a.tblservicio.fk_idusuario_solicitante == usuario);
            }
            catch{
                return -1;
            }
        }

    }
}
