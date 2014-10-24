using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlAltas;
using HelpDeskWeb.Datos;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using toolsASP;

namespace HelpDeskWeb.Catalogos
{
    public partial class Usuarios : System.Web.UI.Page
    {

        private hdk_ControlAcceso Control;
        private hdk_ControlCoordinacion controlCoordinacion;
        private hdk_ControlDepartamento controlDepto;
        private hdk_ControlArea controlArea;
        private hdk_ControlPuesto controlPuesto;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DatosUsuario"] == null)
            {
                Response.Redirect("../Index.aspx");
            }
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).nomUsuario;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlCoordinacion = new hdk_ControlCoordinacion(Control);
            controlDepto = new hdk_ControlDepartamento(Control);
            controlArea = new hdk_ControlArea(Control);
            controlPuesto = new hdk_ControlPuesto(Control);

            if (!IsPostBack)
            {
                this.cargarTablaArea();
                this.cargarTablaCoordinacion();
                this.cargarTablaDeptos();
                this.cargarTablaPuesto();
            }
        }

       protected void cargarTablaDeptos()
        {
            this.gvDeptos.DataSource = controlDepto.cargarTabla(txtFiltroDepto.Text, cbFiltroCoord.SelectedItem.Text);
            this.gvDeptos.DataBind();
        }

        protected void cargarTablaCoordinacion()
        {
            this.cargarCombosCoordinacion();
            this.gvCoordinaciones.DataSource = controlCoordinacion.cargarTabla(txtFiltroCoord.Text);
            this.gvCoordinaciones.DataBind();
        }

        protected void cargarCombosCoordinacion()
        {
            this.cbFiltroCoord.DataSource = controlDepto.cargarComboCord(true);
            this.cbCoordinaciones.DataSource = controlDepto.cargarComboCord(false);
            this.cbCoordinaciones.DataBind();
            this.cbFiltroCoord.DataBind();
        }

        protected void cargarTablaArea()
        {
            this.gvAreas.DataSource = controlArea.cargarTabla(txtFiltroArea.Text);
            this.gvAreas.DataBind();
        }

        protected void cargarTablaPuesto()
        {
            this.gvPuestos.DataSource = controlPuesto.cargarTabla(txtFiltroPuesto.Text);
            this.gvPuestos.DataBind();
        }

        protected void configurarModal(string titulo, string nomRegistro, bool panelVisible)
        {
            lbelModal.Text = titulo;
            txtNombre.Text = nomRegistro;
            panelCoordinaciones.Visible = panelVisible;  
        }

        protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
           forControls.crearEstiloSeleccionable(sender, e, this.Page);
        }

        protected void btnGrabar_Command(object sender, CommandEventArgs e)
        {
             string mensaje = null;

             switch(e.CommandName)
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

        protected bool insertar_CommandArgument(string argumento)
        {
            switch (argumento)
            {
                case "coordinacion":
                    if (controlCoordinacion.insertar(txtNombre.Text)){
                        this.cargarTablaCoordinacion();
                        return true;
                    }                        
                    else
                        return false;

                case "depto":
                    if (controlDepto.insertar(txtNombre.Text, Convert.ToInt32(cbCoordinaciones.SelectedValue))){
                        this.cargarTablaDeptos();
                        return true;
                    }
                    else
                        return false;

                case "area":
                    if (controlArea.insertar(txtNombre.Text))
                    {
                        this.cargarTablaArea();
                        return true;
                    }
                    else
                        return false;

                case "puesto":
                    if (controlPuesto.insertar(txtNombre.Text))
                    {
                        this.cargarTablaPuesto();
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
                case "coordinacion":
                    if (controlCoordinacion.modificar(Convert.ToInt32(gvCoordinaciones.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaCoordinacion();
                        return true;
                    }
                    else
                        return false;

                case "depto":
                    if (controlDepto.modificar(Convert.ToInt32(gvDeptos.SelectedDataKey.Value), txtNombre.Text, Convert.ToInt32(cbCoordinaciones.SelectedValue)))
                    {
                        this.cargarTablaDeptos();
                        return true;
                    }
                    else
                        return false;

                case "area":
                    if (controlArea.modificar(Convert.ToInt32(gvAreas.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaArea();
                        return true;
                    }
                    else
                        return false;

                case "puesto":
                    if (controlPuesto.modificar(Convert.ToInt32(gvPuestos.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaPuesto();
                        return true;
                    }
                    else
                        return false;

                default:
                    return false;
            }
        }

        protected void btnEditar_Command(object sender, CommandEventArgs e)
        {
            bool seleccionado = false;

            switch (e.CommandName)
            {
                case "abrirEditarCoord":
                    if (gvCoordinaciones.SelectedIndex != -1)
                    {
                        tblcoordinacion coordSeleccionada = controlCoordinacion.obtenerCoordinacion(Convert.ToInt32(gvCoordinaciones.SelectedDataKey.Value));
                        this.configurarModal("Editar coordinaciones", coordSeleccionada.nomCoordinacion, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarDepto":
                    if (gvDeptos.SelectedIndex != -1)
                    {
                        tbldepartamento deptoSeleccionado = controlDepto.obtenerDepto(Convert.ToInt32(gvDeptos.SelectedDataKey.Value));
                        this.cbCoordinaciones.SelectedValue = deptoSeleccionado.coordinacion.ToString();
                        this.configurarModal("Editar departamentos", deptoSeleccionado.nomDepto, true);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarArea":
                    if (gvAreas.SelectedIndex != -1)
                    {
                        tblarea areaSeleccionada = this.controlArea.obtenerArea(Convert.ToInt32(gvAreas.SelectedDataKey.Value));
                        this.configurarModal("Editar áreas", areaSeleccionada.nomArea, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarPuesto":
                    if (gvPuestos.SelectedIndex != -1)
                    {
                        tblpuesto puestoSeleccionado = this.controlPuesto.obtenerPuesto(Convert.ToInt32(gvPuestos.SelectedDataKey.Value));
                        this.configurarModal("Editar puestos", puestoSeleccionado.nomPuesto, false);
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
                case "abrirNuevaCoord":
                    this.configurarModal("Alta de coordinaciones", "", false);
                    break;
                case "abrirNuevoDepto":
                    this.cbCoordinaciones.SelectedIndex = -1;
                    this.configurarModal("Alta de departamentos", "", true);
                    break;
                case "abrirNuevaArea":
                    this.configurarModal("Alta de areas", "", false);
                    break;
                case "abrirNuevoPuesto": 
                    this.configurarModal("Alta de puestos", "", false);
                    break;
            }
            btnGrabar.CommandName = "insertar";
            ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "AbrirModal", "$('#ModalNuevo').modal('show');", true);
        }
    }
}