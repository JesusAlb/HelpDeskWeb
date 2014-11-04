using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Administracion
{
    public partial class Equipos : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this, true, 0, 0);
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).username;
            if (!IsPostBack)
            {
                this.cargarTabla();
                this.cargarComboEquipos();
            }

        }

        protected void cargarComboEquipos()
        {
            cbTipoEquipo.DataSource = hdk_ControlTipoEquipo.cargarCombo(0);
            cbTipoEquipo.DataBind();
            cbResponsable.DataSource = hdk_ControlUsuario.cargarComboUsuarios(2);
            cbResponsable.DataBind();
        }

        protected void cargarTabla()
        {
            gvEquipo.DataSource = hdk_ControlEquipos.cargarTabla(txtFiltro.Text);
            gvEquipo.DataBind();
        }

        protected void panelesHabilitados(bool valor)
        {
            Panel[] paneles ={panelCapacidad, panelEquipo, panelMonitor, panelMouse, panelRed, panelTeclado};
            for (int y = 0; y < paneles.Length; y++)
            {
                paneles[y].Enabled = valor;
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.cargarControles();
            Session["Accion"] = 0;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            string discoDuro = txtDD.Text + " "+ cbDD.Text;
            string ram = txtRAM + " GB";
            string procesador = txtProcesador + " GHZ";
            string ip = txtIP1.Text + "." + txtIP2.Text + "." + txtIP3.Text + "." + txtIP4.Text;
            string mac = txtMAC1.Text + "-" + txtMAC2.Text + "-" + txtMAC3.Text + "-" + txtMAC4.Text + "-" + txtMAC5.Text + "-" + txtMAC6.Text;

            if(Convert.ToInt16(Session["Accion"]) == 0)
            {
                hdk_ControlEquipos.insertar(Convert.ToInt32(cbResponsable.SelectedValue), discoDuro, ip, mac, Convert.ToInt32(cbMarcaEquipo.SelectedValue),
                    Convert.ToInt32(cbMarcaMonitor.SelectedValue), Convert.ToInt32(cbMarcaMouse.SelectedValue), Convert.ToInt32(cbMarcaTeclado.SelectedValue),
                    ram, procesador, txtSerieEquipo.Text, txtSerieMonitor.Text, txtSerieMouse.Text, txtSerieTeclado.Text, Convert.ToInt32(cbTipoEquipo.SelectedValue));
            }
            else
            {
                hdk_ControlEquipos.modificar(Convert.ToInt32(gvEquipo.SelectedDataKey), Convert.ToInt32(cbResponsable.SelectedValue), discoDuro, ip, mac, Convert.ToInt32(cbMarcaEquipo.SelectedValue),
                    Convert.ToInt32(cbMarcaMonitor.SelectedValue), Convert.ToInt32(cbMarcaMouse.SelectedValue), Convert.ToInt32(cbMarcaTeclado.SelectedValue),
                    ram, procesador, txtSerieEquipo.Text, txtSerieMonitor.Text, txtSerieMouse.Text, txtSerieTeclado.Text, Convert.ToInt32(cbTipoEquipo.SelectedValue));
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            this.cargarControles();
            lbelTituloModal.Text = "Modificar usuario";
            tblresponsablequipo equipos = hdk_ControlEquipos.obtenerEquipo(Convert.ToInt32(gvEquipo.SelectedDataKey.Value.ToString()));
            cbResponsable.SelectedValue = equipos.responsable.ToString();
            cbTipoEquipo.SelectedValue = equipos.tipoEquipo.ToString();           
            string[]division = equipos.discoDuro.Split(' ');
            txtDD.Text = division[0];
            division = equipos.procesador.Split(' ');
            txtProcesador.Text = division[0];
            division = equipos.memoriaRam.Split(' ');
            txtRAM.Text = division[0];
            cbMarcaEquipo.SelectedValue = equipos.marcaEquipo.ToString();
            txtSerieEquipo.Text = equipos.serieEquipo;
            cbMarcaMonitor.SelectedValue = equipos.marcaMonitor.ToString();
            txtSerieMonitor.Text = equipos.serieMonitor;
            cbMarcaMouse.SelectedValue = equipos.marcaMouse.ToString();
            txtSerieMouse.Text = equipos.serieMouse;
            cbMarcaTeclado.SelectedValue = equipos.marcaTeclado.ToString();
            txtSerieTeclado.Text = equipos.serieTeclado;
            division = equipos.ip.Split('.');
            txtIP1.Text = division[0];
            txtIP2.Text = division[1];
            txtIP3.Text = division[2];
            txtIP4.Text = division[3];
            division = equipos.mac.Split('-');
            txtMAC1.Text = division[0];
            txtMAC2.Text = division[1];
            txtMAC3.Text = division[2];
            txtMAC4.Text = division[3];
            txtMAC5.Text = division[4];
            txtMAC6.Text = division[5];
            Session["Accion"] = 1;

        }

        protected void gvEquipo_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias.setRowCreated(sender, e, this.Page);
        }

        protected void cbTipoEquipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cargarControles();
        }

        protected void cargarControles()
        {
            tbltipoequipo tipoEquipo = hdk_ControlTipoEquipo.obtenerEquipo(Convert.ToInt32(cbTipoEquipo.SelectedValue));
            this.cargarCombosMarcas(new DropDownList[] {cbMarcaEquipo, cbMarcaMonitor, cbMarcaMouse, cbMarcaTeclado }, new bool[] {tipoEquipo.siEquipo, tipoEquipo.siMonitor, tipoEquipo.siMouse, tipoEquipo.siTeclado });
            this.cargarTextBox(new TextBox[] { txtDD, txtProcesador, txtRAM, txtSerieMonitor, txtSerieMouse, txtSerieTeclado }, new bool[] { tipoEquipo.siDiscoDuro, tipoEquipo.siProcesador, tipoEquipo.siRAM, tipoEquipo.siMonitor, tipoEquipo.siMouse, tipoEquipo.siTeclado });
            txtIP1.Enabled = txtIP2.Enabled = txtIP3.Enabled = txtIP4.Enabled = txtMAC1.Enabled = txtMAC2.Enabled = txtMAC3.Enabled = txtMAC4.Enabled = txtMAC5.Enabled = txtMAC6.Enabled = tipoEquipo.siRed;
        }

        protected void cargarCombosMarcas(DropDownList []cb, bool []vbol)
        {
            for(int x = 0; x < cb.Length; x++)
            {
                if (vbol[x])
                {
                    cb[x].DataSource = hdk_ControlMarca.cargarCombo(1);
                    cb[x].DataBind();
                }
                else
                {
                    cb[x].DataSource = hdk_ControlMarca.cargarCombo(0);
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