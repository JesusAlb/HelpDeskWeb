﻿
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

        public static IList<tbltipoincidencia> obtenerDataSourceCombBoxTipo()
        {
            try
            {
                var items = dbhelp.modelo.tbltipoincidencias.ToList();
                items.Insert(0, new tbltipoincidencia { idTipoIncidente = 0, nomTipoIncidente = "" });
                return items.ToList();
            }
            catch 
            {
                return null;
            }
        }

        public static IList obtenerDataSourceSolicitante(int idSol, string cbtipo, int status, string filtro, DateTime? limiteIn, DateTime? limiteSp)
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
                    if (limiteIn == null || limiteSp == null)
                    {
                        return dbhelp.modelo.vt_incidentes_sin_cerrar.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.seguimiento.Contains(filtro) || a.solicitante.Contains(filtro) || a.tipo.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.numIncidente == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_Cierre.Value.Equals(busquedaFecha) || a.fecha_Sol.Value.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.status == status && a.idSolicitante == idSol && a.tipo.Contains(cbtipo))).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_incidentes_sin_cerrar.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.seguimiento.Contains(filtro) || a.solicitante.Contains(filtro) || a.tipo.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.numIncidente == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_Cierre.Value.Equals(busquedaFecha) || a.fecha_Sol.Value.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.status == status && a.idSolicitante == idSol && a.tipo.Contains(cbtipo) && (a.fecha_Sol >= limiteIn && a.fecha_Sol <= limiteSp))).ToList();
                    }
                }
                else
                {
                    if (limiteIn == null || limiteSp == null)
                    {
                        return dbhelp.modelo.vt_incidentes_cerrados.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.seguimiento.Contains(filtro) || a.solicitante.Contains(filtro) || a.tipo.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.numIncidente == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_Cierre.Value.Equals(busquedaFecha) || a.fecha_Sol.Value.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.status == status && a.idSolicitante == idSol && a.tipo.Contains(cbtipo))).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_incidentes_cerrados.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.seguimiento.Contains(filtro) || a.solicitante.Contains(filtro) || a.tipo.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.numIncidente == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_Cierre.Value.Equals(busquedaFecha) || a.fecha_Sol.Value.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.status == status && a.idSolicitante == idSol && a.tipo.Contains(cbtipo) && (a.fecha_Sol >= limiteIn && a.fecha_Sol <= limiteSp))).ToList();
                    }
                }
            }
            catch 
            {
                return null;
            }
        }

        public static IList obtenerDataSourceSoporte(int status, string cbtipo, string filtro, DateTime? limiteIn, DateTime? limiteSp)
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
                if (status != 2)
                {
                    if (limiteIn == null || limiteSp == null)
                    {
                        return dbhelp.modelo.vt_incidentes_sin_cerrar.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.seguimiento.Contains(filtro) || a.solicitante.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.numIncidente == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_Cierre.Value.Equals(busquedaFecha) || a.fecha_Sol.Value.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.status == status && a.tipo.Contains(cbtipo))).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_incidentes_sin_cerrar.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.seguimiento.Contains(filtro) || a.solicitante.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.numIncidente == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_Cierre.Value.Equals(busquedaFecha) || a.fecha_Sol.Value.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.status == status && a.tipo.Contains(cbtipo)) && (a.fecha_Sol >= limiteIn && a.fecha_Sol <= limiteSp)).ToList();
                    }
                }
                else
                {
                    if (limiteIn == null || limiteSp == null)
                    {
                        return dbhelp.modelo.vt_incidentes_cerrados.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.seguimiento.Contains(filtro) || a.solicitante.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.numIncidente == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_Cierre.Value.Equals(busquedaFecha) || a.fecha_Sol.Value.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.status == status && a.tipo.Contains(cbtipo))).ToList();
                    }
                    else
                    {
                        return dbhelp.modelo.vt_incidentes_cerrados.Where(a => (a.acciones.Contains(filtro) || a.descripcion.Contains(filtro) ||
                            a.seguimiento.Contains(filtro) || a.solicitante.Contains(filtro) ||
                            a.soporte.Contains(filtro) || a.numIncidente == numero || a.prioridad.Contains(filtro) ||
                            a.fecha_Cierre.Value.Equals(busquedaFecha) || a.fecha_Sol.Value.Equals(busquedaFecha) ||
                            a.solucion.Contains(filtro)) && (a.status == status && a.tipo.Contains(cbtipo)) && (a.fecha_Sol >= limiteIn && a.fecha_Sol <= limiteSp)).ToList();
                    }
                }
            }
            catch 
            {
                return null;
            }
        }

        public static bool insertarIncidenteCompleto(int solicitante, int soporte, int seguimiento, string descripcion, string acciones, string solucion, int tipo, DateTime feIn, DateTime? feFn, string prioridad, DateTime In, DateTime? Fn)
        {
            try
            {
                var incidente = new tblincidente
                {
                    descripcion = descripcion,
                    solicitante = solicitante,
                    acciones = acciones,
                    solucion = solucion,
                    tipo = tipo,
                    fecha_Sol = feIn,
                    fecha_Cierre = feFn,
                    status = 2,
                    prioridad = prioridad,
                    horaIn = In,
                    horaFn = Fn,
                    soporte = soporte,
                    seguimiento = seguimiento

                };
                if (incidente != null)
                {
                    tblcalidadservicio encuesta = controlEncuestas.insertar(solicitante,dbhelp.modelo.tblincidentes.Max(a => a.numIncidente), null); 
                    if (encuesta!= null)
                    {
                        dbhelp.modelo.tblincidentes.Add(incidente);
                        dbhelp.modelo.tblcalidadservicios.Add(encuesta);
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
               var resultado = dbhelp.modelo.sp_insertar_incidente(descripcion, idSolicitante);
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

        public static bool cambiarStatus(int id, int status)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblincidentes.SingleOrDefault(x => x.numIncidente == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.status = status;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
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
                var ItemAmodificar = dbhelp.modelo.sp_cerrar_incidente(id, acciones, solucion);
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

        public static bool asignarSoporte(int id, int sop, int seg, string prioridad, int tipo)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblincidentes.SingleOrDefault(x => x.numIncidente == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.status = 1;
                    ItemAmodificar.soporte = sop;
                    ItemAmodificar.seguimiento = seg;
                    ItemAmodificar.tipo = tipo;
                    ItemAmodificar.prioridad = prioridad;
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
                return dbhelp.modelo.tblincidentes.Where(a => a.status == 0).Count();
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
                return dbhelp.modelo.tblincidentes.Max(a => a.numIncidente);
            }
            catch
            {
                return 1;
            }
        }

        public static tblincidente obtenerIncidente(int idIncidente)
        {
            try
            {
                return dbhelp.modelo.tblincidentes.SingleOrDefault(a => a.numIncidente == idIncidente);
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
                return dbhelp.modelo.vt_incidentes_cerrados.SingleOrDefault(a => a.numIncidente == idIncidente);
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
                return dbhelp.modelo.tblincidentes.Count(a => a.solicitante == usuario);
            }
            catch{
                return -1;
            }
        }

    }
}
