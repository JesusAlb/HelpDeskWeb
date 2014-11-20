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
            Utilerias.checarSession(this, true, 0, 0);
            lbelUsuario.Text = " " + controlUsuario.obtenerUsuarioDeSession(this).nombre_usuario;
            if (!Page.IsPostBack)
            {
                this.cargarTablaTipoIncidente();
                this.cargarTablaLugares();
                this.cargarTablaRequerimientos();
            }
            else
            {
                if (Request["__EVENTTARGET"] == "txtFiltroLugares")
                {
                    this.cargarTablaLugares();
                }

                if (Request["__EVENTTARGET"] == "txtFiltroTipoIncidentes")
                {
                    this.cargarTablaTipoIncidente();
                }

                if (Request["__EVENTTARGET"] == "txtFiltroReq")
                {
                    this.cargarTablaRequerimientos();
                }
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
            gvTipoIncidentes.DataSource = controlTipoIncidencia.obtenerDataSource(txtFiltroTipoIncidentes.Text);
            gvTipoIncidentes.DataBind();
        }

        protected void cargarTablaLugares()
        {
            gvLugares.DataSource = controlLugar.obtenerDataSource(txtFiltroLugares.Text);
              gvLugares.DataBind();
        }

        protected void cargarTablaRequerimientos()
        {
            gvRequerimientos.DataSource = controlRequerimientos.obtenerDataSource(txtFiltroReq.Text, cbFiltroTipo.SelectedItem.Text, null);
             gvRequerimientos.DataBind();
        }

        protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            Utilerias.setRowCreated(sender, e, this.Page);
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
                        tbltipoincidencia tipoInSeleccionado = controlTipoIncidencia.obtenerTipoIncidencia(Convert.ToInt32(gvTipoIncidentes.SelectedDataKey.Value));
                        this.configurarModal("Editar tipos de incidentes", tipoInSeleccionado.nombre, 29, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarLugar":
                    if (gvLugares.SelectedDataKey != null)
                    {
                        tbllugar lugarSeleccionado = controlLugar.obtenerLugar(Convert.ToInt32(gvLugares.SelectedDataKey.Value));
                        this.configurarModal("Editar lugares", lugarSeleccionado.nombre,59, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarRequerimiento":
                    if (gvRequerimientos.SelectedDataKey != null)
                    {
                        tblrecurso ReqSeleccionado = controlRequerimientos.obtenerRequerimiento(Convert.ToInt32(gvRequerimientos.SelectedDataKey.Value), null);
                        this.configurarModal("Editar recursos", ReqSeleccionado.nombre,29, true);
                        cbTipoRequerimiento.SelectedValue = ReqSeleccionado.cuantificable.ToString();
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
                    if (controlTipoIncidencia.insertar(txtNombre.Text))
                    {
                        this.cargarTablaTipoIncidente();
                        return true;
                    }
                    else
                        return false;

                case "lugar":
                    if (controlLugar.insertar(txtNombre.Text))
                    {
                        this.cargarTablaLugares();
                        return true;
                    }
                    else
                        return false;

                case "requerimiento":
                    if (controlRequerimientos.insertar(txtNombre.Text, Convert.ToBoolean(cbTipoRequerimiento.SelectedValue)))
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
                    if (controlTipoIncidencia.modificar(Convert.ToInt32(gvTipoIncidentes.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaTipoIncidente();
                        return true;
                    }
                    else
                        return false;

                case "lugar":
                    if (controlLugar.modificar(Convert.ToInt32(gvLugares.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaLugares();
                        return true;
                    }
                    else
                        return false;

                case "requerimiento":
                    if (controlRequerimientos.modificar(Convert.ToInt32(gvRequerimientos.SelectedDataKey.Value), txtNombre.Text, Convert.ToBoolean(cbTipoRequerimiento.SelectedValue)))
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

        protected void cbFiltroTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cargarTablaRequerimientos();
        }


       // fin de optimización 

    }
}