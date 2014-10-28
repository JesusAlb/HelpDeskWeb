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
            if (Session["DatosUsuario"] == null)
            {
                Response.Redirect("index.aspx");
            }
            usuarioConectado = (ViewUsuario)(Session["DatosUsuario"]);
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlIncidentes = new hdk_ControlIncidentes(Control);
            controlEventos = new hdk_ControlEventos(Control);
            lbelNomUsuario.Text = usuarioConectado.nomCompleto;
            lbelCargo.Text = usuarioConectado.nomPuesto;
            lbelInstitucion.Text = usuarioConectado.nomInstitucion;
           // lbelTipoUsuario.Text = usuarioConectado.tipoUsuarioString;
            controlEncuestas = new hdk_ControlEncuestas(Control);
            if (!IsPostBack)
            {
                this.obtenerCalificaciones();
                this.obtenerNumeroDeSucesos();
            }
        }

        protected void obtenerCalificaciones()
        {
            double total = 0d;
            int contador = 0;

            double? promedioIncidentes = controlEncuestas.obtenterPromedioCalidadEnIncidentes(usuarioConectado.idUsuario);
            if (promedioIncidentes != null)
            {
                total = promedioIncidentes.Value;
                contador++;
                lbelCalificacionIncidentes.Text = promedioIncidentes.ToString();
            }
            else
            {
                lbelCalificacionIncidentes.Text = "S/C";
            }

            double? promedioEventos = controlEncuestas.obtenterPromedioCalidadEnEventos(usuarioConectado.idUsuario);

            if (promedioEventos != null)
            {
                total = promedioEventos.Value + total;
                contador++;
                lbelCalificacionEventos.Text = promedioEventos.ToString();
            }
            else
            {
                lbelCalificacionEventos.Text = "S/C";
            }

            if (contador > 0)
            {
                lbelPromedioGeneral.Text = Math.Round((total / contador), 2).ToString();
            }
            else
            {
                lbelPromedioGeneral.Text = "S/C";
            }
        }

        protected void obtenerNumeroDeSucesos()
        {
            this.pintarNumeroDeSucesos(lbelNumIncidentes, controlIncidentes.obtenerNumeroIncidentes());
            this.pintarNumeroDeSucesos(lbelNumEventos, controlEventos.obtenerNumeroEventos());
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