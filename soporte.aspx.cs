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
        ViewUsuario usuarioConectado;
        hdk_ControlAcceso Control;
        hdk_ControlIncidentes controlIncidentes;
        hdk_ControlEventos controlEventos;
        hdk_ControlEncuestas controlEncuestas;

        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this, true, 0, 0);
            usuarioConectado = (ViewUsuario)(Session["DatosUsuario"]);
            lbelNomUsuario.Text = usuarioConectado.nomCompleto;
            lbelCargo.Text = usuarioConectado.nomPuesto;
            lbelInstitucion.Text = usuarioConectado.nomInstitucion;
           // lbelTipoUsuario.Text = usuarioConectado.tipoUsuarioString;
            if (!IsPostBack)
            {
                this.pintarCalificaciones();
                this.obtenerNumeroDeSucesos();
            }
        }

        protected void pintarCalificaciones()
        {
            vistapromediogeneral promedioCalidad = hdk_ControlEncuestas.obtenerPromedioCalidad(usuarioConectado.idUsuario);
            if (promedioCalidad.PromedioTotal == null)
            {
                lbelCalificacionEventos.Text = "S/C";
                lbelCalificacionIncidentes.Text = "S/C";
                lbelPromedioGeneral.Text = "S/C";
                this.pintarMedalla(null);
            }
            else
            {
                lbelPromedioGeneral.Text = Math.Round(promedioCalidad.PromedioTotal.Value, 2).ToString();
                this.pintarMedalla(promedioCalidad.posicion.Value.ToString());

                if (promedioCalidad.promedioEventos == null)
                {
                    lbelCalificacionEventos.Text = "S/C";
                    lbelCalificacionIncidentes.Text = Math.Round(promedioCalidad.promedioIncidente.Value, 2).ToString();
                }
                else
                {
                    lbelCalificacionEventos.Text = Math.Round(promedioCalidad.promedioEventos.Value, 2).ToString();

                    if (promedioCalidad.promedioIncidente == null)
                    {
                        lbelCalificacionIncidentes.Text = "S/C";
                    }
                    else
                    {
                        lbelCalificacionIncidentes.Text = Math.Round(promedioCalidad.promedioIncidente.Value, 2).ToString();
                    }
                }

            }  
        }

        protected void obtenerNumeroDeSucesos()
        {
            this.pintarNumeroDeSucesos(lbelNumIncidentes, hdk_ControlIncidentes.obtenerNumeroIncidentes());
            this.pintarNumeroDeSucesos(lbelNumEventos, hdk_ControlEventos.obtenerNumeroEventos());
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
    }
}