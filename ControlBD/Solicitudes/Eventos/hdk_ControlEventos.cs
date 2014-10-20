
using HelpDeskWeb.ControlBD.Acceso;
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
    class hdk_ControlEventos
    {
        hdk_ControlAcceso dbHelp;

        public hdk_ControlEventos(hdk_ControlAcceso ca)
        {
            dbHelp = ca;
        }

        public IList cargarTablasSolicitante(int idSol, int status, string filtro, DateTime? FechaInicio, DateTime? FechaFinal)
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
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbHelp.DB.VistaEventosSinCerrars.Where(a => (a.status == status && a.idSolicitante == idSol) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) ||
                                                         a.tipo_evento.Contains(filtro))).ToList();
                    }
                    else
                    {
                        return dbHelp.DB.VistaEventosSinCerrars.Where(a => (a.status == status && a.idSolicitante == idSol && (a.FechaInicio >= FechaInicio && a.FechaInicio <= FechaFinal)) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                           a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||                          
                                           a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro))).ToList();

                    }
                }
                else
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbHelp.DB.VistaEventosCerrados.Where(a => (a.status == status && a.idSolicitante == idSol) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) ||
                                                         a.tipo_evento.Contains(filtro))).ToList();
                    }
                    else
                    {
                        return dbHelp.DB.VistaEventosCerrados.Where(a => (a.status == status && a.idSolicitante == idSol && (a.FechaInicio >= FechaInicio && a.FechaInicio <= FechaFinal)) && (a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                           a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) || a.FechaInicio.Value.Equals(busquedaFecha) ||                         
                                           a.descripcion.Contains(filtro) || a.lugar.Contains(filtro) || a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro))).ToList();

                    }
                }
            }
            catch
            {
                return null;
            }
        }

        public tblevento cargarEvento(int evento)
        {
            try
            {
                return dbHelp.DB.tbleventoes.SingleOrDefault(a => a.idEvento == evento);
            }
            catch
            {
                return null;
            }
        }

        public VistaEventosCerrado cargarEventoCerrado(int evento)
        {
            try
            {
                return dbHelp.DB.VistaEventosCerrados.SingleOrDefault(a => a.idEvento == evento);
            }
            catch
            {
                return null;
            }
        }

        public IList cargarTablasSoporte(int status, string filtro, DateTime? FechaInicio, DateTime? FechaFinal)
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
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbHelp.DB.VistaEventosSinCerrars.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.titulo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia_aprox == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.observaciones.Contains(filtro) ||
                                                         a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro)
                                                         ) && a.status == status).ToList();
                    }
                    else
                    {
                        return dbHelp.DB.VistaEventosSinCerrars.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.titulo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia_aprox == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.observaciones.Contains(filtro) ||
                                                         a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro)
                                                         ) && (a.status == status) && (a.FechaInicio >= FechaInicio && a.FechaInicio <= FechaFinal)).ToList();
                        
                    }
                }
                else
                {
                    if (FechaInicio == null || FechaFinal == null)
                    {
                        return dbHelp.DB.VistaEventosCerrados.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.titulo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia_aprox == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.observaciones.Contains(filtro) ||
                                                         a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro)
                                                         ) && a.status == status).ToList();
                    }
                    else
                    {
                        return dbHelp.DB.VistaEventosCerrados.Where(a => (a.descripcion.Contains(filtro) || a.titulo.Contains(filtro) ||
                                                         a.fecha_Sol.Value.Equals(busquedaFecha) || a.fecha_cierre.Value.Equals(busquedaFecha) ||
                                                         a.FechaInicio.Value.Equals(busquedaFecha) ||
                                                         a.titulo.Contains(filtro) || a.solicitante.Contains(filtro) ||
                                                         a.acomodo.Contains(filtro) || a.apoyo.Contains(filtro) ||
                                                         a.asistencia_aprox == numero || a.descripcion.Contains(filtro) ||
                                                         a.lugar.Contains(filtro) || a.observaciones.Contains(filtro) ||
                                                         a.responsable.Contains(filtro) || a.tipo_evento.Contains(filtro)
                                                         ) && (a.status == status) && (a.FechaInicio >= FechaInicio && a.FechaInicio <= FechaFinal)).ToList();

                    }
                }
            }
            catch
            {
                return null;
            }
        }

        public bool insertarEvento(int? id, string tit, int? lug, string ac, string tipo, DateTime feIn, int? asis, DateTime? In, DateTime? Fn, string desc)
        {       
            try
            {
                   var evento = dbHelp.DB.insertarEvento(tit, lug, ac, asis, In, Fn, desc, tipo, id, feIn);
                   if (evento != 0)
                   {
                       dbHelp.actualizarModelo();
                   }
                   return true; 
            }
            catch
            {    
                return false;
            }
            
        }

        public bool cambiarStatus(int id, int status)
        {
            try
            {
                var ItemAmodificar = dbHelp.DB.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.status = status;
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
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

        public bool cerrarEvento(int id)
        {
            try
            {
                var eventoModificado = dbHelp.DB.cerrarEvento(id);
                if (eventoModificado !=0 )
                {
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
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

        public bool asignarResponsable(int id, int res, int apo)
        {
            try
            {
                var ItemAmodificar = dbHelp.DB.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.status = 1;
                    ItemAmodificar.responsable = res;
                    ItemAmodificar.apoyo = apo;
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool editarEvento(int id, string tit, int lug, string aco, string tipo, DateTime feIn, int asis, DateTime In, DateTime Fn, string desc)
        {
            try
            {
                var ItemAmodificar = dbHelp.DB.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.titulo = tit;
                    ItemAmodificar.descripcion = desc;
                    ItemAmodificar.lugar = lug;
                    ItemAmodificar.acomodo = aco;
                    ItemAmodificar.tipo_evento = tipo;
                    ItemAmodificar.asistencia_aprox = asis;
                    ItemAmodificar.FechaInicio = feIn;
                    ItemAmodificar.horaIn = In;
                    ItemAmodificar.horaFn = Fn;
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
                }
                return true;
            }
            catch 
            {
                return false;
            }
        }

        public bool editarObservaciones(int id, String ob)
        {
            try
            {
                var ItemAmodificar = dbHelp.DB.tbleventoes.SingleOrDefault(x => x.idEvento == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.observaciones = ob;
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public int obtenerUltimoEvento()
        {
            try
            {
                return dbHelp.DB.tbleventoes.Max(a => a.idEvento);
            }
            catch
            {
                return 1;
            }
        }

        public int obtenerNumeroEventos()
        {
            try
            {
                return dbHelp.DB.tbleventoes.Where(a => a.status == 0).Count();
            }
            catch
            {
                return 0;
            }
        }

    }
}
