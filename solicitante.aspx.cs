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
            Utilerias.checarSession(this, true, 1, 0);
            this.cargarInformacionUsuario();
            this.cargarNumeroDeServicios();
            this.cargarEncuestasSinResponder();
        }

        protected void cargarInformacionUsuario()
        {
            lbelNomUsuario.Text = controlUsuario.obtenerUsuarioDeSession(this).nom_completo;
            lbelInstitucion.Text = controlUsuario.obtenerUsuarioDeSession(this).nom_institucion;
            lbelCargo.Text = controlUsuario.obtenerUsuarioDeSession(this).nom_puesto;
        }

        protected void cargarNumeroDeServicios()
        {
            lbelNumeroEventos.Text = controlEventos.obtenerNumeroDeEventosSolicitados(controlUsuario.obtenerUsuarioDeSession(this).id).ToString();
            lbelNumeroIncidentes.Text = controlIncidentes.obtenerNumeroDeIncidentesSolicitados(controlUsuario.obtenerUsuarioDeSession(this).id).ToString();
        }

        protected void cargarEncuestasSinResponder()
        {
            this.pintarNumeroDeSucesos(lbelNumEventos, controlEncuestas.obtenerNumeroDeEncuestasSinResponderEnEventos(controlUsuario.obtenerUsuarioDeSession(this).id));
            this.pintarNumeroDeSucesos(lbelNumIncidentes, controlEncuestas.obtenerNumeroDeEncuestasSinResponderEnIncidentes(controlUsuario.obtenerUsuarioDeSession(this).id));
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