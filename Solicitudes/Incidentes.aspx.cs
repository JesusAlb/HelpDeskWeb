using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Solicitudes.Incidentes;
using HelpDeskWeb.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Solicitudes
{
    public partial class Incidentes : System.Web.UI.Page
    {
        private hdk_ControlAcceso Control;
        private hdk_ControlIncidentes controlIncidentes;
        private hdk_utilerias utilerias;
        private ViewUsuario usuarioConectado;

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioConectado = ((ViewUsuario)(Session["DatosUsuario"]));
            lbelUsuario.Text = " " + usuarioConectado.nomUsuario;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlIncidentes = new hdk_ControlIncidentes(Control);
            if (!IsPostBack)
            {
                this.cargarTablas();
            }

        }

        protected void cargarTablas()
        {
            if(usuarioConectado.tipoUsuario == 0){
                gvIncidentes_Abiertos.DataSource = controlIncidentes.cargarTablaSoporte(0, "", txtFiltro.Text, null, null);
                gvIncidentes_Abiertos.DataBind();
                gvIncidentes_EnProceso.DataSource = controlIncidentes.cargarTablaSoporte(1, "", txtFiltro.Text, null, null);
                gvIncidentes_EnProceso.DataBind();
                gvIncidentes_Cerrados.DataSource = controlIncidentes.cargarTablaSoporte(2, "", txtFiltro.Text, null, null);
                gvIncidentes_Cerrados.DataBind();
                gvIncidentes_Cancelados.DataSource = controlIncidentes.cargarTablaSoporte(3, "", txtFiltro.Text, null, null);
                gvIncidentes_Cancelados.DataBind();
            }else{

            }
            
        }

        protected void gvIncidentes_RowCreated(object sender, GridViewRowEventArgs e)
        {
            utilerias = new hdk_utilerias();
            utilerias.setRowCreated(sender, e);
        }

    }
}