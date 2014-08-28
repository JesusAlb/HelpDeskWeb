using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelpDeskWeb.Modelo;
using HelpDeskWeb.Control.Catalogo;
using HelpDeskWeb.Control.Acceso;

namespace HelpDeskWeb.Catalogos
{
    public partial class catEquipos : System.Web.UI.Page
    {
        hdk_ControlTipoEquipo controlTipoEquipo;

        protected void Page_Load(object sender, EventArgs e)
        {
            lbelUsuario.Text =" " + ((ViewUsuario)(Session["DatosUsuario"])).nomUsuario;
            controlTipoEquipo = new hdk_ControlTipoEquipo((hdk_ControlAcceso)Session["Conexion"]);
            this.cargarTablas();
            
        }

        protected void cargarTablas()
        {
            dgTipoEquipos.DataSource = controlTipoEquipo.cargarTabla("");
            dgTipoEquipos.DataBind();
        }

        protected void chTodos_CheckedChanged(object sender, EventArgs e)
        {
            if (chTodos.Checked)
            {
                chDiscoD.Checked = chTeclado.Checked = chRed.Checked = chMouse.Checked = chMonitor.Checked = chRAM.Checked = chProcesador.Checked = true;
            }
            else
            {
                chDiscoD.Checked = chTeclado.Checked = chRed.Checked = chMouse.Checked = chMonitor.Checked = chRAM.Checked = chProcesador.Checked = false;
            }
        }
    }
}