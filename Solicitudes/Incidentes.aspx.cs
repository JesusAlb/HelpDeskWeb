using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlBD.Solicitudes;
using HelpDeskWeb.ControlBD.Solicitudes.Incidentes;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Solicitudes
{
    public partial class Incidentes : System.Web.UI.Page
    {
        private hdk_ControlAcceso Control;
        private hdk_ControlIncidentes controlIncidentes;
        private hdk_utilerias utilerias;
        private hdk_ControlUsuario controlUsuario;
        private ViewUsuario usuarioConectado;
        private hdk_ControlEncuestas controlEncuestas;

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioConectado = ((ViewUsuario)(Session["DatosUsuario"]));
            lbelUsuario.Text = " " + usuarioConectado.username;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlIncidentes = new hdk_ControlIncidentes(Control);
            controlUsuario = new hdk_ControlUsuario(Control);
            controlEncuestas = new hdk_ControlEncuestas(Control);
            if (!IsPostBack)
            {
                this.cargarComboFiltro();
                this.cargarTablasIncidentes();
            }
            if (Page.IsPostBack)
            {
                if (Request["__EVENTTARGET"] == "tabAbierta")
                {
                    this.limpiarSeleccion();
                    tabItemSeleccionado.Value = this.Request.Params.Get("__EVENTARGUMENT");
                }
                this.cargarTablasIncidentes();
            }
        }

        protected void limpiarSeleccion()
        {
            idIncidenteSeleccionado.Value = null;
            gvIncidentes_Abiertos.SelectedIndex = gvIncidentes_Cancelados.SelectedIndex = gvIncidentes_Cerrados.SelectedIndex = gvIncidentes_EnProceso.SelectedIndex = -1;
        }

        protected void cargarTablasIncidentes()
        {
            this.cargarTablasIncidentesLlenado(new Object[] { gvIncidentes_Abiertos, gvIncidentes_EnProceso, gvIncidentes_Cerrados, gvIncidentes_Cancelados });
        }

        protected void cargarTablasIncidentesLlenado(object[] objeto)
        {
            for (int x = 0; x < objeto.Length; x++)
            {
                if (usuarioConectado.tipoUsuario == 0)
                {
                    (objeto[x] as GridView).DataSource = controlIncidentes.cargarTablaSoporte(x, cbTipoFiltro.SelectedItem.Text, txtFiltro.Text, this.obtenerDateTimeDeString(filtroFechaInicial.Text), this.obtenerDateTimeDeString(filtroFechaFinal.Text));
                }
                else
                {
                    (objeto[x] as GridView).DataSource = controlIncidentes.cargarTablaSolicitante(usuarioConectado.idUsuario, cbTipoFiltro.SelectedItem.Text, x, txtFiltro.Text, this.obtenerDateTimeDeString(filtroFechaInicial.Text), this.obtenerDateTimeDeString(filtroFechaFinal.Text));
                }
                (objeto[x] as GridView).DataBind();
            }
        }

        protected void cargarComboBoxs()
        {
            cbTipoIncidente.DataSource = controlIncidentes.cargarComboTipo();
            cbSeguimiento.DataSource = cbSoporte.DataSource = controlUsuario.cargarComboUsuarios(0);
            cbTipoIncidente.DataBind();
            cbSoporte.DataBind();
            cbSeguimiento.DataBind();
        }

        protected void cargarComboFiltro()
        {
            cbTipoFiltro.DataSource = controlIncidentes.cargarComboTipo();
            cbTipoFiltro.DataBind();
        }

        protected void cargarTablaEncuesta(int? datasource)
        {
            if (datasource != null)
            {
                gvEncuestas.DataSource = controlEncuestas.cargarTablaEncuesta(datasource.Value);
                this.gvEncuestas.Columns[2].Visible = false;
                this.gvEncuestas.Columns[3].Visible = true;
            }
            else
            {
                gvEncuestas.DataSource = controlEncuestas.cargarTablaPreguntas(1);
                this.gvEncuestas.Columns[2].Visible = true;
                this.gvEncuestas.Columns[3].Visible = false;
            }

            gvEncuestas.DataBind();
        }

        protected DateTime? obtenerDateTimeDeString(string cadena)
        {
            try
            {
                return Convert.ToDateTime(cadena);
            }
            catch
            {
                return null;
            }
        }

        protected void gvIncidentes_RowCreated(object sender, GridViewRowEventArgs e)
        {
            utilerias = new hdk_utilerias();
            utilerias.setRowCreated(sender, e);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrWhiteSpace(txtDescripcion.Text))
            {
                if (controlIncidentes.insertarIncidente(usuarioConectado.idUsuario, txtDescripcion.Text))
                {
                    this.cargarTablasIncidentes();
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarNuevo, this.GetType(), "SalirVentana", "$('#ModalNuevo').modal('hide');", true);
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarNuevo, this.GetType(), "nuevoIncidente", "alertify.alert('Correcto', 'Incidente creado correctamente', 'onok');", true);
                    
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarNuevo, this.GetType(), "nuevoIncidenteIncorrecto", "alertify.error('Error al crear el incidente');", true);
                }
            }
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(tabItemSeleccionado.Value) < 2 && !String.IsNullOrWhiteSpace(idIncidenteSeleccionado.Value))
            {
                this.cargarComboBoxs();
                tblincidente itemIncidente = controlIncidentes.obtenerIncidente(Convert.ToInt32(idIncidenteSeleccionado.Value));
                cbTipoIncidente.SelectedValue = itemIncidente.tipo.ToString();
                cbPrioridad.Text = itemIncidente.prioridad;
                cbSoporte.SelectedValue = itemIncidente.soporte.ToString();
                cbSeguimiento.SelectedValue = itemIncidente.seguimiento.ToString();
                ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "btnAsginarActivado", "$('#ModalAsignar').modal('show');", true);     
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "AsignarIncidenteTab", "alertify.alert('Error', 'Seleccione un incidente abierto o en proceso', 'onok');", true);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "btnNuevoActivado", "$('#ModalNuevo').modal('show');", true);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(tabItemSeleccionado.Value) < 2 && !String.IsNullOrWhiteSpace(idIncidenteSeleccionado.Value))
            {
                    if (controlIncidentes.cambiarStatus(Convert.ToInt32(idIncidenteSeleccionado.Value), 3))
                    {
                        this.cargarTablasIncidentes();
                        ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "CancelarIncidente", "alertify.alert('Correcto', 'Incidente cancelado correctamente', 'onok');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "CancelarIncidenteIncorrecto", "alertify.error('Error al cancelar el incidente');", true);
                    }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "CancelarIncidenteTab", "alertify.alert('Error', 'Seleccione un incidente " + tabItemSeleccionado.Value + " abierto o en proceso', 'onok');", true);
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(tabItemSeleccionado.Value) == 1 && !String.IsNullOrWhiteSpace(idIncidenteSeleccionado.Value))
            {
                    ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "btnCerrarActivado", "$('#ModalCerrar').modal('show');", true);                   
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "CerrarIncidenteTab", "alertify.alert('Error', 'Seleccione un incidente en proceso', 'onok');", true);
            }
        }

        protected void gvIncidentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            idIncidenteSeleccionado.Value = (sender as GridView).SelectedDataKey.Value.ToString();
        }

        protected void BtnGrabarAsignacion_Click(object sender, EventArgs e)
        {
            if (controlIncidentes.asignarSoporte(Convert.ToInt32(idIncidenteSeleccionado.Value), Convert.ToInt32(cbSoporte.SelectedValue), Convert.ToInt32(cbSeguimiento.SelectedValue), cbPrioridad.Text, Convert.ToInt32(cbTipoIncidente.SelectedValue)))
            {
                this.cargarTablasIncidentes();
                ScriptManager.RegisterStartupScript(this.UpdateGrabarAsignacion, this.GetType(), "SalirVentanaAsign", "$('#ModalAsignar').modal('hide');", true);
                ScriptManager.RegisterStartupScript(this.UpdateGrabarAsignacion, this.GetType(), "AsignacionCorrecta", "alertify.alert('Correcto', 'Soporte asignado correctamente', 'onok');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateGrabarAsignacion, this.GetType(), "AsignacionCorrecta", "alertify.error('Correcto', 'Error al asignar el soporte', 'onok');", true);
            }
        }

        protected void btnGrabarCerrar_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrWhiteSpace(txtAcciones.Text) || !String.IsNullOrWhiteSpace(txtSolucion.Text))
            {
                if (controlIncidentes.cerrarIncidente(Convert.ToInt32(idIncidenteSeleccionado.Value), txtAcciones.Text, txtSolucion.Text))
                {
                    this.cargarTablasIncidentes();
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarCerrar, this.GetType(), "SalirVentanaCerrar", "$('#ModalCerrar').modal('hide');", true);
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarCerrar, this.GetType(), "CerrarCorrecta", "alertify.alert('Correcto', 'Incidente cerrado correctamente', 'onok');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarAsignacion, this.GetType(), "CerrarCorrecta", "alertify.error('Correcto', 'Error al cerrar el incidente', 'onok');", true);
                }
            }
        }

        protected void gvIncidentes_Cerrados_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton btnEncuestas = e.Row.FindControl("btnEncuesta") as ImageButton;
                if (btnEncuestas != null)
                {
                    btnEncuestas.ImageAlign = ImageAlign.AbsMiddle;

                    if (Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "statusCal_Servicio")))
                    {
                        btnEncuestas.ImageUrl = "../Imagenes/siEncuesta3.png";
                    }
                    else
                    {
                        btnEncuestas.ImageUrl = "../Imagenes/noEncuesta3.png";
                    }
                }

                this.insertarImagenPrioridad(e);
            }
        }

        protected void insertarImagenPrioridad(GridViewRowEventArgs e)
        {
            Image prioridad = e.Row.FindControl("imgPrioridad") as Image;
            if (prioridad != null)
            {
                string prioridadString = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "prioridad"));
                prioridad.ToolTip = prioridadString;
                if (prioridadString.Equals("Alta"))
                {
                    prioridad.ImageUrl = "../Imagenes/pAlta.png";
                }
                else if (prioridadString.Equals("Normal"))
                {
                    prioridad.ImageUrl = "../Imagenes/pNormal.png";
                }
                else
                {
                    prioridad.ImageUrl = "../Imagenes/pMedia.png";
                }
            }
        }


        protected double promedioEncuesta()
        {
            double suma = 0;
            foreach (GridViewRow row in gvEncuestas.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList cbRespuesta = row.FindControl("cbRespuesta") as DropDownList;
                    suma = suma + Convert.ToInt16(cbRespuesta.Text);
                }
            }
            return suma / Convert.ToDouble(gvEncuestas.Rows.Count);
        }

        protected void cambiarImagenEncuesta(double promedio)
        {
            txtPromedio.Text = promedio.ToString();

            if (promedio <= 2.5)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel0.png";
            else if (promedio > 2.5 && promedio <= 4)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel1.png";
            else if (promedio > 4 && promedio <= 5.5)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel2.png";
            else if (promedio > 5.5 && promedio <= 7)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel3.png";
            else if (promedio > 7 && promedio <= 8.5)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel4.png";
            else if (promedio > 8.5 && promedio <= 10)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel5.png";
        }

        protected void btnEncuesta_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            TableCell celda = (TableCell)imgBtn.Parent;
            GridViewRow renglon = (GridViewRow)celda.Parent;
            gvIncidentes_Cerrados.SelectedIndex = renglon.RowIndex;
            VistaIncidentesCerrado incidenteCerrado = controlIncidentes.obtenerIncidenteCerrado(Convert.ToInt32(gvIncidentes_Cerrados.SelectedDataKey.Value.ToString()));
            idCalidad.Value = incidenteCerrado.idCalidad_Servicio.ToString();
            txtSolicitante.Text = incidenteCerrado.solicitante;
            if (incidenteCerrado.statusCal_Servicio)
            {
                this.cargarTablaEncuesta(incidenteCerrado.idCalidad_Servicio);
                txtPromedio.Text = incidenteCerrado.promedioCalidad.ToString();
                this.cambiarImagenEncuesta(incidenteCerrado.promedioCalidad.Value);
                txtObEncuestas.Text = incidenteCerrado.observacionesServicio;
                txtObEncuestas.Enabled = false;
                btnGrabarEncuesta.Text = "Aceptar";
            }
            else
            {
                this.cargarTablaEncuesta(null);
                txtObEncuestas.Enabled = true;
                txtObEncuestas.Text = "";
                txtPromedio.Text = "1";
                btnGrabarEncuesta.Text = "Grabar";
            }

            ScriptManager.RegisterStartupScript(this.UpIncidentesCerrados, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('show');", true);
        }

        protected void btnGrabarEncuesta_Click(object sender, EventArgs e)
        {
            if (btnGrabarEncuesta.Text.Equals("Aceptar"))
            {
                ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('hide');", true);
            }
            else
            {
                bool correcto = true;
                foreach (GridViewRow row in gvEncuestas.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        DropDownList cbRespuesta = row.FindControl("cbRespuesta") as DropDownList;
                        if (controlEncuestas.insertarRespuesta(Convert.ToInt32(idCalidad.Value), Convert.ToInt32(gvEncuestas.DataKeys[row.DataItemIndex].Value), Convert.ToInt32(cbRespuesta.SelectedValue)))
                        {
                            correcto = true;
                        }
                        else
                        {
                            correcto = false;
                        }
                    }
                }
                if (correcto)
                {
                    if (controlEncuestas.guardarCambiosEncuesta(Convert.ToInt32(idCalidad.Value), txtObEncuestas.Text, float.Parse(txtPromedio.Text, System.Globalization.CultureInfo.InvariantCulture)))
                    {
                        ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('hide');", true);
                        this.cargarTablasIncidentes();
                        ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "EncuestaGuarda", "alertify.success('Se registro la encuesta');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "EncuestNoGuardada", "alertify.error('No se pudo registrar la encuesta');", true);
                    }
                }
            }
        }

        protected void cbRespuesta_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cambiarImagenEncuesta(promedioEncuesta());
        }

        protected void cbTipoFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cargarTablasIncidentes();
        }

        protected void gvIncidentes_EnProceso_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            this.insertarImagenPrioridad(e);
        }

    }
}