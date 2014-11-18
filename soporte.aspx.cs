using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.EntityFrameWork;
using HelpDeskWeb.ControlBD.Solicitudes.Incidentes;
using HelpDeskWeb.ControlBD.Solicitudes;

namespace HelpDeskWeb
{
    public partial class principal : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this, true, 0, 0);
            lbelNomUsuario.Text = controlUsuario.obtenerUsuarioDeSession(this).nom_completo;
            lbelCargo.Text = controlUsuario.obtenerUsuarioDeSession(this).nom_puesto;
            lbelInstitucion.Text = controlUsuario.obtenerUsuarioDeSession(this).nom_institucion;
            this.pintarCalificaciones();
            this.obtenerNumeroDeSucesos();
            
        }

        protected void pintarCalificaciones()
        {
            vt_promedio_general promedioCalidad = controlEncuestas.obtenerPromedioCalidad(controlUsuario.obtenerUsuarioDeSession(this).id);
            if (promedioCalidad == null)
            {
                lbelCalificacionEventos.Text = "S/C";
                lbelCalificacionIncidentes.Text = "S/C";
                lbelPromedioGeneral.Text = "S/C";
                this.pintarMedalla(null);
            }
            else
            {
                lbelPromedioGeneral.Text = Math.Round(promedioCalidad.promedioTotal.Value, 2).ToString();
                this.pintarMedalla(promedioCalidad.posicion.Value.ToString());

                if (promedioCalidad.promedio_evento == null)
                {
                    lbelCalificacionEventos.Text = "S/C";
                    lbelCalificacionIncidentes.Text = Math.Round(promedioCalidad.promedio_incidente.Value, 2).ToString();
                }
                else
                {
                    lbelCalificacionEventos.Text = Math.Round(promedioCalidad.promedio_evento.Value, 2).ToString();

                    if (promedioCalidad.promedio_incidente == null)
                    {
                        lbelCalificacionIncidentes.Text = "S/C";
                    }
                    else
                    {
                        lbelCalificacionIncidentes.Text = Math.Round(promedioCalidad.promedio_incidente.Value, 2).ToString();
                    }
                }

            }  
        }

        protected void obtenerNumeroDeSucesos()
        {
            this.pintarNumeroDeSucesos(lbelNumIncidentes, controlIncidentes.obtenerNumeroIncidentes());
            this.pintarNumeroDeSucesos(lbelNumEventos, controlEventos.obtenerNumeroEventosAbiertos());
        }

        protected void pintarNumeroDeSucesos(Label label, int numero)
        {
            if (numero > 0)
            {
                label.ForeColor = System.Drawing.ColorTranslator.FromHtml("#d43f3a");
            }
            else
            {
                label.ForeColor = System.Drawing.ColorTranslator.FromHtml("Green");
            }
            label.Text = numero.ToString();
        }

        protected void pintarMedalla(string posicion)
        {
            switch (posicion)
            {
                case "1":
                    panelMedalla.BackImageUrl = "Imagenes/medalla1.png";
                    break;

                case "2":
                    panelMedalla.BackImageUrl = "Imagenes/medalla2.png";
                    break;

                case "3":
                    panelMedalla.BackImageUrl = "Imagenes/medalla3.png";
                    break;

                case null:
                    lbelPosicion.Text = "S/P";
                    panelMedalla.BackImageUrl = "Imagenes/medallaN.png";
                    break;

                default:
                    lbelPosicion.Text = posicion.ToString();
                    panelMedalla.BackImageUrl = "Imagenes/medallaN.png";
                    break;
            }
        }

        protected void timerIncidentes_Tick(object sender, EventArgs e)
        {
            this.obtenerNumeroDeSucesos();
        }
    }
}