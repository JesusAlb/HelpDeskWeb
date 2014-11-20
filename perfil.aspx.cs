using HelpDeskWeb.ControlAltas;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.Datos;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb
{
    public partial class perfil : System.Web.UI.Page
    {
        tblusuario usuarioActual;

        protected void Page_Load(object sender, EventArgs e)
        {
            Utilerias.checarSession(this, true, 2, 2);
            usuarioActual = controlUsuario.obtenerUsuario(controlUsuario.obtenerUsuarioDeSession(this).id);
            if (!IsPostBack)
            {
                lbelUsuario.Text = usuarioActual.nombre_usuario;
                this.cargarCombos();
                txtNombre.Text = usuarioActual.nombre;
                txtApellidos.Text = usuarioActual.apellidos;
                txtNombreUsuario.Text = usuarioActual.nombre_usuario;
                txtPassword.Attributes.Add("Value", usuarioActual.password);
                txtTelefono.Text = usuarioActual.extension_telefonica;
                cbTipoUsuario.SelectedValue = usuarioActual.tipo.ToString();
                cbArea.SelectedValue = usuarioActual.fk_idarea.ToString();
                cbInstitucion.SelectedValue = usuarioActual.fk_idinstitucion.ToString();
                this.cambiarCorreo(usuarioActual.fk_idinstitucion);
                string[] correoDividio = usuarioActual.correo.Split('@');
                txtCorreo.Text = correoDividio[0];
                lbelInstitucion.Text = "@" + correoDividio[1];
                cbPuesto.SelectedValue = usuarioActual.fk_idpuesto.ToString();
                int idCoordinacion = controlCoordinacion.obtenerCoordinacion(usuarioActual.fk_iddepto).id;
                this.cargarComboDepto(idCoordinacion);
                cbDepto.SelectedValue = usuarioActual.fk_iddepto.ToString();
                cbCoordinacion.SelectedValue = idCoordinacion.ToString();
            }
        }

        protected void cargarCombos()
        {
            cbCoordinacion.DataSource = controlCoordinacion.obtenerDataSource(false, "");
            cbArea.DataSource = controlArea.obtenerDataSource("");
            cbPuesto.DataSource = controlPuesto.obtenerDataSource("");
            cbInstitucion.DataSource = controlInstitucion.obtenerDataSource();
            cbInstitucion.DataBind();
            cbCoordinacion.DataBind();
            cbArea.DataBind();
            cbPuesto.DataBind();
        }

        protected void cargarComboDepto(int idCoordinacion)
        {
            cbDepto.DataSource = accionesDepto.obtenerDataSourceComboBox(idCoordinacion);
            cbDepto.DataBind();
        }

        protected void cbCoordinacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cargarComboDepto(Convert.ToInt32((sender as DropDownList).SelectedValue));
        }

        protected void cambiarCorreo(int institucion)
        {
            lbelInstitucion.Text = "@" + controlInstitucion.obtenerInstitucion(institucion).correo;
        }

        protected void cbInstitucion_SelectedIndexChanged(object sender, EventArgs e)
        {
           this.cambiarCorreo(Convert.ToInt32((sender as DropDownList).SelectedValue));
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
                this.Response.Redirect("perfil.aspx");
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if (txtVerificarPassword.Text.Equals(txtPassword.Text))
            {
               if(controlUsuario.modificar(controlUsuario.obtenerUsuarioDeSession(this).id, txtNombreUsuario.Text, controlUsuario.obtenerUsuarioDeSession(this).nombre_usuario, txtNombre.Text, txtApellidos.Text, Convert.ToInt32(cbTipoUsuario.SelectedValue), Convert.ToInt32(cbDepto.SelectedValue), txtTelefono.Text, txtCorreo.Text + lbelInstitucion.Text, txtPassword.Text, Convert.ToInt32(cbArea.SelectedValue), Convert.ToInt32(cbPuesto.SelectedValue), Convert.ToInt32(cbInstitucion.SelectedValue)) == 1){
                    ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "Mensaje", "alertify.success('Perfil correctamente modificado');", true);
               }
               else
               {
                   ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "Mensaje", "alertify.error('Error al modificar el perfil');", true);
               }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "Mensaje", "alertify.error('Llene todos los campos');", true);
            }
        }

    }
}