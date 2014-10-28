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
        private hdk_ControlAcceso Control;
        private hdk_ControlLugar controlLugar;
        private hdk_ControlRequerimientos controlRequerimientos;
        private hdk_ControlTipoIncidencia controlTipoIncidencia;
        private hdk_utilerias utilerias;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DatosUsuario"] == null)
            {
                Response.Redirect("../index.aspx");
            }
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).username;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlTipoIncidencia = new hdk_ControlTipoIncidencia(Control);
            controlRequerimientos = new hdk_ControlRequerimientos(Control);
            controlLugar = new hdk_ControlLugar(Control);
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
            gvTipoIncidentes.DataSource = controlTipoIncidencia.cargarTabla(txtFiltroTipoIncidentes.Text);
            gvTipoIncidentes.DataBind();
        }

        protected void cargarTablaLugares()
        {
              gvLugares.DataSource = controlLugar.cargarTabla(txtFiltroLugares.Text);
              gvLugares.DataBind();
        }

        protected void cargarTablaRequerimientos()
        {
             gvRequerimientos.DataSource = controlRequerimientos.cargarTabla(txtFiltroReq.Text, cbFiltroTipo.Text, null);
             gvRequerimientos.DataBind();
        }

        protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            utilerias = new hdk_utilerias();
            utilerias.setRowCreated(sender, e);
        }

     /*   protected void btnGrabar_Click(object sender, EventArgs e)
        {
            bool registrosAlterados = false;

            if (!String.IsNullOrWhiteSpace(txtNombre.Text))
            {
                if (acciones.Value.Equals("0"))
                {
                    if (tabItemSeleccionado.Value.Equals("0"))
                    {
                        if (controlTipoIncidencia.insertar(txtNombre.Text))
                            registrosAlterados = true;
                        
                    }
                    else if(tabItemSeleccionado.Value.Equals("1"))
                    {
                        if (controlLugar.insertar(txtNombre.Text))
                            registrosAlterados = true;
                    }
                    else
                    {
                        if (controlRequerimientos.insertar(txtNombre.Text, Convert.ToBoolean(cbTipoRequerimiento.SelectedValue)))
                            registrosAlterados = true;
                    }
                    if (!registrosAlterados)
                    {
                        ScriptManager.RegisterStartupScript(this.updateModalNuevo, this.GetType(), "txtNombreVacio", "alertify.alert('Error','Error al insertar el registro','onok');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.updateModalNuevo, this.GetType(), "DesaparecerModal", "$('#ModalNuevo').modal('hide');", true);
                        ScriptManager.RegisterStartupScript(this.updateModalNuevo, this.GetType(), "GrabadoCorrecto", "alertify.alert('Correcto','Registro grabado satisfactoriamente','onok');", true);
                    }
                }
                else
                {
                    if (tabItemSeleccionado.Value.Equals("0"))
                    {
                        if (controlTipoIncidencia.modificar(Convert.ToInt32(gvTipoIncidentes.SelectedDataKey.Value.ToString()), txtNombre.Text))
                            registrosAlterados = true;
                    }
                    else if (tabItemSeleccionado.Value.Equals("1"))
                    {
                        if (controlLugar.modificar(Convert.ToInt32(gvLugares.SelectedDataKey.Value.ToString()), txtNombre.Text))
                            registrosAlterados = true;
                    }
                    else
                    {
                        if (controlRequerimientos.modificar(Convert.ToInt32(gvRequerimientos.SelectedDataKey.Value.ToString()), txtNombre.Text, cbTipoRequerimiento.SelectedItem.Text))
                            registrosAlterados = true;
                    }

                    if (!registrosAlterados)
                    {
                        ScriptManager.RegisterStartupScript(this.updateModalNuevo, this.GetType(), "txtNombreVacio", "alertify.alert('Error','Error al editar el registro','onok');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.updateModalNuevo, this.GetType(), "DesaparecerModal", "$('#ModalNuevo').modal('hide');", true);
                        ScriptManager.RegisterStartupScript(this.updateModalNuevo, this.GetType(), "EdicionCorrecta", "alertify.alert('Correcto','Registro editado satisfactoriamente','onok');", true);
                    }
                }

                if (registrosAlterados)
                {
                    this.limpiarSeleccion();
                    this.cargarTablaLugares();
                    this.cargarTablaRequerimientos();
                    this.cargarTablaTipoIncidente();                
                }
            }
            else
            {
              ScriptManager.RegisterStartupScript(this.updateModalNuevo, this.GetType(), "txtNombreVacio", "alertify.alert('Error','Por favor proporcione el  nombre','onok');", true);
            }
        }

        protected void btnEditarTipo_Click(object sender, EventArgs e)
        {
            if (gvTipoIncidentes.SelectedIndex != -1)
            {
                acciones.Value = "1";
                tbltipoincidencia tipoincidente = controlTipoIncidencia.obtenerTipoIncidencia(Convert.ToInt32(gvTipoIncidentes.SelectedDataKey.Value.ToString()));
                txtNombre.Text = tipoincidente.nomTipoIncidente;
                lbelModal.Text = "Editar tipo de incidente";
                ScriptManager.RegisterStartupScript(this.upAccionesTipos, this.GetType(), "btnEditarActivo", "$('#ModalNuevo').modal('show');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.upAccionesTipos, this.GetType(), "TipoNoSeleccionado", "alertify.alert('Error', 'Seleccione el tipo de incidente a editar', 'onok');", true);
            }
        }

        protected void btnNuevoTipo_Click(object sender, EventArgs e)
        {
            txtNombre.Text = "";
            lbelModal.Text = "Alta de tipos de incidencia";
            acciones.Value = "0";
            ScriptManager.RegisterStartupScript(this.upAccionesTipos, GetType(), "btnNuevoTipoActivo", "$('#ModalNuevo').modal('show');", true);
        }

        protected void btnNuevoLugar_Click(object sender, EventArgs e)
        {
            txtNombre.Text = "";
            lbelModal.Text = "Alta de lugares";
            acciones.Value = "0";
            ScriptManager.RegisterStartupScript(this.upAccionesLugares, GetType(), "btnNuevoLugarActivo", "$('#ModalNuevo').modal('show');", true);
        }

        protected void btnEditarLugar_Click(object sender, EventArgs e)
        {
            if (gvLugares.SelectedIndex != -1)
            {
                tbllugar lugar = controlLugar.obtenerLugar(Convert.ToInt32(gvLugares.SelectedDataKey.Value.ToString()));
                txtNombre.Text = lugar.nomLugar;
                lbelModal.Text = "Editar lugar";
                acciones.Value = "1";
                ScriptManager.RegisterStartupScript(this.upAccionesLugares, this.GetType(), "btnEditarLugarActivo", "$('#ModalNuevo').modal('show');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.upAccionesLugares, this.GetType(), "LugarNoSeleccionado", "alertify.alert('Error', 'Seleccione el lugar a editar', 'onok');", true);
            }
        }

        protected void btnNuevoRequerimiento_Click(object sender, EventArgs e)
        {
            txtNombre.Text = "";
            lbelModal.Text = "Alta de Requerimientos";
            acciones.Value = "0";
            ScriptManager.RegisterStartupScript(this.upAccionesRequerimientos, GetType(), "btnNuevoReqActivo", "$('#ModalNuevo').modal('show');", true);
        }

        protected void btnEditarRequerimiento_Click(object sender, EventArgs e)
        {
            if (gvRequerimientos.SelectedIndex != -1)
            {
                acciones.Value = "1";
                requerimientosSinAsignar_Result recurso = controlRequerimientos.obtenerRequerimiento(Convert.ToInt32(gvRequerimientos.SelectedDataKey.Value.ToString()), null);
                txtNombre.Text = recurso.nomRequerimiento;
                cbTipoRequerimiento.SelectedItem.Text = recurso.tipo;
                lbelModal.Text = "Editar recurso";
                ScriptManager.RegisterStartupScript(this.upAccionesRequerimientos, this.GetType(), "btnEditarReqActivo", "$('#ModalNuevo').modal('show');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.upAccionesRequerimientos, this.GetType(), "ReqNoSeleccionado", "alertify.alert('Error', 'Seleccione el recurso a editar', 'onok');", true);
            }
        }*/

        //Desde aqui se optimizará el codigo

        protected void configurarModal(string titulo, string nomElemento, bool panelVisible)
        {
            lbelModal.Text = titulo;
            txtNombre.Text = nomElemento;
            panelTipoRequerimiento.Visible = panelVisible;
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
                        ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "accionElemento", "alertify.alert('Error', 'Error al registrar', 'onok');", true);
                    break;

                case "actualizar":
                    if (this.actualizar_CommandArgument(e.CommandArgument.ToString()))
                        mensaje = "Se actualizó el registro satiscartoriamente";
                    else
                        ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "accionElemento", "alertify.alert('Error', 'Error al actualizar', 'onok');", true);
                    break;
            }

            if (mensaje != null)
            {
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "quitarmodal", "$('#ModalNuevo').modal('hide');", true);
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "accionElemento", "alertify.alert('Correcto', '" + mensaje + "', 'onok');", true);
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
                        this.configurarModal("Editar tipos de incidentes", tipoInSeleccionado.nomTipoIncidente, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarLugar":
                    if (gvLugares.SelectedIndex != -1)
                    {
                        tbllugar lugarSeleccionado = controlLugar.obtenerLugar(Convert.ToInt32(gvLugares.SelectedDataKey.Value));
                        this.configurarModal("Editar lugares", lugarSeleccionado.nomLugar, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarRequerimiento":
                    if (gvRequerimientos.SelectedIndex != -1)
                    {
                        requerimientosSinAsignar_Result ReqSeleccionado = controlRequerimientos.obtenerRequerimiento(Convert.ToInt32(gvRequerimientos.SelectedDataKey.Value), null);
                        this.configurarModal("Editar recursos", ReqSeleccionado.nomRequerimiento, true);
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
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "insertarElemento", "alertify.alert('Correcto', 'Seleccione el elemento a modificar', 'onok');", true);
        }

        protected void btnNuevo_Command(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "abrirNuevoTipoIncidente":
                    this.configurarModal("Alta de tipos de incidentes", "", false);
                    break;

                case "abrirNuevoLugar":
                    this.configurarModal("Alta de lugares", "", false);
                    break;

                case "abrirNuevoRequerimiento":
                    cbTipoRequerimiento.SelectedIndex = -1;
                    this.configurarModal("Alta de recursos", "", true);
                    break;
            }
            btnGrabar.CommandName = "insertar";
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


       // fin de optimización 

    }
}