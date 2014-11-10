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
            hdk_utilerias.checarSession(this, true, 2, 2);
            usuarioActual = hdk_ControlUsuario.obtenerUsuario(hdk_ControlUsuario.obtenerUsuarioDeSession(this).idUsuario);
            if (!IsPostBack)
            {
                lbelUsuario.Text = usuarioActual.username;
                this.cargarCombos();
                txtNombre.Text = usuarioActual.nombre;
                txtApellidos.Text = usuarioActual.apellidos;
                txtNombreUsuario.Text = usuarioActual.username;
                txtPassword.Attributes.Add("Value", usuarioActual.password);
                txtTelefono.Text = usuarioActual.exTel;
                cbTipoUsuario.SelectedValue = usuarioActual.tipoUsuario.ToString();
                cbArea.SelectedValue = usuarioActual.area.ToString();
                cbInstitucion.SelectedValue = usuarioActual.institucion.ToString();
                this.cambiarCorreo(usuarioActual.institucion);
                string[] correoDividio = usuarioActual.correo.Split('@');
                txtCorreo.Text = correoDividio[0];
                lbelInstitucion.Text = "@" + correoDividio[1];
                cbPuesto.SelectedValue = usuarioActual.puesto.ToString();
                int idCoordinacion = hdk_ControlCoordinacion.obtenerCoordinacion(usuarioActual.depto).idCoordinacion;
                this.cargarComboDepto(idCoordinacion);
                cbDepto.SelectedValue = usuarioActual.depto.ToString();
                cbCoordinacion.SelectedValue = idCoordinacion.ToString();
            }
        }

        protected void cargarCombos()
        {   
            cbCoordinacion.DataSource = hdk_ControlDepartamento.cargarComboCord(false);
            cbArea.DataSource = hdk_ControlArea.cargarCombo();
            cbPuesto.DataSource = hdk_ControlPuesto.cargarCombo();
            cbInstitucion.DataSource = hdk_ControlInstitucion.cargarTablaInsitucion();
            cbInstitucion.DataBind();
            cbCoordinacion.DataBind();
            cbArea.DataBind();
            cbPuesto.DataBind();
        }

        protected void cargarComboDepto(int idCoordinacion)
        {
            cbDepto.DataSource = hdk_ControlDepartamento.cargarComboDep(idCoordinacion);
            cbDepto.DataBind();
        }

        protected void cbCoordinacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cargarComboDepto(Convert.ToInt32((sender as DropDownList).SelectedValue));
        }

        protected void cambiarCorreo(int institucion)
        {
            lbelInstitucion.Text = "@" + hdk_ControlInstitucion.obtenerInstitucion(institucion).correoInstitucion;
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
               if(hdk_ControlUsuario.modificar(hdk_ControlUsuario.obtenerUsuarioDeSession(this).idUsuario, txtNombreUsuario.Text, hdk_ControlUsuario.obtenerUsuarioDeSession(this).username, txtNombre.Text, txtApellidos.Text, Convert.ToInt32(cbTipoUsuario.SelectedValue), Convert.ToInt32(cbDepto.SelectedValue), txtTelefono.Text, txtCorreo.Text + lbelInstitucion.Text, txtPassword.Text, Convert.ToInt32(cbArea.SelectedValue), Convert.ToInt32(cbPuesto.SelectedValue), Convert.ToInt32(cbInstitucion.SelectedValue)) == 1){
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