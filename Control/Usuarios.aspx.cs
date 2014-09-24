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

namespace HelpDeskWeb.Control
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
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).nomUsuario;
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
            if ((Convert.ToInt32(Session["Accion"])) == 0)
            {
                if (controlUsuario.insertar(txtNomUsuario.Text, txtNomCompleto.Text, Convert.ToInt32(cbTipoUs.SelectedValue), Convert.ToInt32(cbDepto.SelectedValue), txtExtension.Text, txtCorreo.Text, txtPassword.Text, Convert.ToInt32(cbArea.SelectedValue), Convert.ToInt32(cbPuesto.SelectedValue), Convert.ToInt32(cbInstitucion.SelectedValue)))
                {
                    this.cargarTabla();
                }
            }
            else
            {
                if (controlUsuario.modificar(Convert.ToInt32(gvUsuarios.SelectedDataKey.Value.ToString()), txtNomUsuario.Text, txtNomCompleto.Text, Convert.ToInt32(cbTipoUs.SelectedValue), Convert.ToInt32(cbDepto.SelectedValue), txtExtension.Text, txtCorreo.Text, txtPassword.Text, Convert.ToInt32(cbArea.SelectedValue), Convert.ToInt32(cbPuesto.SelectedValue), Convert.ToInt32(cbInstitucion.SelectedValue)))
                {
                    this.cargarTabla();

                }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            lbelTituloModal.Text = "Alta de usuarios";
            utilerias.limpiarControles(new object[]{txtCorreo, txtExtension, txtNomCompleto, txtNomUsuario, cbArea, cbCoordinaciones, cbDepto, cbInstitucion, cbPuesto, cbTipoUs});
            txtPassword.Attributes.Remove("Value");
            Session["Accion"] = 0;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            lbelTituloModal.Text = "Modificar usuario";
            int idUsuario = Convert.ToInt32(gvUsuarios.SelectedDataKey.Value.ToString());
            tblusuario usuario = controlUsuario.obtenerUsuario(idUsuario);
            txtNomUsuario.Text = usuario.nomUsuario;
            txtNomCompleto.Text = usuario.nomCompleto;
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
            Session["Accion"] = 1;
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            this.cargarTabla();
        }

        protected void btnFiltro_Click(object sender, EventArgs e)
        {
            this.cargarTabla();
        }
    }
}