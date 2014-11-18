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
            lbelUsuario.Text =" " + controlUsuario.obtenerUsuarioDeSession(this).nombre_usuario;
            if (!Page.IsPostBack)
            {
                this.cargarTablasTipos();
                this.cargarTablasMarcas();
            }
            else{
                if (Request["__EVENTTARGET"] == "txtFiltroTipo")
                {
                    this.cargarTablasTipos();
                }

                if (Request["__EVENTTARGET"] == "txtFiltroMarca")
                {
                    this.cargarTablasMarcas();
                }
            }   
       }

        protected void cargarTablasTipos()
        {
            gvTipoEquipos.DataSource = controlTipoEquipo.obtenerDataSource(txtFiltroTipo.Text);
            gvTipoEquipos.DataBind();
        }

        protected void cargarTablasMarcas()
        {
            gvMarca.DataSource = controlMarca.obtenerDataSource(txtFiltroMarca.Text);
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

        protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias.setRowCreated(sender, e, this.Page);
        }

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
                        tbltipoequipo tipoEquipo = controlTipoEquipo.obtenerEquipo(Convert.ToInt32(gvTipoEquipos.SelectedDataKey.Value));
                        chDiscoD.Checked = tipoEquipo.disco_duro;
                        chRAM.Checked = tipoEquipo.ram;
                        chRed.Checked = tipoEquipo.red;
                        chTeclado.Checked = tipoEquipo.teclado;
                        chProcesador.Checked = tipoEquipo.procesador;
                        chMonitor.Checked = tipoEquipo.monitor;
                        chMouse.Checked = tipoEquipo.mouse;
                        this.configurarModal("Editar tipo de equipo", tipoEquipo.nombre, true);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarMarca":
                    if (gvMarca.SelectedIndex != -1)
                    {
                        this.configurarModal("Editar marca", controlMarca.obtenerMarca(Convert.ToInt32(gvMarca.SelectedDataKey.Value)).nombre, false);
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
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "insertarElemento", "alertify.error('Seleccione el elemento a modificar');", true);
        }

        protected void btnGrabar_Command(object sender, CommandEventArgs e)
        {
            string mensaje = null;

            if (!String.IsNullOrWhiteSpace(txtNombre.Text))
            {
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
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "accionElemento", "alertify.error('Llene el campo Nombre');", true);
            }

            if (mensaje != null)
            {
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "quitarmodal", "$('#ModalNuevo').modal('hide');", true);
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "accionElemento", "alertify.success('" + mensaje + "');", true);
            }

        }

        protected bool insertar_CommandArgument(string argumento)
        {
            switch (argumento)
            {
                case "tipoEquipo":
                    if (controlTipoEquipo.insertar(txtNombre.Text, chEquipo.Checked, chDiscoD.Checked, chRed.Checked, chMonitor.Checked, chMouse.Checked, chTeclado.Checked, chRAM.Checked, chProcesador.Checked))
                    {
                        this.cargarTablasTipos();
                        return true;
                    }
                    else
                        return false;

                case "marca":
                    if (controlMarca.insertar(txtNombre.Text))
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
                    if (controlTipoEquipo.modificar(Convert.ToInt32(gvTipoEquipos.SelectedDataKey.Value.ToString()), txtNombre.Text, chEquipo.Checked, chDiscoD.Checked, chRed.Checked, chMonitor.Checked, chMouse.Checked, chTeclado.Checked, chRAM.Checked, chProcesador.Checked))
                    {
                        this.cargarTablasTipos();
                        return true;
                    }
                    else
                        return false;

                case "marca":
                    if (controlMarca.modificar(Convert.ToInt32(gvMarca.SelectedDataKey.Value), txtNombre.Text))
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