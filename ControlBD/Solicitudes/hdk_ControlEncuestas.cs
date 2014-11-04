
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace HelpDeskWeb.ControlBD.Solicitudes
{
    class hdk_ControlEncuestas
    {

        public static int obtenerNumeroDeEncuestasSinResponderEnIncidentes(int usuario)
        {
            try
            {
                return dbhelp.modelo.VistaIncidentesCerrados.Where(a => a.idSolicitante == usuario && a.statusCal_Servicio == false && a.status == 2).Count();
            }
            catch
            {
                return 0;
            }

        }

        public static int obtenerNumeroDeEncuestasSinResponderEnEventos(int usuario)
        {
            try
            {
                return dbhelp.modelo.VistaEventosCerrados.Where(a => a.idSolicitante == usuario && a.statusCal_Servicio == false && a.status == 2).Count();
            }
            catch
            {
                return 0;
            }
        }

        public static IList cargarTablaPreguntas(int tema)
        {
            try
            {
                return dbhelp.modelo.VistaPreguntas.Where(a => a.afinidad == tema || a.afinidad == 2).ToList();
            }
            catch 
            {
                return null;
            }
        }

        public static IList cargarTablaEncuesta(int calidad)
        {
            try
            {
                return dbhelp.modelo.VistaEncuestas.Where(a => a.idCalidad_Servicio == calidad).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static bool insertarRespuesta(int calidad, int preg, int resp){

            try{
                var respuesta =  new tblrespuesta {

                    calidadServicio = calidad,
                    pregunta = preg,
                    valorRespuesta = resp
                    };
                if (respuesta != null)
                {
                    dbhelp.modelo.tblrespuestas.Attach(respuesta);
                    dbhelp.modelo.tblrespuestas.Add(respuesta);    
                }
                return true;
            } 
            catch
            {
                return false;
            }
        }

        public static bool guardarCambiosEncuesta(int idCalidad, string observacion, float promedio)
        {      
            try
            {
                var calidadAModificar = dbhelp.modelo.tblcalidadservicios.SingleOrDefault(a => a.idCalidad_Servicio == idCalidad);
                if (calidadAModificar != null)
                {
                    calidadAModificar.observacionesServicio = observacion;
                    calidadAModificar.statusCal_Servicio = true;
                    calidadAModificar.promedioCalidad = promedio;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static vistapromediogeneral obtenerPromedioCalidad(int usuario)
        {
            try
            {
                return dbhelp.modelo.vistapromediogenerals.SingleOrDefault(a => a.idUsuario == usuario);
            }
            catch
            {
                return null;
            }
        }
    
    }
}
