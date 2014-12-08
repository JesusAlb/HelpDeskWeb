
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
        public static bool insertar(int idservicio){
            try
            {
                var encuesta = new tblcalidadservicio { fk_idservicio = idservicio, observaciones = "Sin observaciones", promedio = 0, estatus = false };
                if (encuesta != null)
                {
                    dbhelp.modelo.tblcalidadservicio.Add(encuesta);
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

        public static int obtenerNumeroDeEncuestasSinResponderEnIncidentes(int usuario)
        {
            try
            {
                return dbhelp.modelo.vt_incidentes_cerrados.AsNoTracking().Where(a => a.fk_idusuario_solicitante == usuario && a.estatus_calidad == false && a.estatus_incidente == 2).Count();
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
                return dbhelp.modelo.vt_eventos_cerrados.AsNoTracking().Where(a => a.idsolicitante == usuario && a.estatus_calidad == false && a.estatus_evento == 2).Count();
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
                return dbhelp.modelo.vt_preguntas.Where(a=>a.estatus == true).ToList();
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
                return dbhelp.modelo.vt_encuestas.Where(a => a.idcalidad == idEncuesta).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static bool insertarRespuesta(int calidad, int pregunta, int respuesta){

            try{
                var respuestaAñadida =  new tblrespuesta {

                    fk_idcalidad = calidad,
                    fk_idpregunta = pregunta,
                    valor = respuesta
                    };
                if (respuestaAñadida != null)
                {
                    dbhelp.modelo.tblrespuesta.Attach(respuestaAñadida);
                    dbhelp.modelo.tblrespuesta.Add(respuestaAñadida);    
                }
                return true;
            } 
            catch
            {
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static bool SaveChangesEncuesta(int idCalidad, string observacion, float promedio)
        {      
            try
            {
                var calidadAModificar = dbhelp.modelo.tblcalidadservicio.SingleOrDefault(a => a.id == idCalidad);
                if (calidadAModificar != null)
                {
                    calidadAModificar.observaciones = observacion;
                    calidadAModificar.estatus = true;
                    calidadAModificar.promedio = promedio;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static tblcalidadservicio obtenerCalidadServicio(int idservicio)
        {
            try 
            {
               return dbhelp.modelo.tblcalidadservicio.SingleOrDefault(a => a.fk_idservicio == idservicio);
            }
            catch
            {
                return null;
            }
        }

        public static vt_promedio_general obtenerPromedioCalidad(int usuario)
        {
            try
            {
                return dbhelp.modelo.vt_promedio_general.AsNoTracking().SingleOrDefault(a => a.id == usuario);
            }
            catch
            {
                return null;
            }
        }
    
    }
}
