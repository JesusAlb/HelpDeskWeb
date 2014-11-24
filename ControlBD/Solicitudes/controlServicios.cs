using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HelpDeskWeb.ControlBD.Solicitudes
{
    public class controlServicios
    {
        public static bool insertar(string descripcion, int idsolicitante, int idsoporte, int idapoyo, int estatus, DateTime fecha_solicitud, DateTime? fecha_cierre, DateTime hora_inicial, DateTime? hora_final)
        {
            try
            {
                var servicio = new tblservicio
                {
                    descripcion = descripcion,
                    fk_idusuario_solicitante = idsolicitante,
                    fk_idusuario_soporte = idsoporte,
                    fk_idusuario_apoyo = idapoyo,
                    fk_idestatus = estatus,
                    fecha_solicitud = fecha_solicitud,
                    fecha_cierre = fecha_cierre,
                    hora_inicial = hora_inicial,
                    hora_final = hora_final
                    
                };
                if (servicio != null)
                {
                    dbhelp.modelo.tblservicio.Add(servicio);
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
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static int obtenerUltimoServicio()
        {
            try
            {
                return dbhelp.modelo.tblservicio.Max(a => a.id);
            }
            catch
            {
                return 0;
            }
        }

        public static bool modificarEstatus(int id, int estatus)
        {
            try
            {
                var servicio = dbhelp.modelo.tblservicio.SingleOrDefault(a => a.id == id);

                if (servicio != null)
                {
                    servicio.fk_idestatus = estatus;
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
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static bool modificar(int id, string descripcion, DateTime horaInicial, DateTime horaFinal)
        {
            try
            {
                var servicio = dbhelp.modelo.tblservicio.SingleOrDefault(a => a.id == id);

                if (servicio != null)
                {
                    servicio.descripcion = descripcion;
                    servicio.hora_inicial = horaInicial;
                    servicio.hora_final = horaFinal;
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch
            {
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static tblservicio obtenerServicio(int id)
        {
            try
            {
                return dbhelp.modelo.tblservicio.SingleOrDefault(a => a.id == id);
            }
            catch
            {
                return null;
            }
        }

    }
}