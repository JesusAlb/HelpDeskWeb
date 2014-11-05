using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelpDeskWeb.EntityFrameWork;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlBD.Acceso;
using System.Drawing;
using System.Collections;

namespace HelpDeskWeb.Catalogos
{
    public partial class catEquipos : System.Web.UI.Page
    {
         
        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this,true, 0, 0);
            lbelUsuario.Text =" " + hdk_ControlUsuario.obtenerUsuarioDeSession(this).username;
            if (!IsPostBack)
            {
                this.cargarTablasTipos();
                this.cargarTablasMarcas();
            }           
       }

        protected void cargarTablasTipos()
        {
            gvTipoEquipos.DataSource = hdk_ControlTipoEquipo.cargarTabla(txtFiltroTipo.Text);
            gvTipoEquipos.DataBind();
        }

        protected void cargarTablasMarcas()
        {
            gvMarca.DataSource = hdk_ControlMarca.cargarTabla("");
            gvMarca.DataBind();
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

     /*   protected void btnGrabarTipo_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrWhiteSpace(txtTipoEquipo.Text))
            {
                if (accionesEquipos.Value.Equals("0"))
                {
                    if (hdk_ControlTipoEquipo.insertar(txtTipoEquipo.Text, chEquipo.Checked, chDiscoD.Checked, chRed.Checked, chMonitor.Checked, chMouse.Checked, chTeclado.Checked, chRAM.Checked, chProcesador.Checked))
                    {
                        this.cargarTablasTipos();
                        ScriptManager.RegisterStartupScript(this.updateNuevoTipo, GetType(), "btnNuevoActivo", "$('#ModalNuevoTipoEquipos').modal('hide');", true);
                        ScriptManager.RegisterStartupScript(this.updateNuevoTipo, GetType(), "btnModificarActivo", "alertify.success('Tipo de equipo creado exitosamente')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.updateNuevoTipo, GetType(), "btnModificarActivo", "alertify.error('No se pudo crear el tipo de equipo')", true);
                    }
                }
                else
                {
                    if (hdk_ControlTipoEquipo.modificar(Convert.ToInt32(gvTipoEquipos.SelectedDataKey.Value.ToString()), txtTipoEquipo.Text, chEquipo.Checked, chDiscoD.Checked, chRed.Checked, chMonitor.Checked, chMouse.Checked, chTeclado.Checked, chRAM.Checked, chProcesador.Checked))
                    {
                        this.cargarTablasTipos();
                        ScriptManager.RegisterStartupScript(this.updateNuevoTipo, GetType(), "btnNuevoActivo", "$('#ModalNuevoTipoEquipos').modal('hide');", true);
                        ScriptManager.RegisterStartupScript(this.updateNuevoTipo, GetType(), "btnModificarActivo", "alertify.success('Tipo de equipo editado exitosamente')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.updateNuevoTipo, GetType(), "btnModificarActivo", "alertify.error('No se pudo editar el tipo de equipo')", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateNuevoTipo, this.GetType(), "btnError", "alertify.alert('Error', 'Escriba el nombre del tipo de equipo', 'onok');", true);
            }
            
        }

        protected void btnNuevoTipo_Click(object sender, EventArgs e)        
        {
            accionesEquipos.Value = "0"; 
            txtTipoEquipo.Text = "";
            chTodos.Checked = false;
            chTodos_CheckedChanged(sender, e);
            lbelModal.Text = "Alta de tipos de equipos";
            ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "btnNuevoActivo", "$('#ModalNuevoTipoEquipos').modal('show');", true);
        }*/

        protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias.setRowCreated(sender, e, this.Page);
        }

        /*    protected void btnEditarTipo_Click(object sender, EventArgs e)
            {
                if (gvTipoEquipos.SelectedIndex != -1)
                {
                    accionesEquipos.Value = "1";
                    lbelModal.Text = "Modificar tipo de equipos";
                    int tipoEquipo = Convert.ToInt32(gvTipoEquipos.SelectedDataKey.Value.ToString());
                    tbltipoequipo equipo = hdk_ControlTipoEquipo.obtenerEquipo(tipoEquipo);
                    txtTipoEquipo.Text = equipo.nomTipoEquipo;
                    chDiscoD.Checked = equipo.siDiscoDuro;
                    chRAM.Checked = equipo.siRAM;
                    chRed.Checked = equipo.siRed;
                    chTeclado.Checked = equipo.siTeclado;
                    chProcesador.Checked = equipo.siProcesador;
                    chMonitor.Checked = equipo.siMonitor;
                    chMouse.Checked = equipo.siMouse;
                    ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "btnEditarActivo", "$('#ModalNuevoTipoEquipos').modal('show');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.updateNuevoTipo, this.GetType(), "btnEditarError", "alertify.alert('Error', 'Seleccione el tipo de equipo a editar', 'onok');", true);
                }
            }

            protected void btnNuevaMarca_Click(object sender, EventArgs e)
            {
                accionesMarcas.Value = "0";
                lbelModalMarca.Text = "Alta de marcas";
                txtMarca.Text = "";
                ScriptManager.RegisterStartupScript(this.updateAccionesMarcas, GetType(), "btnNuevoActivo", "$('#ModalNuevaMarca').modal('show');", true);
            }

            protected void btnEditarMarca_Click(object sender, EventArgs e)
            {
                if (gvMarca.SelectedIndex != -1)
                {
                    accionesMarcas.Value = "1";
                    lbelModalMarca.Text = "Modificar marcas";
                    tblmarca marca = hdk_ControlMarca.obtenerMarca(Convert.ToInt32(gvMarca.SelectedDataKey.Value.ToString()));
                    txtMarca.Text = marca.nomMarca;
                    ScriptManager.RegisterStartupScript(this.updateAccionesMarcas, GetType(), "btnEditarActivo", "$('#ModalNuevaMarca').modal('show');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.updateAccionesMarcas, this.GetType(), "btnEditarError", "alertify.alert('Error', 'Seleccione la marca a editar', 'onok');", true);
                }
            }

            protected void btnGrabarMarca_Click(object sender, EventArgs e)
            {

                if (!String.IsNullOrWhiteSpace(txtMarca.Text))
                {

                    if (accionesMarcas.Value.Equals("0"))
                    {

                        if (hdk_ControlMarca.insertar(txtMarca.Text))
                        {
                            this.cargarTablasMarcas();
                            ScriptManager.RegisterStartupScript(this.updateNuevaMarca, GetType(), "btnNuevoActivo", "$('#ModalNuevaMarca').modal('hide');", true);
                            ScriptManager.RegisterStartupScript(this.updateNuevaMarca, GetType(), "btnModificarActivo", "alertify.success('Marca creada exitosamente')", true);
                        }

                    }
                    else
                    {
                        if (hdk_ControlMarca.modificar(Convert.ToInt32(gvMarca.SelectedDataKey.Value.ToString()), txtMarca.Text))
                        {
                            this.cargarTablasMarcas();
                            ScriptManager.RegisterStartupScript(this.updateNuevaMarca, GetType(), "btnNuevoActivo", "$('#ModalNuevaMarca').modal('hide');", true);
                            ScriptManager.RegisterStartupScript(this.updateNuevaMarca, GetType(), "btnModificarActivo", "alertify.success('Marca editada exitosamente')", true);
                        }

                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.updateNuevoTipo, this.GetType(), "btnEditarError", "alertify.alert('Error', 'Escriba el nombre de la marca', 'onok');", true);
                }
            }*/

        //Inicio de optimización

        protected void configurarModal(string titulo, string nomElemento, bool panelVisible)
        {
            lbelModal.Text = titulo;
            txtNombre.Text = nomElemento;
            panelCarTipoEquipo.Visible = panelVisible;
        }

        protected void btnNuevo_Command(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "abrirNuevoTipoEquipo":
                    chTodos.Checked = false;
                    chTodos_CheckedChanged(sender, e);
                    this.configurarModal("Alta de tipos de equipo", "", true);
                    break;

                case "abrirNuevaMarca":
                    this.configurarModal("Alta de marcas", "", false);
                    break;
            }
            btnGrabar.CommandName = "insertar";
            btnGrabar.CommandArgument = e.CommandArgument.ToString();
            ScriptManager.RegisterStartupScript(this.updateModalNuevo, this.GetType(), "abrirNuevoModal", "$('#ModalNuevo').modal('show');", true);
        }

        protected void btnEditar_Command(object sender, CommandEventArgs e)
        {
            bool seleccionado = false;

            switch (e.CommandName)
            {
                case "abrirEditarTipoEquipo":
                    if (gvTipoEquipos.SelectedIndex != -1)
                    {
                        tbltipoequipo tipoEquipo = hdk_ControlTipoEquipo.obtenerEquipo(Convert.ToInt32(gvTipoEquipos.SelectedDataKey.Value));
                        chDiscoD.Checked = tipoEquipo.siDiscoDuro;
                        chRAM.Checked = tipoEquipo.siRAM;
                        chRed.Checked = tipoEquipo.siRed;
                        chTeclado.Checked = tipoEquipo.siTeclado;
                        chProcesador.Checked = tipoEquipo.siProcesador;
                        chMonitor.Checked = tipoEquipo.siMonitor;
                        chMouse.Checked = tipoEquipo.siMouse;
                        this.configurarModal("Editar tipo de equipo", tipoEquipo.nomTipoEquipo, true);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarMarca":
                    if (gvMarca.SelectedIndex != -1)
                    {
                        this.configurarModal("Editar marca", hdk_ControlMarca.obtenerMarca(Convert.ToInt32(gvMarca.SelectedDataKey.Value)).nomMarca, false);
                        seleccionado = true;
                    }
                    break;

            }
            if (seleccionado)
            {
                btnGrabar.CommandName = "actualizar";
                btnGrabar.CommandArgument = e.CommandArgument.ToString();
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "AbrirModal", "$('#ModalNuevo').modal('show');", true);
            }
            else
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "insertarElemento", "alertify.alert('Correcto', 'Seleccione el elemento a modificar', 'onok');", true);
        }

        protected void btnGrabar_Command(object sender, CommandEventArgs e)
        {
            string mensaje = null;

            switch (e.CommandName)
            {
                case "insertar":
                    if (this.insertar_CommandArgument(e.CommandArgument.ToString()))
                        mensaje = "Se grabó el registro satisfactoriamente";
                    else
                        ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "accionElemento", "alertify.error('Error al registrar');", true);
                    break;

                case "actualizar":
                    if (this.actualizar_CommandArgument(e.CommandArgument.ToString()))
                        mensaje = "Se actualizó el registro satisfactoriamente";
                    else
                        ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "accionElemento", "alertify.error('Error al actualizar');", true);
                    break;
            }

            if (mensaje != null)
            {
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "quitarmodal", "$('#ModalNuevo').modal('hide');", true);
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "accionElemento", "alertify.success('Correcto', '" + mensaje + "', 'onok');", true);
            }

        }

        protected bool insertar_CommandArgument(string argumento)
        {
            switch (argumento)
            {
                case "tipoEquipo":
                    if (hdk_ControlTipoEquipo.insertar(txtNombre.Text, chEquipo.Checked, chDiscoD.Checked, chRed.Checked, chMonitor.Checked, chMouse.Checked, chTeclado.Checked, chRAM.Checked, chProcesador.Checked))
                    {
                        this.cargarTablasTipos();
                        return true;
                    }
                    else
                        return false;

                case "marca":
                    if (hdk_ControlMarca.insertar(txtNombre.Text))
                    {
                        this.cargarTablasMarcas();
                        return true;
                    }
                    else
                        return false;

                default:
                    return false;
            }
        }

        protected bool actualizar_CommandArgument(string argumento)
        {
            switch (argumento)
            {
                case "tipoEquipo":
                    if (hdk_ControlTipoEquipo.modificar(Convert.ToInt32(gvTipoEquipos.SelectedDataKey.Value.ToString()), txtNombre.Text, chEquipo.Checked, chDiscoD.Checked, chRed.Checked, chMonitor.Checked, chMouse.Checked, chTeclado.Checked, chRAM.Checked, chProcesador.Checked))
                    {
                        this.cargarTablasTipos();
                        return true;
                    }
                    else
                        return false;

                case "marca":
                    if (hdk_ControlMarca.modificar(Convert.ToInt32(gvMarca.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablasMarcas();
                        return true;
                    }
                    else
                        return false;

                default:
                    return false;
            }
        }

        //Fin de optimización
    }
}