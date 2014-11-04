using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlBD.Solicitudes;
using HelpDeskWeb.ControlBD.Solicitudes.Incidentes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb
{
    public partial class solicitante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this, true, 1, 0);
            this.cargarInformacionUsuario();
            this.cargarNumeroDeServicios();
            this.cargarEncuestasSinResponder();
        }

        protected void cargarInformacionUsuario()
        {
            lbelNomUsuario.Text = hdk_ControlUsuario.obtenerUsuarioDeSession(this).nomCompleto;
            lbelInstitucion.Text = hdk_ControlUsuario.obtenerUsuarioDeSession(this).nomInstitucion;
            lbelCargo.Text = hdk_ControlUsuario.obtenerUsuarioDeSession(this).nomPuesto;
        }

        protected void cargarNumeroDeServicios()
        {
            lbelNumeroEventos.Text = hdk_ControlEventos.obtenerNumeroDeEventosSolicitados(hdk_ControlUsuario.obtenerUsuarioDeSession(this).idUsuario).ToString();
            lbelNumeroIncidentes.Text = hdk_ControlIncidentes.obtenerNumeroDeIncidentesSolicitados(hdk_ControlUsuario.obtenerUsuarioDeSession(this).idUsuario).ToString();
        }

        protected void cargarEncuestasSinResponder()
        {
            this.pintarNumeroDeSucesos(lbelNumEventos, hdk_ControlEncuestas.obtenerNumeroDeEncuestasSinResponderEnEventos(hdk_ControlUsuario.obtenerUsuarioDeSession(this).idUsuario));
            this.pintarNumeroDeSucesos(lbelNumIncidentes, hdk_ControlEncuestas.obtenerNumeroDeEncuestasSinResponderEnIncidentes(hdk_ControlUsuario.obtenerUsuarioDeSession(this).idUsuario));
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
    }
}