using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelpDeskWeb.Modelo;
using HelpDeskWeb.Control.Catalogo;
using HelpDeskWeb.Control.Acceso;
using System.Drawing;
using System.Collections;

namespace HelpDeskWeb.Catalogos
{
    public partial class catEquipos : System.Web.UI.Page
    {
        hdk_ControlTipoEquipo controlTipoEquipo;
        hdk_ControlAcceso Control;


        protected void Page_Load(object sender, EventArgs e)
        {
            lbelUsuario.Text =" " + ((ViewUsuario)(Session["DatosUsuario"])).nomUsuario;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlTipoEquipo = new hdk_ControlTipoEquipo(Control);
            this.cargarTablas();
       }

        protected void cargarTablas()
        {
            gvTipoEquipos.DataSource = controlTipoEquipo.cargarTabla(txtFiltro.Text);
            gvTipoEquipos.DataBind();
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

        protected void btnGrabarTipo_Click(object sender, EventArgs e)
        {
            if (btnGrabarTipo.Text.Equals("Grabar"))
            {
                if (controlTipoEquipo.insertar(txtNombre.Text, chEquipo.Checked, chDiscoD.Checked, chRed.Checked, chMonitor.Checked, chMouse.Checked, chTeclado.Checked, chRAM.Checked, chProcesador.Checked))
                {
                    txtNombre.Text = "";
                    chDiscoD.Checked = chTeclado.Checked = chRed.Checked = chMouse.Checked = chMonitor.Checked = chRAM.Checked = chProcesador.Checked = false;
                    cargarTablas();
                }
            }
            else
            {

            }
            
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            gvTipoEquipos.DataSource = controlTipoEquipo.cargarTabla((sender as TextBox).Text);
            gvTipoEquipos.DataBind();
            txtFiltro.Focus();
        }

        protected void gvTipoEquipos_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                lbelAccion.Text = "Modificación de tipo de equipos";
                btnGrabarTipo.Text = "Modificar";
                int TipoEquipos = Convert.ToInt32(gvTipoEquipos.SelectedDataKey.Value.ToString());
                tbltipoequipo equipo = Control.DB.tbltipoequipoes.SingleOrDefault(a => a.idTipoEquipo == TipoEquipos);
                txtNombre.Text = equipo.nomTipoEquipo;
                chDiscoD.Checked = equipo.siDiscoDuro;
                chRAM.Checked = equipo.siRAM;
                chRed.Checked = equipo.siRed;
                chTeclado.Checked = equipo.siTeclado;
                chProcesador.Checked = equipo.siProcesador;
                chMonitor.Checked = equipo.siMonitor;
                chMouse.Checked = equipo.siMouse;
            }
            catch
            {

            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            lbelAccion.Text = "Alta de tipo de equipos";
            txtNombre.Text = "";
            chTodos.Checked = false;
            chTodos_CheckedChanged(sender, e);
            btnGrabarTipo.Text = "Grabar";
            gvTipoEquipos.SelectedIndex = -1;
            

        }

        protected void gvTipoEquipos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow) {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='none';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.ToolTip = "Click para seleccionar el renglon";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvTipoEquipos, "Select$" + e.Row.RowIndex);
            }
        }

    }
}