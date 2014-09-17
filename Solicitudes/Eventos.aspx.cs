using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Solicitudes;
using HelpDeskWeb.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Solicitudes
{
    public partial class Eventos : System.Web.UI.Page
    {
        private hdk_ControlAcceso Control;
        private hdk_ControlEventos controlEventos;
        private hdk_utilerias utilerias;
        private ViewUsuario usuarioConectado;

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioConectado = ((ViewUsuario)(Session["DatosUsuario"]));
            lbelUsuario.Text = " " + usuarioConectado.nomUsuario;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlEventos = new hdk_ControlEventos(Control);
            if (!IsPostBack)
            {
                this.cargarTablas();
            }
        }

        protected void cargarTablas()
        {
            if (usuarioConectado.tipoUsuario == 0)
            {
               gvEventos_Abiertos.DataSource = controlEventos.cargarTablasSoporte(0, txtFiltro.Text, null, null);
               gvEventos_Abiertos.DataBind();
               gvEventos_EnProceso.DataSource = controlEventos.cargarTablasSoporte(1, txtFiltro.Text, null, null);
               gvEventos_EnProceso.DataBind();
               gvEventos_Cerrados.DataSource = controlEventos.cargarTablasSoporte(2, txtFiltro.Text, null, null);
               gvEventos_Cerrados.DataBind();
               gvEventos_Cancelados.DataSource = controlEventos.cargarTablasSoporte(3, txtFiltro.Text, null, null);
               gvEventos_Cancelados.DataBind();
            }
            else
            {

            }
        }

        protected void gvEventos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            utilerias = new hdk_utilerias();
            utilerias.setRowCreated(sender, e);
        }
    }
}