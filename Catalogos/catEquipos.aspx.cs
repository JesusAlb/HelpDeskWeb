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
        hdk_ControlMarca controlMarcas;
        private int tabItemIndex;

         
        protected void Page_Load(object sender, EventArgs e)
        {
            lbelUsuario.Text =" " + ((ViewUsuario)(Session["DatosUsuario"])).nomUsuario;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlTipoEquipo = new hdk_ControlTipoEquipo(Control);
            controlMarcas  = new hdk_ControlMarca(Control);
            if (IsPostBack)
            {
                if (panelCarTipoEquipo.Visible)
                {
                    tabItemIndex = 0;
                }
                else
                {
                    tabItemIndex = 1;
                }
            }
            this.cargarTablas();
       }

        protected void cargarTablas()
        {
            if (tabItemIndex == 0)
            {
                gvTipoEquipos.DataSource = Control.DB.tbltipoequipoes.Where(a => a.nomTipoEquipo.Contains(txtFiltro.Text)).ToList();
                gvTipoEquipos.DataBind();
            }
            else
            {
                BoundField bf = new BoundField();
                bf.HeaderText = "Marca";
                bf.DataField = "nomMarca";
                gvTipoEquipos.Columns.Add(bf);
                gvTipoEquipos.Columns.RemoveAt(0);
                string[] keys = { "idMarca" };
                gvTipoEquipos.DataKeyNames = keys;
                gvTipoEquipos.DataSource = controlMarcas.cargarTabla(txtFiltro.Text);
                gvTipoEquipos.DataBind();
                
            }
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
            bool insert = false;

            if (tabItemIndex == 0)
            {
                if (btnGrabarTipo.Text.Equals("Grabar"))
                {
                    if (controlTipoEquipo.insertar(txtNombre.Text, chEquipo.Checked, chDiscoD.Checked, chRed.Checked, chMonitor.Checked, chMouse.Checked, chTeclado.Checked, chRAM.Checked, chProcesador.Checked))
                    {
                        insert = true;
                    }
                }
                else
                {
                    int elementoEquipo = Convert.ToInt32(gvTipoEquipos.SelectedDataKey.Value.ToString());
                    if (controlTipoEquipo.modificar(elementoEquipo,txtNombre.Text, chEquipo.Checked, chDiscoD.Checked, chRed.Checked, chMonitor.Checked, chMouse.Checked, chTeclado.Checked, chRAM.Checked, chProcesador.Checked))
                    {
                        insert = true;
                    }
                }

                if (insert)
                {
                    txtNombre.Text = "";
                    chDiscoD.Checked = chTeclado.Checked = chRed.Checked = chMouse.Checked = chMonitor.Checked = chRAM.Checked = chProcesador.Checked = false;
                    cargarTablas();
                    gvTipoEquipos.SelectedIndex = -1;
                }
            }
            else
            {
                if (btnGrabarTipo.Text.Equals("Grabar"))
                {
                    if (controlMarcas.insertar(txtNombre.Text))
                    {
                        insert = true;
                    }
                }
                else
                {
                    int idMarca = Convert.ToInt32(gvTipoEquipos.SelectedDataKey.Value.ToString());
                    if (controlMarcas.modificar(idMarca, txtNombre.Text))
                    {
                        insert = true;
                    }
                }

                if (insert)
                {
                    txtNombre.Text = "";
                    cargarTablas();
                }
            }
            
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            this.cargarTablas();
            txtFiltro.Focus();
        }

        protected void gvTipoEquipos_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                btnGrabarTipo.Text = "Modificar";
                int elementoEquipo = Convert.ToInt32(gvTipoEquipos.SelectedDataKey.Value.ToString());

                if (tabItemIndex == 0)
                {
                    lbelAccion.Text = "Modificación de tipo de equipos";
                    tbltipoequipo equipo = controlTipoEquipo.obtenerEquipo(elementoEquipo);
                    txtNombre.Text = equipo.nomTipoEquipo;
                    chDiscoD.Checked = equipo.siDiscoDuro;
                    chRAM.Checked = equipo.siRAM;
                    chRed.Checked = equipo.siRed;
                    chTeclado.Checked = equipo.siTeclado;
                    chProcesador.Checked = equipo.siProcesador;
                    chMonitor.Checked = equipo.siMonitor;
                    chMouse.Checked = equipo.siMouse;
                }
                else
                {
                    lbelAccion.Text = "Modificación de marcas";
                    tblmarca marca = Control.DB.tblmarcas.SingleOrDefault(a => a.idMarca == elementoEquipo);
                    txtNombre.Text = marca.nomMarca;
                }
            }
            catch
            {

            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            txtNombre.Text = "";
            btnGrabarTipo.Text = "Grabar";
            gvTipoEquipos.SelectedIndex = -1;
            if (tabItemIndex == 0)
            {
                lbelAccion.Text = "Alta de tipo de equipos";
                chTodos.Checked = false;
                chTodos_CheckedChanged(sender, e);                               
            }
            else
            {
                lbelAccion.Text = "Alta de marcas";               
            }
            
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

        protected void btnMarcas_Click(object sender, EventArgs e)
        {
            btnTipoEquipos.CssClass = "btn btn-default";           
            btnMarcas.CssClass = "btn btn-primary active";
            lbelAccion.Text = "Alta de marcas"; 
            renglon.Height = 100;
            tabItemIndex = 1;
            this.cargarTablas();
            panelCarTipoEquipo.Visible = false;
        }

    }
}