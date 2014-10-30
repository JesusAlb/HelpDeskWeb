
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

        hdk_ControlAcceso dbHelp;

        public hdk_ControlEncuestas(hdk_ControlAcceso ca)
        {
            dbHelp = ca;
        }

        public int obtenerNumeroEncuestasIn(int us){
            try
            {
                return dbHelp.DB.VistaIncidentesCerrados.Where(a => a.idSolicitante == us && a.statusCal_Servicio == false && a.status == 2).Count();
            }
            catch
            {
                return -1;
            }

        }

        public int obtenerNumeroEncuestasEv(int us)
        {
            try
            {
                return dbHelp.DB.VistaEventosCerrados.Where(a => a.idSolicitante == us && a.statusCal_Servicio == false && a.status == 2).Count();
            }
            catch
            {
                return 0;
            }
        }

        public IList cargarTablaPreguntas(int tema)
        {
            try
            {
                return dbHelp.DB.VistaPreguntas.Where(a => a.afinidad == tema || a.afinidad == 2).ToList();
            }
            catch 
            {
                return null;
            }
        }

        public IList cargarTablaEncuesta(int calidad)
        {
            try
            {
                return dbHelp.DB.VistaEncuestas.Where(a => a.idCalidad_Servicio == calidad).ToList();
            }
            catch
            {
                return null;
            }
        }

        public bool insertarRespuesta(int calidad, int preg, int resp){

            try{
                var respuesta =  new tblrespuesta {

                    calidadServicio = calidad,
                    pregunta = preg,
                    valorRespuesta = resp
                    };
                if (respuesta != null)
                {
                    dbHelp.DB.tblrespuestas.Attach(respuesta);
                    dbHelp.DB.tblrespuestas.Add(respuesta);    
                }
                return true;
            } 
            catch
            {
                return false;
            }
        }

        public bool guardarCambiosEncuesta(int idCalidad, string ob, float promedio)
        {      
            try
            {
                var calidadAModificar = dbHelp.DB.tblcalidadservicios.SingleOrDefault(a => a.idCalidad_Servicio == idCalidad);
                if (calidadAModificar != null)
                {
                    calidadAModificar.observacionesServicio = ob;
                    calidadAModificar.statusCal_Servicio = true;
                    calidadAModificar.promedioCalidad = promedio; 
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

        public vistapromediogeneral obtenerPromedioCalidad(int us)
        {
            try
            {
                return dbHelp.DB.vistapromediogenerals.SingleOrDefault(a => a.idUsuario == us);
            }
            catch
            {
                return null;
            }
        }
    
    }
}
