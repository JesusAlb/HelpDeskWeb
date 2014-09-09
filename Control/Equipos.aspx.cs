using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Control
{
    public partial class Equipos : System.Web.UI.Page
    {
        private hdk_ControlEquipos controlEquipos;
        private hdk_ControlTipoEquipo controlTEquipos;
        private hdk_ControlMarca controlMarca;
        private hdk_ControlUsuario controlUsuario;
        private hdk_ControlAcceso Control;

        protected void Page_Load(object sender, EventArgs e)
        {
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).nomUsuario;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlEquipos = new hdk_ControlEquipos(Control);
            controlTEquipos = new hdk_ControlTipoEquipo(Control);
            controlMarca = new hdk_ControlMarca(Control);
            controlUsuario = new hdk_ControlUsuario(Control);

            if (!IsPostBack)
            {
                cargarTabla();
            }

        }

        protected void cargarCombos()
        {

        }

        protected void cargarTabla()
        {
            gvEquipo.DataSource = controlEquipos.cargarTabla(txtFiltro.Text);
            gvEquipo.DataBind();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
          
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void gvEquipo_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias utilerias = new hdk_utilerias();
            utilerias.setRowCreated(sender, e);
        }



    }
}