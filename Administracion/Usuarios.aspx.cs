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

namespace HelpDeskWeb.Administracion
{
    public partial class Usuarios : System.Web.UI.Page
    {

        hdk_ControlAcceso Control;
        hdk_ControlUsuario controlUsuario;
        hdk_ControlDepartamento cDepto;
        hdk_ControlArea cArea;
        hdk_ControlPuesto cPuesto;
        hdk_utilerias utilerias;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DatosUsuario"] == null)
            {
                Response.Redirect("index.aspx");
            }
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).username;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlUsuario = new hdk_ControlUsuario(Control);
            cDepto = new hdk_ControlDepartamento(Control);
            cArea = new hdk_ControlArea(Control);
            utilerias = new hdk_utilerias();
            cPuesto = new hdk_ControlPuesto(Control);
            if (!IsPostBack)
            {
                this.cargarTabla();
                this.cargarCombos();
            }
          
        }

        protected void cargarCombos()
        {
            cbCoordinaciones.DataSource = cDepto.cargarComboCord(false);
            cbArea.DataSource = cArea.cargarCombo();
            cbPuesto.DataSource = cPuesto.cargarCombo();
            cbInstitucion.DataSource = Control.DB.tblinstitucions.Where(a=> a.status == true).ToList();
            cbInstitucion.DataBind();
            cbCoordinaciones.DataBind();
            cbArea.DataBind();
            cbPuesto.DataBind();
        }

        protected void cargarDeptos(int idCoord)
        {
            cbDepto.DataSource = cDepto.cargarComboDep(idCoord);
            cbDepto.DataBind();
        }

        protected void cargarTabla()
        {           
            gvUsuarios.DataSource = controlUsuario.cargarTabla(txtFiltro.Text);
            gvUsuarios.DataBind();
        }

        protected void gvUsuarios_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias utilerias = new hdk_utilerias();
            utilerias.setRowCreated(sender, e);
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
                    forControls.limpiarFormulario(this.panelFormulario.Controls);
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
                        cbCoordinaciones.SelectedValue = ((tbldepartamento)cDepto.obtenerDepto(usuario.depto)).coordinacion.ToString();
                        cbDepto.DataSource = cDepto.cargarComboDep(Convert.ToInt32(cbCoordinaciones.SelectedValue));
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
            if (forControls.verificarCamposVacios(new string[] { txtNomUsuario.Text, txtNombre.Text, txtPassword.Text, txtPasswordVer.Text, txtExtension.Text, txtCorreo.Text }) && cbDepto.SelectedIndex != -1)
            {
                int resultado = 0;
                switch (e.CommandName)
                {
                    case "nuevo":
                        resultado = controlUsuario.insertar(txtNomUsuario.Text, txtNombre.Text, txtApellido.Text, Convert.ToInt32(cbTipoUs.SelectedValue), Convert.ToInt32(cbDepto.SelectedValue), txtExtension.Text, txtCorreo.Text, txtPassword.Text, Convert.ToInt32(cbArea.SelectedValue), Convert.ToInt32(cbPuesto.SelectedValue), Convert.ToInt32(cbInstitucion.SelectedValue));
                        break;

                    case "editar":
                        resultado = controlUsuario.modificar(Convert.ToInt32(gvUsuarios.SelectedDataKey.Value), txtNomUsuario.Text, txtNombre.Text, txtApellido.Text, Convert.ToInt32(cbTipoUs.SelectedValue), Convert.ToInt32(cbDepto.SelectedValue), txtExtension.Text, txtCorreo.Text, txtPassword.Text, Convert.ToInt32(cbArea.SelectedValue), Convert.ToInt32(cbPuesto.SelectedValue), Convert.ToInt32(cbInstitucion.SelectedValue));
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