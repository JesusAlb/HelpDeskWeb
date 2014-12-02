using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Administracion
{
    public partial class Equipos : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Utilerias.checarSession(this, true, 0, 0);
            lbelUsuario.Text = " " + controlUsuario.obtenerUsuarioDeSession(this).nombre_usuario;
            if (!Page.IsPostBack)
            {
                this.cargarTabla();
                this.cargarComboEquipos();
            }
            else
            {
                if (Request["__EVENTTARGET"] == "txtFiltro")
                    this.cargarTabla();
            }

        }

        protected void cargarComboEquipos()
        {
            cbTipoEquipo.DataSource = controlTipoEquipo.obtenerDataSource("");
            cbTipoEquipo.DataBind();
            cbResponsable.DataSource = controlUsuario.dataSourceComboBox(2);
            cbResponsable.DataBind();
        }

        protected void cargarTabla()
        {
            gvEquipo.DataSource = controlEquipos.obtenerDataSource(txtFiltro.Text);
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

     /*   protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.cargarControles();
            Session["Accion"] = 0;
        }*/

        protected void btnAccionarModal_Command(object sender, CommandEventArgs e)
        {
            btnGrabar.CommandName = e.CommandName;
            this.cargarControles();

            switch (e.CommandName)
            {

                case "nuevo":
                    Utilerias.limpiarControles(this.ModalContenido.Controls);
                    this.cargarControles();
                    ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "abrirModal", "$('#ModalNuevo').modal('show');", true);
                    break;

                case "editar":
                    if (gvEquipo.SelectedIndex != -1)
                    {
                        lbelTituloModal.Text = "Modificar usuario";
                        tblequipoasignado equipos = controlEquipos.obtenerEquipo(Convert.ToInt32(gvEquipo.SelectedDataKey.Value.ToString()));
                        cbResponsable.SelectedValue = equipos.fk_idusuario_responsable.ToString();
                        cbTipoEquipo.SelectedValue = equipos.fk_tipoequipo.ToString();
                        this.cargarControles();
                        string[] division = equipos.disco_duro.Split(' ');
                        txtDD.Text = division[0];
                        division = equipos.procesador.Split(' ');
                        txtProcesador.Text = division[0];
                        division = equipos.ram.Split(' ');
                        txtRAM.Text = division[0];
                        cbMarcaEquipo.SelectedValue = equipos.fk_idmarca_equipo.ToString();
                        txtSerieEquipo.Text = equipos.serie_equipo;
                        cbMarcaMonitor.SelectedValue = equipos.fk_idmarca_monitor.ToString();
                        txtSerieMonitor.Text = equipos.serie_monitor;
                        cbMarcaMouse.SelectedValue = equipos.fk_idmarca_mouse.ToString();
                        txtSerieMouse.Text = equipos.serie_mouse;
                        cbMarcaTeclado.SelectedValue = equipos.fk_idmarca_teclado.ToString();
                        txtSerieTeclado.Text = equipos.serie_teclado;

                        if (txtIP1.Enabled)
                        {
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
                        }
                        ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "abrirModal", "$('#ModalNuevo').modal('show');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "NoSeleccionado", "alertify.error('Seleccione al usuario')", true);
                    }
                    break;
            }
        }

        protected void btnGrabar_Command(object sender, CommandEventArgs e)
        {
            string mensajeError = null;
            string ip = null;
            string mac = null;
            if (txtIP1.Enabled == false)
            {
                ip = "N/A";
                mac = "N/A";
            }
            else
            {
                if (Utilerias.verificarCamposVacios(new string[] { txtIP1.Text, txtIP2.Text, txtIP3.Text, txtIP4.Text, txtMAC1.Text, txtMAC2.Text, txtMAC3.Text, txtMAC4.Text, txtMAC5.Text, txtMAC6.Text }))
                {
                    if (validarIP(new string[] { txtIP1.Text, txtIP2.Text, txtIP3.Text, txtIP4.Text }))
                    {
                        ip = txtIP1.Text + "." + txtIP2.Text + "." + txtIP3.Text + "." + txtIP4.Text;
                    }
                    else
                    {
                        mensajeError = "IP inválida";
                    }
                    
                    mac = txtMAC1.Text + "-" + txtMAC2.Text + "-" + txtMAC3.Text + "-" + txtMAC4.Text + "-" + txtMAC5.Text + "-" + txtMAC6.Text;
                }
                else
                {
                    mensajeError = "Llene todos los campos de red";
                }
            }

            if (Utilerias.verificarCamposVacios(new string[] { txtDD.Text, txtRAM.Text, txtProcesador.Text, txtSerieEquipo.Text, txtSerieMonitor.Text, txtSerieMouse.Text, txtSerieTeclado.Text }))
            {
                if (mensajeError == null)
                {
                    string discoDuro = txtDD.Text + " " + cbDD.Text;
                    string ram = txtRAM.Text + " GB";
                    string procesador = txtProcesador.Text + " GHZ";

                    switch (e.CommandName)
                    {
                        case "nuevo":
                            if (controlEquipos.insertar(Convert.ToInt32(cbResponsable.SelectedValue), discoDuro, ip, mac, Convert.ToInt32(cbMarcaEquipo.SelectedValue),
                                Convert.ToInt32(cbMarcaMonitor.SelectedValue), Convert.ToInt32(cbMarcaMouse.SelectedValue), Convert.ToInt32(cbMarcaTeclado.SelectedValue),
                                ram, procesador, txtSerieEquipo.Text, txtSerieMonitor.Text, txtSerieMouse.Text, txtSerieTeclado.Text, Convert.ToInt32(cbTipoEquipo.SelectedValue)))
                            {
                                ScriptManager.RegisterStartupScript(this.updateModal, this.GetType(), "mensaje", "alertify.success('Equipo asignado correctamente');", true);
                                this.cargarTabla();
                                ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "abrirModal", "$('#ModalNuevo').modal('hide');", true);
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this.updateModal, this.GetType(), "mensaje", "alertify.error('Error al asignar un responsable a un equipo');", true);
                            }
                            break;

                        case "editar":
                            if (controlEquipos.modificar(Convert.ToInt32(gvEquipo.SelectedDataKey.Value), Convert.ToInt32(cbResponsable.SelectedValue), discoDuro, ip, mac, Convert.ToInt32(cbMarcaEquipo.SelectedValue),
                               Convert.ToInt32(cbMarcaMonitor.SelectedValue), Convert.ToInt32(cbMarcaMouse.SelectedValue), Convert.ToInt32(cbMarcaTeclado.SelectedValue),
                               ram, procesador, txtSerieEquipo.Text, txtSerieMonitor.Text, txtSerieMouse.Text, txtSerieTeclado.Text, Convert.ToInt32(cbTipoEquipo.SelectedValue)))
                            {
                                ScriptManager.RegisterStartupScript(this.updateModal, this.GetType(), "mensaje", "alertify.success('Equipo actualizado correctamente');", true);
                                this.cargarTabla();
                                ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "abrirModal", "$('#ModalNuevo').modal('hide');", true);
                            }
                            break;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.updateModal, this.GetType(), "mensaje", "alertify.error('"+mensajeError+"');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateModal, this.GetType(), "mensaje", "alertify.error('Llene todos los campos disponibles');", true);
            }
        }

        protected void gvEquipo_RowCreated(object sender, GridViewRowEventArgs e)
        {
            Utilerias.setRowCreated(sender, e, this.Page);
        }

        protected void cbTipoEquipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cargarControles();
        }

        protected void cargarControles()
        {
            tbltipoequipo tipoEquipo = controlTipoEquipo.obtenerEquipo(Convert.ToInt32(cbTipoEquipo.SelectedValue));
            this.cargarCombosMarcas(new DropDownList[] {cbMarcaEquipo, cbMarcaMonitor, cbMarcaMouse, cbMarcaTeclado }, new bool[] {tipoEquipo.equipo, tipoEquipo.monitor, tipoEquipo.mouse, tipoEquipo.teclado });
            this.cargarTextBox(new TextBox[] { txtDD, txtProcesador, txtRAM, txtSerieMonitor, txtSerieMouse, txtSerieTeclado }, new bool[] { tipoEquipo.disco_duro, tipoEquipo.procesador, tipoEquipo.ram, tipoEquipo.monitor, tipoEquipo.mouse, tipoEquipo.teclado });
            txtIP1.Enabled = txtIP2.Enabled = txtIP3.Enabled = txtIP4.Enabled = txtMAC1.Enabled = txtMAC2.Enabled = txtMAC3.Enabled = txtMAC4.Enabled = txtMAC5.Enabled = txtMAC6.Enabled = tipoEquipo.red;
        }

        protected void cargarCombosMarcas(DropDownList []cb, bool []vbol)
        {
            for(int x = 0; x < cb.Length; x++)
            {
                if (vbol[x])
                {
                    cb[x].DataSource = controlMarca.obtenerDataSourceComboBox(1);
                    cb[x].DataBind();
                }
                else
                {
                    cb[x].DataSource = controlMarca.obtenerDataSourceComboBox(0);
                    cb[x].DataBind();
                    cb[x].SelectedValue = controlMarca.obtenerMarcaNoAplica().ToString();
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

        protected bool validarIP(string[] txtIP)
        {
            foreach (string txt in txtIP)
            {
                int valor = Convert.ToInt16(txt);
                if (valor <= 0 || valor >= 255)
                {
                    return false;
                }
            }
            return true;
        } 
    }
}