using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlAltas;
using HelpDeskWeb.Datos;
using HelpDeskWeb.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Control
{
    public partial class Usuarios : System.Web.UI.Page
    {

        hdk_ControlAcceso Control;
        hdk_ControlUsuario controlUsuario;
        hdk_ControlDepartamento cDepto;
        hdk_ControlArea cArea;
        hdk_ControlPuesto cPuesto;


        protected void Page_Load(object sender, EventArgs e)
        {
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).nomUsuario;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlUsuario = new hdk_ControlUsuario(Control);
            cDepto = new hdk_ControlDepartamento(Control);
            cArea = new hdk_ControlArea(Control);
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
            cbCoordinaciones.DataBind();
            cbArea.DataBind();
            cbPuesto.DataBind();
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
            cbDepto.DataSource = cDepto.cargarComboDep(Convert.ToInt32((sender as DropDownList).SelectedValue));
            cbDepto.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            btnNuevo.Text = "SI FUNCIONA";

           if (gvUsuarios.SelectedIndex != -1)
            {
                int idUsuario = Convert.ToInt32(gvUsuarios.SelectedDataKey.Value.ToString());
                btnModificar.Text = idUsuario.ToString();
                ViewUsuario usuario =  controlUsuario.obtenerUsuario(idUsuario);
                txtNomUsuario.Text = usuario.nomUsuario;
                txtNomCompleto.Text = usuario.nomCompleto;
                txtCorreo.Text = usuario.correo;
                txtExtension.Text = usuario.exTel;
                txtPassword.Text = usuario.password;
                cbArea.Text = usuario.nomArea;
                cbCoordinaciones.Text = usuario.nomCoordinacion;
                cbPuesto.Text = usuario.nomPuesto;
                cbTipoUs.Text = usuario.tipoUsuarioString;
                cbDepto.DataSource = cDepto.cargarComboDep(Convert.ToInt32(cbCoordinaciones.SelectedValue));
                cbDepto.DataBind();
                cbDepto.SelectedItem.Text = usuario.nomDepto;
            }
        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
          /*   
                int idUsuario = Convert.ToInt32(gvUsuarios.SelectedDataKey.Value.ToString());
                btnModificar.Text = idUsuario.ToString();
                ViewUsuario usuario =  controlUsuario.obtenerUsuario(idUsuario);
                txtNomUsuario.Text = usuario.nomUsuario;
                txtNomCompleto.Text = usuario.nomCompleto;
                txtCorreo.Text = usuario.correo;
                txtExtension.Text = usuario.exTel;
                txtPassword.Text = usuario.password;
                cbArea.SelectedItem.Text= usuario.nomArea;
                cbCoordinaciones.SelectedItem.Text = usuario.nomCoordinacion;
                cbPuesto.SelectedItem.Text = usuario.nomPuesto;
                cbTipoUs.SelectedItem.Text = usuario.tipoUsuarioString;
                cbDepto.DataSource = cDepto.cargarComboDep(Convert.ToInt32(cbCoordinaciones.SelectedValue));
                cbDepto.DataBind();
                cbDepto.SelectedItem.Text = usuario.nomDepto;*/
        }

    }
}