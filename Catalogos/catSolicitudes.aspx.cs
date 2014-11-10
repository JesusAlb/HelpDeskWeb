using AjaxControlToolkit;
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlAltas;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Catalogos
{
    public partial class catSolicitudes : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this, true, 0, 0);
            lbelUsuario.Text = " " + hdk_ControlUsuario.obtenerUsuarioDeSession(this).username;
            if (!IsPostBack)
            {
                this.cargarTablaTipoIncidente();
                this.cargarTablaLugares();
                this.cargarTablaRequerimientos();
            }         
        }

        protected void limpiarSeleccion()
        {
            gvLugares.SelectedIndex = -1;
            gvRequerimientos.SelectedIndex = -1;
            gvTipoIncidentes.SelectedIndex = -1;
        }

        protected void cargarTablaTipoIncidente()
        {
            gvTipoIncidentes.DataSource = hdk_ControlTipoIncidencia.cargarTabla(txtFiltroTipoIncidentes.Text);
            gvTipoIncidentes.DataBind();
        }

        protected void cargarTablaLugares()
        {
            gvLugares.DataSource = hdk_ControlLugar.cargarTabla(txtFiltroLugares.Text);
              gvLugares.DataBind();
        }

        protected void cargarTablaRequerimientos()
        {
            gvRequerimientos.DataSource = hdk_ControlRequerimientos.cargarTabla(txtFiltroReq.Text, cbFiltroTipo.Text, null);
             gvRequerimientos.DataBind();
        }

        protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias.setRowCreated(sender, e, this.Page);
        }

        protected void configurarModal(string titulo, string nomElemento, int maxlength, bool panelVisible)
        {
            lbelModal.Text = titulo;
            txtNombre.Text = nomElemento;
            txtNombre.MaxLength = maxlength;
            panelTipoRequerimiento.Visible = panelVisible;
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
                            mensaje = "Se actualizó el registro satiscartoriamente";
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

        protected void btnEditar_Command(object sender, CommandEventArgs e)
        {
            bool seleccionado = false;

            switch (e.CommandName)
            {
                case "abrirEditarTipoIncidente":
                    if (gvTipoIncidentes.SelectedIndex != -1)
                    {
                        tbltipoincidencia tipoInSeleccionado = hdk_ControlTipoIncidencia.obtenerTipoIncidencia(Convert.ToInt32(gvTipoIncidentes.SelectedDataKey.Value));
                        this.configurarModal("Editar tipos de incidentes", tipoInSeleccionado.nomTipoIncidente, 29, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarLugar":
                    if (gvLugares.SelectedIndex != -1)
                    {
                        tbllugar lugarSeleccionado = hdk_ControlLugar.obtenerLugar(Convert.ToInt32(gvLugares.SelectedDataKey.Value));
                        this.configurarModal("Editar lugares", lugarSeleccionado.nomLugar,59, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarRequerimiento":
                    if (gvRequerimientos.SelectedIndex != -1)
                    {
                        requerimientosSinAsignar_Result ReqSeleccionado = hdk_ControlRequerimientos.obtenerRequerimiento(Convert.ToInt32(gvRequerimientos.SelectedDataKey.Value), null);
                        this.configurarModal("Editar recursos", ReqSeleccionado.nomRequerimiento,29, true);
                        cbTipoRequerimiento.SelectedItem.Text = ReqSeleccionado.tipo;
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

        protected void btnNuevo_Command(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "abrirNuevoTipoIncidente":
                    this.configurarModal("Alta de tipos de incidentes", "",29, false);
                    break;

                case "abrirNuevoLugar":
                    this.configurarModal("Alta de lugares", "",59, false);
                    break;

                case "abrirNuevoRequerimiento":
                    cbTipoRequerimiento.SelectedIndex = -1;
                    this.configurarModal("Alta de recursos", "",29, true);
                    break;
            }
            btnGrabar.CommandName = "insertar";
            btnGrabar.CommandArgument = e.CommandArgument.ToString();
            ScriptManager.RegisterStartupScript(this.updateModalNuevo, this.GetType(), "abrirNuevoModal", "$('#ModalNuevo').modal('show');", true);
        }

        protected bool insertar_CommandArgument(string argumento)
        {
            switch (argumento)
            {
                case "tipoIncidente":
                    if (hdk_ControlTipoIncidencia.insertar(txtNombre.Text))
                    {
                        this.cargarTablaTipoIncidente();
                        return true;
                    }
                    else
                        return false;

                case "lugar":
                    if (hdk_ControlLugar.insertar(txtNombre.Text))
                    {
                        this.cargarTablaLugares();
                        return true;
                    }
                    else
                        return false;

                case "requerimiento":
                    if (hdk_ControlRequerimientos.insertar(txtNombre.Text, Convert.ToBoolean(cbTipoRequerimiento.SelectedValue)))
                    {
                        this.cargarTablaRequerimientos();
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
                case "tipoIncidente":
                    if (hdk_ControlTipoIncidencia.modificar(Convert.ToInt32(gvTipoIncidentes.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaTipoIncidente();
                        return true;
                    }
                    else
                        return false;

                case "lugar":
                    if (hdk_ControlLugar.modificar(Convert.ToInt32(gvLugares.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaLugares();
                        return true;
                    }
                    else
                        return false;

                case "requerimiento":
                    if (hdk_ControlRequerimientos.modificar(Convert.ToInt32(gvRequerimientos.SelectedDataKey.Value), txtNombre.Text, Convert.ToBoolean(cbTipoRequerimiento.SelectedValue)))
                    {
                        this.cargarTablaRequerimientos();
                        return true;
                    }
                    else
                        return false;

                default:
                    return false;
            }
        }


       // fin de optimización 

    }
}