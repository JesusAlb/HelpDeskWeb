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

namespace HelpDeskWeb.Catalogos
{
    public partial class Usuarios : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this, true, 0, 0);
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).username;

            if (!IsPostBack)
            {
                this.cargarTablaArea();
                this.cargarTablaCoordinacion();
                this.cargarTablaDeptos();
                this.cargarTablaPuesto();
            }

            if (Page.IsPostBack)
            {
                if (Request["__EVENTTARGET"] == "txtFiltroCoord")
                {
                    this.cargarTablaCoordinacion();
                }
                if (Request["__EVENTTARGET"] == "txtFiltroDepto")
                {
                    this.cargarTablaDeptos();
                }
                if (Request["__EVENTTARGET"] == "txtFiltroArea")
                {
                    this.cargarTablaArea();
                }
                if (Request["__EVENTTARGET"] == "txtFiltroPuesto")
                {
                    this.cargarTablaPuesto();
                }
            }
        
        }

       protected void cargarTablaDeptos()
        {
            this.gvDeptos.DataSource = hdk_ControlDepartamento.cargarTabla(txtFiltroDepto.Text, cbFiltroCoord.SelectedItem.Text);
            this.gvDeptos.DataBind();
        }

        protected void cargarTablaCoordinacion()
        {
            this.cargarCombosCoordinacion();
            this.gvCoordinaciones.DataSource = hdk_ControlCoordinacion.cargarTabla(txtFiltroCoord.Text);
            this.gvCoordinaciones.DataBind();
        }

        protected void cargarCombosCoordinacion()
        {
            this.cbFiltroCoord.DataSource = hdk_ControlDepartamento.cargarComboCord(true);
            this.cbCoordinaciones.DataSource = hdk_ControlDepartamento.cargarComboCord(false);
            this.cbCoordinaciones.DataBind();
            this.cbFiltroCoord.DataBind();
        }

        protected void cargarTablaArea()
        {
            this.gvAreas.DataSource = hdk_ControlArea.cargarTabla(txtFiltroArea.Text);
            this.gvAreas.DataBind();
        }

        protected void cargarTablaPuesto()
        {
            this.gvPuestos.DataSource = hdk_ControlPuesto.cargarTabla(txtFiltroPuesto.Text);
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
           hdk_utilerias.setRowCreated(sender, e, this.Page);
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
                 ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "accionElemento", "alertify.error('Llene el campo nombre');", true);
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
                case "coordinacion":
                    if (hdk_ControlCoordinacion.insertar(txtNombre.Text))
                    {
                        this.cargarTablaCoordinacion();
                        return true;
                    }                        
                    else
                        return false;

                case "depto":
                    if (hdk_ControlDepartamento.insertar(txtNombre.Text, Convert.ToInt32(cbCoordinaciones.SelectedValue)))
                    {
                        this.cargarTablaDeptos();
                        return true;
                    }
                    else
                        return false;

                case "area":
                    if (hdk_ControlArea.insertar(txtNombre.Text))
                    {
                        this.cargarTablaArea();
                        return true;
                    }
                    else
                        return false;

                case "puesto":
                    if (hdk_ControlPuesto.insertar(txtNombre.Text))
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
                    if (hdk_ControlCoordinacion.modificar(Convert.ToInt32(gvCoordinaciones.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaCoordinacion();
                        return true;
                    }
                    else
                        return false;

                case "depto":
                    if (hdk_ControlDepartamento.modificar(Convert.ToInt32(gvDeptos.SelectedDataKey.Value), txtNombre.Text, Convert.ToInt32(cbCoordinaciones.SelectedValue)))
                    {
                        this.cargarTablaDeptos();
                        return true;
                    }
                    else
                        return false;

                case "area":
                    if (hdk_ControlArea.modificar(Convert.ToInt32(gvAreas.SelectedDataKey.Value), txtNombre.Text))
                    {
                        this.cargarTablaArea();
                        return true;
                    }
                    else
                        return false;

                case "puesto":
                    if (hdk_ControlPuesto.modificar(Convert.ToInt32(gvPuestos.SelectedDataKey.Value), txtNombre.Text))
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
                        tblcoordinacion coordSeleccionada = hdk_ControlCoordinacion.obtenerCoordinacion(Convert.ToInt32(gvCoordinaciones.SelectedDataKey.Value));
                        this.configurarModal("Editar coordinaciones", coordSeleccionada.nomCoordinacion, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarDepto":
                    if (gvDeptos.SelectedIndex != -1)
                    {
                        tbldepartamento deptoSeleccionado = hdk_ControlDepartamento.obtenerDepto(Convert.ToInt32(gvDeptos.SelectedDataKey.Value));
                        this.cbCoordinaciones.SelectedValue = deptoSeleccionado.coordinacion.ToString();
                        this.configurarModal("Editar departamentos", deptoSeleccionado.nomDepto, true);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarArea":
                    if (gvAreas.SelectedIndex != -1)
                    {
                        tblarea areaSeleccionada = hdk_ControlArea.obtenerArea(Convert.ToInt32(gvAreas.SelectedDataKey.Value));
                        this.configurarModal("Editar áreas", areaSeleccionada.nomArea, false);
                        seleccionado = true;
                    }
                    break;

                case "abrirEditarPuesto":
                    if (gvPuestos.SelectedIndex != -1)
                    {
                        tblpuesto puestoSeleccionado = hdk_ControlPuesto.obtenerPuesto(Convert.ToInt32(gvPuestos.SelectedDataKey.Value));
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
                ScriptManager.RegisterStartupScript(this.updateModalNuevo, GetType(), "insertarElemento", "alertify.error('Seleccione el elemento a modificar');", true);
            
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

        protected void cbFiltroCoord_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cargarTablaDeptos();
        }
    }
}