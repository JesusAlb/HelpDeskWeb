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

namespace HelpDeskWeb.Administracion
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this, true, 0, 0);
            lbelUsuario.Text = " " + controlUsuario.obtenerUsuarioDeSession(this).nombre_usuario;
            if (!IsPostBack)
            {
                this.cargarTabla();
                this.cargarCombos();
            }
            else
            {
                if (Request["__EVENTTARGET"] == "txtFiltro")
                    this.cargarTabla();
            }
        }

        protected void cargarCombos()
        {
            cbCoordinaciones.DataSource = controlCoordinacion.obtenerDataSource(false, "");
            cbArea.DataSource = controlArea.obtenerDataSource("");
            cbPuesto.DataSource = controlPuesto.obtenerDataSource("");
            cbInstitucion.DataSource = controlInstitucion.obtenerDataSource();
            cbInstitucion.DataBind();
            cbCoordinaciones.DataBind();
            cbArea.DataBind();
            cbPuesto.DataBind();
        }

        protected void cargarDeptos(int idCoord)
        {
            cbDepto.DataSource = accionesDepto.obtenerDataSourceComboBox(idCoord);
            cbDepto.DataBind();
        }

        protected void cargarTabla()
        {
            gvUsuarios.DataSource = controlUsuario.obtenerDataSource(txtFiltro.Text);
            gvUsuarios.DataBind();
        }

        protected void gvUsuarios_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias.setRowCreated(sender, e, this.Page);
        }

        protected void cbCoordinaciones_SelectedIndexChanged(object sender, EventArgs e)
        {         
            this.cargarDeptos(Convert.ToInt32((sender as DropDownList).SelectedValue));
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            this.cargarTabla();
        }

        protected void btnFiltro_Click(object sender, EventArgs e)
        {
            this.cargarTabla();
        }

        protected void btnAccionarModal_Command(object sender, CommandEventArgs e)
        {
            btnGrabar.CommandName = e.CommandName;

            switch(e.CommandName){

                case "nuevo":
                    lbelTituloModal.Text = "Alta de usuarios";
                    hdk_utilerias.limpiarControles(this.panelFormulario.Controls);
                    txtPassword.Attributes.Remove("Value");
                    this.cargarDeptos(1);
                    ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "abrirModal", "$('#ModalNuevo').modal('show');", true);
                    break;

                case "editar":
                    if (gvUsuarios.SelectedIndex != -1)
                    {
                        lbelTituloModal.Text = "Modificar usuario";
                        int idUsuario = Convert.ToInt32(gvUsuarios.SelectedDataKey.Value);
                        tblusuario usuario = controlUsuario.obtenerUsuario(idUsuario);
                        username.Value = usuario.nombre_usuario;
                        txtNomUsuario.Text = usuario.nombre_usuario;
                        txtNombre.Text = usuario.nombre;
                        txtApellido.Text = usuario.apellidos;
                        string[] parteCorreo = usuario.correo.Split('@'); 
                        txtCorreo.Text = parteCorreo[0];
                        txtExtension.Text = usuario.extension_telefonica;
                        txtPassword.Attributes.Add("Value", usuario.password);
                        cbTipoUs.SelectedValue = usuario.tipo.ToString();
                        cbInstitucion.SelectedValue = usuario.fk_idinstitucion.ToString();
                        cbArea.SelectedValue = usuario.fk_idarea.ToString();
                        cbPuesto.SelectedValue = usuario.fk_idpuesto.ToString();
                        cbCoordinaciones.SelectedValue = ((tbldepartamento)accionesDepto.obtenerDepto(usuario.fk_iddepto)).fk_idcoordinacion.ToString();
                        cbDepto.DataSource = accionesDepto.obtenerDataSourceComboBox(Convert.ToInt32(cbCoordinaciones.SelectedValue));
                        cbDepto.DataBind();
                        cbDepto.SelectedValue = usuario.fk_iddepto.ToString();
                        ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "abrirModal", "$('#ModalNuevo').modal('show');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "NoSeleccionado", "alertify.error('Seleccione el usuario a modificar')", true);
                    }
                    break;
            }
        }

        protected void btnGrabar_Command(object sender, CommandEventArgs e){
            if (hdk_utilerias.verificarCamposVacios(new string[] { txtNomUsuario.Text, txtNombre.Text, txtApellido.Text, cbTipoUs.Text, cbDepto.Text, txtExtension.Text, txtCorreo.Text, txtPassword.Text, cbArea.Text, cbPuesto.Text, cbInstitucion.Text }) && cbDepto.SelectedIndex != -1)
            {
                int resultado = 0;
                string mensaje = null;
                if (txtPassword.Text.Equals(txtPasswordVer.Text))
                {
                    string correo = txtCorreo.Text + lbelCorreo.Text;

                    switch (e.CommandName)
                    {
                        case "nuevo":
                            resultado = controlUsuario.insertar(txtNomUsuario.Text, "", txtNombre.Text, txtApellido.Text, Convert.ToInt32(cbTipoUs.SelectedValue), Convert.ToInt32(cbDepto.SelectedValue), txtExtension.Text, correo, txtPassword.Text, Convert.ToInt32(cbArea.SelectedValue), Convert.ToInt32(cbPuesto.SelectedValue), Convert.ToInt32(cbInstitucion.SelectedValue));
                            mensaje = "Usuario registrado exitosamente";
                            break;

                        case "editar":
                            resultado = controlUsuario.modificar(Convert.ToInt32(gvUsuarios.SelectedDataKey.Value), txtNomUsuario.Text, username.Value, txtNombre.Text, txtApellido.Text, Convert.ToInt32(cbTipoUs.SelectedValue), Convert.ToInt32(cbDepto.SelectedValue), txtExtension.Text, correo, txtPassword.Text, Convert.ToInt32(cbArea.SelectedValue), Convert.ToInt32(cbPuesto.SelectedValue), Convert.ToInt32(cbInstitucion.SelectedValue));
                            mensaje = "Usuario actualizado exitosamente";
                            break;
                    }
                    if (resultado == 1)
                    {
                        this.cargarTabla();
                        ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "cerrarModal", "$('#ModalNuevo').modal('hide');", true);
                        ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "noCompleto", "alertify.success('" + mensaje + "');", true);
                    }
                    else if (resultado == 0)
                    {
                        ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "noCompleto", "alertify.error('Error de conexión');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "noCompleto", "alertify.error('Usuario en uso');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "noCompleto", "alertify.error('Contraseña de verficiación incorrecta');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "noCompleto", "alertify.error('Llene todos los campos');", true);
            }
        }

        protected void cbInstitucion_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cambiarCorreo(Convert.ToInt32((sender as DropDownList).SelectedValue));
        }

        protected void cambiarCorreo(int institucion)
        {
            lbelCorreo.Text = "@" + controlInstitucion.obtenerInstitucion(institucion).correo;
        }
    }
}