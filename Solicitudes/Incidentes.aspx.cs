using HelpDeskWeb.ControlAltas;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilerias.checarSession(this, true, 2, 2);
            if (!IsPostBack)
            {
                lbelUsuario.Text = " " + controlUsuario.obtenerUsuarioDeSession(this).nombre_usuario;
                this.generarPrivilegios();
                this.cargarComboFiltro();
                this.cargarComboBoxs();
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
                if (controlUsuario.obtenerUsuarioDeSession(this).tipo == 0)
                {
                    (objeto[x] as GridView).DataSource = controlIncidentes.obtenerDataSourceSoporte(x, cbTipoFiltro.SelectedItem.Text, txtFiltro.Text, this.obtenerDateTimeDeString(filtroFechaInicial.Text), this.obtenerDateTimeDeString(filtroFechaFinal.Text));
                }
                else
                {
                    (objeto[x] as GridView).DataSource = controlIncidentes.obtenerDataSourceSolicitante(controlUsuario.obtenerUsuarioDeSession(this).id, cbTipoFiltro.SelectedItem.Text, x, txtFiltro.Text, this.obtenerDateTimeDeString(filtroFechaInicial.Text), this.obtenerDateTimeDeString(filtroFechaFinal.Text));
                }
                (objeto[x] as GridView).DataBind();
            }
        }

        protected void cargarComboBoxs()
        {
            cbTipoIncidente2.DataSource = cbTipoIncidente.DataSource = controlTipoIncidencia.obtenerDataSourceCombBoxTipo();
            cbSoporte2.DataSource = cbSeguimiento2.DataSource = cbSeguimiento.DataSource = cbSoporte.DataSource =  controlUsuario.dataSourceComboBox(0);
            cbSolicitante.DataSource = cbSolicitante2.DataSource = controlUsuario.dataSourceComboBox(2);
            cbTipoIncidente.DataBind();
            cbTipoIncidente2.DataBind();
            cbSoporte.DataBind();
            cbSeguimiento.DataBind();
            cbSolicitante.DataBind();
            cbSolicitante2.DataBind();
            cbSoporte2.DataBind();
            cbSeguimiento2.DataBind();
        }

        protected void cargarComboFiltro()
        {
            cbTipoFiltro.DataSource = controlTipoIncidencia.obtenerDataSourceCombBoxTipo();
            cbTipoFiltro.DataBind();
        }

        protected void cargarTablaEncuesta(int? datasource)
        {
            if (datasource != null)
            {
                gvEncuestas.DataSource = controlEncuestas.obtenerDataSourceEncuesta(datasource.Value);
                this.gvEncuestas.Columns[2].Visible = false;
                this.gvEncuestas.Columns[3].Visible = true;
            }
            else
            {
                gvEncuestas.DataSource = controlEncuestas.obtenerDataSourcePreguntas(1);
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
            Utilerias.setRowCreated(sender, e, this.Page);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrWhiteSpace(txtDescripcion.Text))
            {
                int solicitante = controlUsuario.obtenerUsuarioDeSession(this).id;

                if (controlUsuario.obtenerUsuarioDeSession(this).tipo == 0)
                {
                    solicitante = Convert.ToInt32(cbSolicitante.SelectedValue);
                }

                if (controlIncidentes.insertarIncidente(solicitante, txtDescripcion.Text))
                {
                    this.cargarTablasIncidentes();
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarNuevo, this.GetType(), "SalirVentana", "$('#ModalNuevo').modal('hide');", true);
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarNuevo, this.GetType(), "nuevoIncidente", "alertify.success('Incidente registrado satisfactoriamente');", true);                   
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarNuevo, this.GetType(), "nuevoIncidenteIncorrecto", "alertify.error('Error al registrar el incidente');", true);
                }
            }
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            if (controlUsuario.obtenerUsuarioDeSession(this).tipo == 0)
            {
                if (Convert.ToInt32(tabItemSeleccionado.Value) < 2 && !String.IsNullOrWhiteSpace(idIncidenteSeleccionado.Value))
                {

                    tblincidente itemIncidente = controlIncidentes.obtenerIncidente(Convert.ToInt32(idIncidenteSeleccionado.Value));
                    cbTipoIncidente.SelectedValue = itemIncidente.tipo.ToString();
                    cbPrioridad.SelectedValue = itemIncidente.fk_idprioridad.ToString();
                    cbSoporte.SelectedValue = itemIncidente.tblservicio.fk_idusuario_soporte.ToString();
                    cbSeguimiento.SelectedValue = itemIncidente.tblservicio.fk_idusuario_apoyo.ToString();
                    ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "btnAsginarActivado", "$('#ModalAsignar').modal('show');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "AsignarIncidenteTab", "alertify.error('Seleccione un incidente abierto o en proceso');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "restriccion", "alertify.error('Acción solamente para usuarios de soporte');", true);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            if (controlUsuario.obtenerUsuarioDeSession(this).tipo == 0)
            {
                if (!tabItemSeleccionado.Value.Equals("2"))
                {
                    Utilerias.limpiarControles(upModalNuevo.Controls);
                    panelSolcitante.Visible = true;
                    ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "btnNuevoActivado", "$('#ModalNuevo').modal('show');", true);
                }
                else
                {
                    Utilerias.limpiarControles(upIncidenteCompleto.Controls);
                    ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "btnNuevoActivado", "$('#ModalNuevoCompleto').modal('show');", true);
                }

            }
            else
            {
                txtDescripcion.Text = "";
                panelSolcitante.Visible = false;
                ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "btnNuevoActivado", "$('#ModalNuevo').modal('show');", true);
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(tabItemSeleccionado.Value) < 2 && !String.IsNullOrWhiteSpace(idIncidenteSeleccionado.Value))
            {
                if (controlServicios.modificarEstatus(controlIncidentes.obtenerIncidente(Convert.ToInt32(idIncidenteSeleccionado.Value)).fk_idservicio, 3))
                    {
                        this.cargarTablasIncidentes();
                        ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "CancelarIncidente", "alertify.success('Incidente cancelado correctamente');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "CancelarIncidenteIncorrecto", "alertify.error('Error al cancelar el incidente');", true);
                    }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "CancelarIncidenteTab", "alertify.error('Seleccione un incidente abierto o en proceso');", true);
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            if (controlUsuario.obtenerUsuarioDeSession(this).tipo == 0)
            {
                if (Convert.ToInt32(tabItemSeleccionado.Value) == 1 && !String.IsNullOrWhiteSpace(idIncidenteSeleccionado.Value))
                {
                    ScriptManager.RegisterStartupScript(this.updateAcciones, GetType(), "btnCerrarActivado", "$('#ModalCerrar').modal('show');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "CerrarIncidenteTab", "alertify.error('Seleccione un incidente en proceso');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateAcciones, this.GetType(), "restriccion", "alertify.error('Acción solamente para usuarios de soporte');", true);
            }
        }

        protected void gvIncidentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            idIncidenteSeleccionado.Value = (sender as GridView).SelectedDataKey.Value.ToString();
        }

        protected void BtnGrabarAsignacion_Click(object sender, EventArgs e)
        {
            if (controlIncidentes.asignarSoporte(Convert.ToInt32(idIncidenteSeleccionado.Value), Convert.ToInt32(cbSoporte.SelectedValue), Convert.ToInt32(cbSeguimiento.SelectedValue), Convert.ToInt16(cbPrioridad.SelectedItem.Value), Convert.ToInt32(cbTipoIncidente.SelectedValue)))
            {
                this.cargarTablasIncidentes();
                ScriptManager.RegisterStartupScript(this.UpdateGrabarAsignacion, this.GetType(), "SalirVentanaAsign", "$('#ModalAsignar').modal('hide');", true);
                ScriptManager.RegisterStartupScript(this.UpdateGrabarAsignacion, this.GetType(), "AsignacionCorrecta", "alertify.success('Soporte asignado correctamente');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateGrabarAsignacion, this.GetType(), "AsignacionCorrecta", "alertify.error('Error al asignar el soporte');", true);
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
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarCerrar, this.GetType(), "CerrarCorrecta", "alertify.success('Incidente cerrado correctamente');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarAsignacion, this.GetType(), "CerrarCorrecta", "alertify.error('Error al cerrar el incidente');", true);
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

                    if (Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "estatus_calidad")))
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
            double promedioAcotado = Math.Round(promedio, 2);
            txtPromedio.Text = promedioAcotado.ToString();

            if (promedioAcotado <= 2.5)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel0.png";
            else if (promedioAcotado > 2.5 && promedio <= 4)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel1.png";
            else if (promedioAcotado > 4 && promedio <= 5.5)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel2.png";
            else if (promedioAcotado > 5.5 && promedio <= 7)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel3.png";
            else if (promedioAcotado > 7 && promedio <= 8.5)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel4.png";
            else if (promedioAcotado > 8.5 && promedio <= 10)
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel5.png";
        }

        protected void btnEncuesta_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            TableCell celda = (TableCell)imgBtn.Parent;
            GridViewRow renglon = (GridViewRow)celda.Parent;
            gvIncidentes_Cerrados.SelectedIndex = renglon.RowIndex;
            tblincidente incidente = controlIncidentes.obtenerIncidente(Convert.ToInt32(gvIncidentes_Cerrados.SelectedDataKey.Value.ToString()));
            tblcalidadservicio calidad = controlEncuestas.obtenerCalidadServicio(incidente.fk_idservicio);
            tblusuario usuario = controlUsuario.obtenerUsuario(incidente.tblservicio.fk_idusuario_solicitante);
            idCalidad.Value = calidad.id.ToString();
            txtSolicitante.Text = usuario.nombre + " " + usuario.apellidos;
            if (calidad.estatus)
            {
                this.cargarTablaEncuesta(calidad.id);
                txtPromedio.Text = calidad.promedio.ToString();
                this.cambiarImagenEncuesta(calidad.promedio);
                txtObEncuestas.Text = calidad.observaciones;
                txtObEncuestas.Enabled = false;
                btnGrabarEncuesta.Text = "Aceptar";
                ScriptManager.RegisterStartupScript(this.UpIncidentesCerrados, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('show');", true);
            }
            else if(calidad.estatus == false && controlUsuario.obtenerUsuarioDeSession(this).tipo == 1)
            {
                this.cargarTablaEncuesta(null);
                txtObEncuestas.Enabled = true;
                txtObEncuestas.Text = "";
                txtPromedio.Text = "1";
                btnGrabarEncuesta.Text = "Grabar";
                ScriptManager.RegisterStartupScript(this.UpIncidentesCerrados, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('show');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpIncidentesCerrados, this.GetType(), "restriccion", "alertify.error('Encuesta no realizada');", true);
            }
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
                    if (controlEncuestas.SaveChangesEncuesta(Convert.ToInt32(idCalidad.Value), txtObEncuestas.Text, float.Parse(txtPromedio.Text, System.Globalization.CultureInfo.InvariantCulture)))
                    {
                        ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('hide');", true);
                        this.cargarTablasIncidentes();
                        ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "EncuestaGuarda", "alertify.success('Encuesta registrada correctamente');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "EncuestNoGuardada", "alertify.error('Error al registrar la encuesta');", true);
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

        protected void generarPrivilegios()
        {
            if (controlUsuario.obtenerUsuarioDeSession(this).tipo == 1)
            {
                menuCatalogos.Visible = false;
                menuControl.Visible = false;
            }
        }

        protected void btnGrabarCompleto_Click(object sender, EventArgs e)
        {
            if(Utilerias.verificarCamposVacios(new string[]{
                txtAcciones2.Text, txtDescripcion2.Text, txtFechaInicio.Text, txtFechaFinal.Text, txtHoraInicio.Text, txtHoraFinal.Text, txtAcciones2.Text, txtSolucion2.Text, cbPrioridad2.Text, cbTipoIncidente2.Text
            }) && Utilerias.verificarCombosUsuarios(new string[]{
                cbSeguimiento2.Text, cbSoporte2.Text
            }))
            {
                if (controlIncidentes.insertarIncidenteCompleto(Convert.ToInt32(cbSolicitante2.SelectedValue), Convert.ToInt32(cbSoporte2.SelectedValue), Convert.ToInt32(cbSeguimiento2.SelectedValue), txtDescripcion2.Text, txtAcciones2.Text, txtSolucion2.Text, Convert.ToInt32(cbTipoIncidente2.SelectedValue), Convert.ToDateTime(txtFechaInicio.Text), Convert.ToDateTime(txtFechaFinal.Text), Convert.ToInt16(cbPrioridad2.SelectedItem.Value), Convert.ToDateTime(txtHoraInicio.Text), Convert.ToDateTime(txtHoraFinal.Text)))
                {
                    this.cargarTablasIncidentes();
                    ScriptManager.RegisterStartupScript(this.updateGrabarCompleto, GetType(), "cerrar", "$('#ModalNuevoCompleto').modal('hide');", true);
                    ScriptManager.RegisterStartupScript(this.updateGrabarCompleto, GetType(), "mensaje", "alertify.success('Incidente registrado correctamente')", true);
                }
                else{
                    ScriptManager.RegisterStartupScript(this.updateGrabarCompleto, GetType(), "mensaje", "alertify.error('Error al registrar el incidente')", true);
                }               
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updateGrabarCompleto, GetType(), "mensaje", "alertify.error('Llene todos los campos')", true);
            }
        }
    }
}