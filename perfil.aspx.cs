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
        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this, true, 2, 2);
            tblusuario usuario = hdk_ControlUsuario.obtenerUsuario(hdk_ControlUsuario.obtenerUsuarioDeSession(this).idUsuario);
            this.cargarCombos();
            txtNombre.Text = usuario.nombre;
            txtApellidos.Text = usuario.apellidos;
            txtNombreUsuario.Text = usuario.username;
            txtPassword.Attributes.Add("Value", usuario.password);
            txtTelefono.Text = usuario.exTel;
            cbTipoUsuario.SelectedValue = usuario.tipoUsuario.ToString();
            cbArea.SelectedValue = usuario.area.ToString();
            cbInstitucion.SelectedValue = usuario.institucion.ToString();
            this.cambiarCorreo(usuario.institucion);
            string[] correoDividio = usuario.correo.Split('@');          
            txtCorreo.Text = correoDividio[0];
            lbelInstitucion.Text = "@" + correoDividio[1];
            cbPuesto.SelectedValue = usuario.puesto.ToString();
            int idCoordinacion = hdk_ControlCoordinacion.obtenerCoordinacion(usuario.depto).idCoordinacion;
            this.cargarComboDepto(idCoordinacion);
            cbDepto.SelectedValue = usuario.depto.ToString();
            cbCoordinacion.SelectedValue = idCoordinacion.ToString();
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
           // this.cambiarCorreo(Convert.ToInt32((sender as DropDownList).SelectedValue));
            lbelInstitucion.Text = "ASDASDASD";
        }

    }
}