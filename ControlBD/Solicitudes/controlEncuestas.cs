
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
    class controlEncuestas
    {
        public static tblcalidadservicio insertar(int solicitante, int? idIncidente, int? idEvento){
            try
            {
                var encuesta = new tblcalidadservicio { incidente = idIncidente, observacionesServicio = "Sin observaciones", promedioCalidad = 0, statusCal_Servicio = false, usuario_calificado = solicitante, evento = idEvento };
                if (encuesta != null)
                {                  
                    return encuesta;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                return null;
            }
        }

        public static int obtenerNumeroDeEncuestasSinResponderEnIncidentes(int usuario)
        {
            try
            {
                return dbhelp.modelo.vt_incidentes_cerrados.Where(a => a.idSolicitante == usuario && a.statusCal_Servicio == false && a.status == 2).Count();
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
                return dbhelp.modelo.vt_eventos_cerrados.Where(a => a.idSolicitante == usuario && a.statusCal_Servicio == false && a.status == 2).Count();
            }
            catch
            {
                return 0;
            }
        }

        public static IList<vt_preguntas> obtenerDataSourcePreguntas(int tema)
        {
            try
            {
                return dbhelp.modelo.vt_preguntas.Where(a => a.afinidad == tema || a.afinidad == 2).ToList();
            }
            catch 
            {
                return null;
            }
        }

        public static IList<vt_encuestas> obtenerDataSourceEncuesta(int idEncuesta)
        {
            try
            {
                return dbhelp.modelo.vt_encuestas.Where(a => a.idCalidad_Servicio == idEncuesta).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static bool insertarRespuesta(int calidad, int pregunta, int respuesta){

            try{
                var respuestaAñadida =  new tblrespuesta {

                    calidadServicio = calidad,
                    pregunta = pregunta,
                    valorRespuesta = respuesta
                    };
                if (respuestaAñadida != null)
                {
                    dbhelp.modelo.tblrespuestas.Attach(respuestaAñadida);
                    dbhelp.modelo.tblrespuestas.Add(respuestaAñadida);    
                }
                return true;
            } 
            catch
            {
                return false;
            }
        }

        public static bool SaveChangesEncuesta(int idCalidad, string observacion, float promedio)
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

        public static vt_promedio_general obtenerPromedioCalidad(int usuario)
        {
            try
            {
                return dbhelp.modelo.vt_promedio_general.SingleOrDefault(a => a.idUsuario == usuario);
            }
            catch
            {
                return null;
            }
        }
    
    }
}
