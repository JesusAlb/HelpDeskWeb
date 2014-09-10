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
        private hdk_utilerias utilerias;

        protected void Page_Load(object sender, EventArgs e)
        {
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).nomUsuario;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlEquipos = new hdk_ControlEquipos(Control);
            controlTEquipos = new hdk_ControlTipoEquipo(Control);
            controlMarca = new hdk_ControlMarca(Control);
            controlUsuario = new hdk_ControlUsuario(Control);
            utilerias = new hdk_utilerias();

            if (!IsPostBack)
            {
                this.cargarTabla();
                this.cargarComboEquipos();
            }

        }

        protected void cargarComboEquipos()
        {
            cbTipoEquipo.DataSource = controlTEquipos.cargarCombo();
            cbTipoEquipo.DataBind();
            cbMarcaEquipo.DataSource = controlMarca.cargarCombo(1);
            cbMarcaEquipo.DataBind();
            cbResponsable.DataSource = controlUsuario.cargarComboUsuarios(2);
            cbResponsable.DataBind();


        }

        protected void cargarTabla()
        {
            gvEquipo.DataSource = controlEquipos.cargarTabla(txtFiltro.Text);
            gvEquipo.DataBind();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            object[] controlesSucios = {txtSerieTeclado, txtSerieMouse, txtSerieMonitor, txtSerieEquipo, txtRAM, txtProcesador, txtMAC6, txtMAC5, txtMAC4, txtMAC3, txtMAC2,
                                       txtMAC1,txtIP4,txtIP3,txtIP2,txtIP1,txtDD, cbMarcaEquipo,cbMarcaMonitor,cbMarcaMouse,cbMarcaTeclado,cbResponsable,cbTipoEquipo};
            utilerias.limpiarControles(controlesSucios);
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

        protected void cbTipoEquipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbltipoequipo tipoEquipo = controlTEquipos.obtenerEquipo(Convert.ToInt32(cbTipoEquipo.SelectedValue));
            this.cargarCombosMarcas( new DropDownList[]{cbMarcaMonitor, cbMarcaMouse, cbMarcaTeclado}, new bool[]{tipoEquipo.siMonitor, tipoEquipo.siMouse, tipoEquipo.siTeclado});
            this.cargarTextBox(new TextBox[] {txtDD, txtProcesador, txtRAM, txtSerieMonitor, txtSerieMouse, txtSerieTeclado}, new bool[] {tipoEquipo.siDiscoDuro, tipoEquipo.siProcesador, tipoEquipo.siRAM, tipoEquipo.siMonitor, tipoEquipo.siMouse, tipoEquipo.siTeclado });
            txtIP1.Enabled = txtIP2.Enabled = txtIP3.Enabled = txtIP4.Enabled = txtMAC1.Enabled = txtMAC2.Enabled = txtMAC3.Enabled = txtMAC4.Enabled = txtMAC5.Enabled = txtMAC6.Enabled = tipoEquipo.siRed;
        }

        protected void cargarCombosMarcas(DropDownList []cb, bool []vbol)
        {
            for (int x = 0; x < cb.Length; x++)
            {
                if (vbol[x])
                {
                    cb[x].DataSource = controlMarca.cargarCombo(1);
                    cb[x].DataBind();
                }
                else
                {
                    cb[x].DataSource = controlMarca.cargarCombo(0);
                    cb[x].DataBind();
                    cb[x].SelectedItem.Text = "N/A";
                }
                cb[x].Enabled = vbol[x];
            }            
        }

        protected void cargarTextBox(TextBox[] txt, bool[] vbol)
        {
            for (int x = 0; x < txt.Length; x++)
            {
                if (vbol[x])
                {
                    txt[x].Text = "";
                }
                else
                {
                    txt[x].Text = "N/A";
                }
                txt[x].Enabled = vbol[x];
            }
            
        }


    }
}