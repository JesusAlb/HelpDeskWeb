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
                this.cargarTablaTiposIncidentes();
                this.cargarTablaLugares();
                this.cargarTablaRequerimientos();
                this.cargarTablaPreguntas();
                this.cargarTablaAcomodos();
            }
            else
            {
                if (Request["__EVENTTARGET"] == "txtFiltroLugares")
                {
                    this.cargarTablaLugares();
                }

                if (Request["__EVENTTARGET"] == "txtFiltroTipoIncidentes")
                {
                    this.cargarTablaTiposIncidentes();
                }

                if (Request["__EVENTTARGET"] == "txtFiltroReq")
                {
                    this.cargarTablaRequerimientos();
                }

                if (Request["__EVENTTARGET"] == "txtFiltroAcomodo")
                {
                    this.cargarTablaAcomodos();
                }

                if (Request["__EVENTTARGET"] == "txtFiltroPregunta")
                {
                    this.cargarTablaPreguntas();
                }
            }
            
        }

        protected void limpiarSeleccion()
        {
            gvLugares.SelectedIndex = -1;
            gvRequerimientos.SelectedIndex = -1;
            gvTipoIncidentes.SelectedIndex = -1;
            gvAcomodos.SelectedIndex = -1;
        }

        protected void cargarTablaTiposIncidentes()
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

        protected void cargarTablaAcomodos()
        {
            gvAcomodos.DataSource = controlAcomodo.obtenerDataSource(txtFiltroAcomodo.Text);
            gvAcomodos.DataBind();
        }

        protected void cargarTablaPreguntas()
        {
            gvPreguntas.DataSource = controlPregunta.obtenerDataSource(txtFiltroPregunta.Text);
            gvPreguntas.DataBind();
        }

        protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            Utilerias.setRowCreated(sender, e, this.Page);
        }

        protected void configurarModal(string titulo, string label, string nomElemento, int maxlength, bool panelVisible)
        {
            lbelModal.Text = titulo;
            lbelNombre.Text = label;
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

        protected void btnEditar_Command(object sender, CommandEventArgs e)
        {
            bool seleccionado = false;

            switch (e.CommandName)
            {
                case "abrirEditarTipoIncidente":
                    if (gvTipoIncidentes.SelectedIndex != -1)
                    {
                        tbltipoincidencia tipoInSeleccionado = controlTipoIncidencia.obtenerTipoIncidencia(Convert.ToInt32(gvTipoIncidentes.SelectedDataKey.Value));
                        this.configurarModal("Editar tipos de incidentes", "Nombre", tipoInSeleccionado.nombre, 40, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarLugar":
                    if (gvLugares.SelectedDataKey != null)
                    {
                        tbllugar lugarSeleccionado = controlLugar.obtenerLugar(Convert.ToInt32(gvLugares.SelectedDataKey.Value));
                        this.configurarModal("Editar lugares", "Nombre", lugarSeleccionado.nombre, 60, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarRequerimiento":
                    if (gvRequerimientos.SelectedDataKey != null)
                    {
                        tblrecurso reqSeleccionado = controlRequerimientos.obtenerRequerimiento(Convert.ToInt32(gvRequerimientos.SelectedDataKey.Value), null);
                        this.configurarModal("Editar recursos", "Nombre", reqSeleccionado.nombre, 60, true);
                        cbTipoRequerimiento.SelectedValue = reqSeleccionado.cuantificable.ToString();
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarAcomodo":
                    if (gvAcomodos.SelectedDataKey != null)
                    {
                        tblacomodo acomodoSeleccionado = controlAcomodo.obtenerAcomodo(Convert.ToInt32(gvAcomodos.SelectedDataKey.Value));
                        this.configurarModal("Editar acomodos", "Nombre", acomodoSeleccionado.nombre, 35, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarPregunta":
                    if (gvPreguntas.SelectedDataKey != null)
                    {
                        tblpregunta preguntaSeleccionada = controlPregunta.obtenerPregunta(Convert.ToInt32(gvPreguntas.SelectedDataKey.Value));
                        this.configurarModal("Editar preguntas", "Contenido", preguntaSeleccionada.pregunta, 70, false);
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
                    this.configurarModal("Alta de tipo de incidente", "Nombre", "", 40, false);
                    break;

                case "abrirNuevoLugar":
                    this.configurarModal("Alta de lugares", "Nombre", "", 60, false);
                    break;

                case "abrirNuevoRequerimiento":
                    cbTipoRequerimiento.SelectedIndex = -1;
                    this.configurarModal("Alta de recursos", "Nombre", "", 60, true);
                    break;

                case "abrirNuevoAcomodo":
                    this.configurarModal("Alta de acomodos", "Nombre", "", 35, false);
                    break;

                case "abrirNuevaPregunta":
                    this.configurarModal("Alta de preguntas", "Contenido", "", 70, false);
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
                        this.cargarTablaTiposIncidentes();
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

                case "acomodo":
                    if (controlAcomodo.insertar(txtNombre.Text))
                    {
                        this.cargarTablaAcomodos();
                        return true;
                    }
                    else
                        return false;

                case "pregunta":
                    if (controlPregunta.insertar(txtNombre.Text))
                    {
                        this.cargarTablaPreguntas();
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
                        this.cargarTablaTiposIncidentes();
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

                case "acomodo":
                    if (controlAcomodo.modificar(Convert.ToInt32(gvAcomodos.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaAcomodos();
                        return true;
                    }
                    else
                        return false;

                case "pregunta":
                    if (controlPregunta.modificar(Convert.ToInt32(gvPreguntas.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaPreguntas();
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