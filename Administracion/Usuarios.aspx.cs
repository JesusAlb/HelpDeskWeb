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
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).username;
            if (!IsPostBack)
            {
                this.cargarTabla();
                this.cargarCombos();
            }
          
        }

        protected void cargarCombos()
        {
            cbCoordinaciones.DataSource = hdk_ControlDepartamento.cargarComboCord(false);
            cbArea.DataSource = hdk_ControlArea.cargarCombo();
            cbPuesto.DataSource = hdk_ControlPuesto.cargarCombo();
            cbInstitucion.DataSource = hdk_ControlInstitucion.cargarTablaInsitucion();
            cbInstitucion.DataBind();
            cbCoordinaciones.DataBind();
            cbArea.DataBind();
            cbPuesto.DataBind();
        }

        protected void cargarDeptos(int idCoord)
        {
            cbDepto.DataSource = hdk_ControlDepartamento.cargarComboDep(idCoord);
            cbDepto.DataBind();
        }

        protected void cargarTabla()
        {
            gvUsuarios.DataSource = hdk_ControlUsuario.cargarTabla(txtFiltro.Text);
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
                        tblusuario usuario = hdk_ControlUsuario.obtenerUsuario(idUsuario);
                        txtNomUsuario.Text = usuario.username;
                        txtNombre.Text = usuario.nombre;
                        txtApellido.Text = usuario.apellidos;
                        txtCorreo.Text = usuario.correo;
                        txtExtension.Text = usuario.exTel;
                        txtPassword.Attributes.Add("Value", usuario.password);
                        cbTipoUs.SelectedValue = usuario.tipoUsuario.ToString();
                        cbInstitucion.SelectedValue = usuario.institucion.ToString();
                        cbArea.SelectedValue = usuario.area.ToString();
                        cbPuesto.SelectedValue = usuario.puesto.ToString();
                        cbCoordinaciones.SelectedValue = ((tbldepartamento)hdk_ControlDepartamento.obtenerDepto(usuario.depto)).coordinacion.ToString();
                        cbDepto.DataSource = hdk_ControlDepartamento.cargarComboDep(Convert.ToInt32(cbCoordinaciones.SelectedValue));
                        cbDepto.DataBind();
                        cbDepto.SelectedValue = usuario.depto.ToString();
                        ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "abrirModal", "$('#ModalNuevo').modal('show');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "NoSeleccionado", "alertify.error('Seleccione al usuario')", true);
                    }
                    break;
            }
        }

        protected void btnGrabar_Command(object sender, CommandEventArgs e){
            if (hdk_utilerias.verificarCamposVacios(new string[] { txtNomUsuario.Text, txtNombre.Text, txtApellido.Text, cbTipoUs.Text, cbDepto.Text, txtExtension.Text, txtCorreo.Text, txtPassword.Text, cbArea.Text, cbPuesto.Text, cbInstitucion.Text }) && cbDepto.SelectedIndex != -1)
            {
                int resultado = 0;
                switch (e.CommandName)
                {
                    case "nuevo":
                        resultado = hdk_ControlUsuario.insertar(txtNomUsuario.Text, txtNombre.Text, txtApellido.Text, Convert.ToInt32(cbTipoUs.SelectedValue), Convert.ToInt32(cbDepto.SelectedValue), txtExtension.Text, txtCorreo.Text, txtPassword.Text, Convert.ToInt32(cbArea.SelectedValue), Convert.ToInt32(cbPuesto.SelectedValue), Convert.ToInt32(cbInstitucion.SelectedValue));
                        break;

                    case "editar":
                        resultado = hdk_ControlUsuario.modificar(Convert.ToInt32(gvUsuarios.SelectedDataKey.Value), txtNomUsuario.Text, txtNombre.Text, txtApellido.Text, Convert.ToInt32(cbTipoUs.SelectedValue), Convert.ToInt32(cbDepto.SelectedValue), txtExtension.Text, txtCorreo.Text, txtPassword.Text, Convert.ToInt32(cbArea.SelectedValue), Convert.ToInt32(cbPuesto.SelectedValue), Convert.ToInt32(cbInstitucion.SelectedValue));
                        break;
                }
                if (resultado == 1)
                {
                    this.cargarTabla();
                    ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "cerrarModal", "$('#ModalNuevo').modal('hide');", true);
                }
                else if (resultado == 0)
                {
                    ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "noCompleto", "alertify.error('Error de conexión')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "noCompleto", "alertify.error('Usuario en uso')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateModal, GetType(), "noCompleto", "alertify.error('Llene todos los campos')", true);
            }
        }
    }
}