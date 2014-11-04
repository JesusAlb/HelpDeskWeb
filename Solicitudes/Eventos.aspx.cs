using HelpDeskWeb.ControlAltas;
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlBD.Solicitudes;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




namespace HelpDeskWeb.Solicitudes
{
    public partial class Eventos : System.Web.UI.Page
    {
        private tblevento registroEvento;

        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this, true, 2, 2);
            lbelUsuario.Text = hdk_ControlUsuario.obtenerUsuarioDeSession(this).username;
            this.generarPrivilegios();
            if (!IsPostBack)
            {
                this.cargarTablasEventos();
            }

            if (Page.IsPostBack)
            {
                if (Request["__EVENTTARGET"] == "tabAbierta")
                {
                    this.limpiarSeleccion();
                    tabItemSeleccionado.Value = this.Request.Params.Get("__EVENTARGUMENT");
                }
                if (Request["__EVENTTARGET"] == "txtFiltro")
                {
                    this.cargarTablasEventos();
                }
                if (Request["__EVENTTARGET"] == "txtFiltroReq")
                {
                    this.cargarTablasRequerimientos();
                }

            }
            this.tblReqAsH1.Width = Unit.Percentage(gvRecursosAsignados.Columns[0].ItemStyle.Width.Value * 0.95);
        }

        protected void cargarCombosSoporte()
        {
            cbSeguimiento.DataSource = cbSoporte.DataSource = hdk_ControlUsuario.cargarComboUsuarios(0);
            cbSoporte.DataBind();
            cbSeguimiento.DataBind();
        }

        protected void limpiarSeleccion()
        {
            idEventoSeleccionado.Value = null;
            gvEventos_Abiertos.SelectedIndex = gvEventos_Cancelados.SelectedIndex = gvEventos_Cerrados.SelectedIndex = gvEventos_EnProceso.SelectedIndex = -1;
        }

        protected void cargarTablasEventos()
        {
            this.cargarTablasEventosLlenado(new Object[] { gvEventos_Abiertos, gvEventos_EnProceso, gvEventos_Cerrados, gvEventos_Cancelados });
        }

        protected void cargarTablasEventosLlenado(object[] objeto)
        {
            for (int x = 0; x < objeto.Length; x++)
            {
                if (hdk_ControlUsuario.obtenerUsuarioDeSession(this).tipoUsuario == 0)
                {
                    (objeto[x] as GridView).DataSource = hdk_ControlEventos.cargarTablasSoporte(x, txtFiltro.Text, this.obtenerDateTimeDeString(txtFechaInicial.Text), this.obtenerDateTimeDeString(txtFechaFinal.Text));
                }
                else
                {
                    (objeto[x] as GridView).DataSource = hdk_ControlEventos.cargarTablasSolicitante(hdk_ControlUsuario.obtenerUsuarioDeSession(this).idUsuario, x, txtFiltro.Text, this.obtenerDateTimeDeString(txtFechaInicial.Text), this.obtenerDateTimeDeString(txtFechaFinal.Text));
                }
                (objeto[x] as GridView).DataBind();
            }
        }

        protected void cargarTablasRequerimientos()
        {
            gvRecursosNoAsignados.DataSource = hdk_ControlRequerimientos.cargarTabla(txtFiltroReq.Text, cbCuantificable.Text, Convert.ToInt32(idEventoSeleccionado.Value));
            gvRecursosNoAsignados.DataBind();
            gvRecursosAsignados.DataSource = hdk_ControlAsigReq.cargarTablaReqAsig(Convert.ToInt32(idEventoSeleccionado.Value));
            gvRecursosAsignados.DataBind();
        }

        protected void cargarTablaEncuesta(int? datasource)
        {
            if (datasource != null)
            {
                gvEncuestas.DataSource = hdk_ControlEncuestas.cargarTablaEncuesta(datasource.Value);
                this.gvEncuestas.Columns[2].Visible = false;
                this.gvEncuestas.Columns[3].Visible = true;
            }
            else
            {
                gvEncuestas.DataSource = hdk_ControlEncuestas.cargarTablaPreguntas(1);
                this.gvEncuestas.Columns[2].Visible = true;
                this.gvEncuestas.Columns[3].Visible = false;
            }

            gvEncuestas.DataBind();
        }

        protected void cargarComboLugares()
        {
            cbLugares.DataSource = hdk_ControlLugar.cargarCombo();
            cbLugares.DataBind();
        }

        protected void gvEventos_SelectedIndexChanged(object sender, EventArgs e)
        {
            idEventoSeleccionado.Value = (sender as GridView).SelectedDataKey.Value.ToString();
        }

        protected void gvEventos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias.setRowCreated(sender, e, this.Page);
        }

        protected void btnRecursos_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(tabItemSeleccionado.Value) < 2 /*|| usuarioConectado.tipoUsuario == 1*/)
            {
                if (!String.IsNullOrWhiteSpace(idEventoSeleccionado.Value))
                {
                    registroEvento = hdk_ControlEventos.cargarEvento(Convert.ToInt32(idEventoSeleccionado.Value));
                    txtTitulo.Text = registroEvento.titulo;
                    this.cargarTablasRequerimientos();
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnRecursosActivado", "$('#ModalRecursos').modal('show');", true);
                }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            // if (usuarioConectado.tipoUsuario == 1)
            //  {
            this.cargarComboLugares();
            lbelTituloModal.Text = "Alta de eventos";
            hdk_utilerias.limpiarControles(this.panelModalNuevo.Controls);
            accion.Value = "nuevo";
            ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnNuevoActivado", "$('#ModalNuevo').modal('show');", true);
            // }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(tabItemSeleccionado.Value) < 2 /*|| usuarioConectado.tipoUsuario == 1*/)
            {
                if (!String.IsNullOrWhiteSpace(idEventoSeleccionado.Value))
                {
                    this.cargarComboLugares();
                    lbelTituloModal.Text = "Modificar eventos";
                    registroEvento = hdk_ControlEventos.cargarEvento(Convert.ToInt32(idEventoSeleccionado.Value));
                    txtTituloNuevo.Text = registroEvento.titulo;
                    txtAcomodo.Text = registroEvento.acomodo;
                    txtAsistencia.Text = registroEvento.asistencia_aprox.Value.ToString();
                    txtDescripcion.Text = registroEvento.descripcion;
                    cbLugares.SelectedValue = registroEvento.lugar.ToString();
                    txtFecha.Text = registroEvento.FechaInicio.Value.Date.ToString("yyyy-MM-dd");
                    txtHoraFinal.Text = registroEvento.horaFn.Value.TimeOfDay.ToString();
                    txtHoraInicial.Text = registroEvento.horaIn.Value.TimeOfDay.ToString();
                    accion.Value = "editar";
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnEditarActivado", "$('#ModalNuevo').modal('show');", true);
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (hdk_utilerias.verificarCamposVacios(new string[] { txtTituloNuevo.Text, txtAcomodo.Text, txtAsistencia.Text, txtDescripcion.Text, txtFecha.Text, txtHoraInicial.Text, txtHoraFinal.Text }))
            {
                if (accion.Value.Equals("nuevo"))
                {
                    if (hdk_ControlEventos.insertarEvento(hdk_ControlUsuario.obtenerUsuarioDeSession(this).idUsuario, txtTituloNuevo.Text, Convert.ToInt32(cbLugares.SelectedValue), txtAcomodo.Text, cbTipo.Text, Convert.ToDateTime(txtFecha.Text), Convert.ToInt32(txtAsistencia.Text), Convert.ToDateTime(txtHoraFinal.Text), Convert.ToDateTime(txtHoraFinal.Text), txtDescripcion.Text))
                    {
                        this.cargarTablasEventos();
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "SalirVentana", "$('#ModalNuevo').modal('hide');", true);
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "nuevoEvento", "alertify.alert('Correcto', 'Evento creado correctamente', 'onok');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "nuevoEventoIncorrecto", "alertify.error('Error al crear el evento');", true);
                    }
                }
                else
                {
                    if (hdk_ControlEventos.editarEvento(Convert.ToInt32(idEventoSeleccionado.Value), txtTituloNuevo.Text, Convert.ToInt32(cbLugares.SelectedValue), txtAcomodo.Text, cbTipo.Text, Convert.ToDateTime(txtFecha.Text), Convert.ToInt32(txtAsistencia.Text), Convert.ToDateTime(txtHoraInicial.Text), Convert.ToDateTime(txtHoraFinal.Text), txtDescripcion.Text))
                    {
                        this.cargarTablasEventos();
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "SalirVentana", "$('#ModalNuevo').modal('hide');", true);
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "EdicionCorrecta", "alertify.alert('Correcto', 'Evento editado exitosamente', 'onok');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "EdicionIncorrecta", "alertify.error('Error al editar el evento');", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "CamposVacios", "alertify.alert('Error', 'Llene todos los campos', 'onok');", true);
            }

        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(tabItemSeleccionado.Value) < 2 /*|| usuarioConectado.tipoUsuario == 1*/)
            {
                if (!String.IsNullOrWhiteSpace(idEventoSeleccionado.Value))
                {
                    this.cargarCombosSoporte();
                    registroEvento = hdk_ControlEventos.cargarEvento(Convert.ToInt32(idEventoSeleccionado.Value));
                    cbSeguimiento.SelectedValue = registroEvento.apoyo.ToString();
                    cbSoporte.SelectedValue = registroEvento.responsable.ToString();
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnAsignarActivado", "$('#ModalAsignar').modal('show');", true);
                }
            }
        }

        protected void btnGrabarAsignacion_Click(object sender, EventArgs e)
        {
            if (!cbSoporte.SelectedItem.Text.Equals("S/A"))
            {
                if (hdk_ControlEventos.asignarResponsable(Convert.ToInt32(idEventoSeleccionado.Value), Convert.ToInt32(cbSoporte.SelectedValue), Convert.ToInt32(cbSeguimiento.SelectedValue)))
                {
                    this.cargarTablasEventos();
                    ScriptManager.RegisterStartupScript(this.UpdateSoporte, this.GetType(), "SalirVentanaSoporte", "$('#ModalAsignar').modal('hide');", true);
                    ScriptManager.RegisterStartupScript(this.UpdateSoporte, this.GetType(), "AsignacionCorrecta", "alertify.alert('Correcto', 'Soporte asignado correctamente', 'onok');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateSoporte, this.GetType(), "ErrorSoporte", "alertify.alert('Error', 'Seleccione un usuario de soporte', 'onok');", true);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrWhiteSpace(idEventoSeleccionado.Value) && Convert.ToInt32(tabItemSeleccionado.Value) < 2)
            {
                if (hdk_ControlEventos.cambiarStatus(Convert.ToInt32(idEventoSeleccionado.Value), 3))
                {
                    this.cargarTablasEventos();
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, this.GetType(), "EventoCancelado", "alertify.alert('Correcto', 'Evento cancelado correctamente', 'onok');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, this.GetType(), "ErrorServidor", "alertify.alert('Error', 'Error en el servidor', 'onok');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateBtns, this.GetType(), "ErrorNoId", "alertify.alert('Error', 'Seleccione un evento abierto o en proceso', 'onok');", true);
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(tabItemSeleccionado.Value) == 1 && !String.IsNullOrWhiteSpace(idEventoSeleccionado.Value))
            {
                if (hdk_ControlEventos.cerrarEvento(Convert.ToInt32(idEventoSeleccionado.Value)))
                {
                    this.cargarTablasEventos();
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "CerrarEvento", "alertify.alert('Correcto', 'Evento cerrado exitosamente', 'onok');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "ErrorCerrarEvento", "alertify.alert('Error', 'Error al cerrar el evento', 'onok');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "ItemSinSeleccionar", "alertify.alert('Error', 'Si desea cerrar un evento, seleccione el evento en proceso', 'onok');", true);
            }
        }

        protected void btnQuitar_Click(object sender, EventArgs e)
        {
            if (gvRecursosAsignados.SelectedDataKey != null)
            {
                if (hdk_ControlAsigReq.borrar(Convert.ToInt32(idEventoSeleccionado.Value), Convert.ToInt32(gvRecursosAsignados.SelectedDataKey.Value.ToString())))
                {
                    this.cargarTablasRequerimientos();
                    ScriptManager.RegisterStartupScript(this.UpdateBtnAñadir, GetType(), "AñadirCantidad", "alertify.success('Se eliminó el recurso al evento');", true);
                    txtCantidadAs.Text = "";
                    gvRecursosAsignados.SelectedIndex = -1;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateBtnQuitar, GetType(), "ErrorQuitar", "alertify.alert('Error', 'Error al quitar el requerimiento', 'onok');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateBtnQuitar, GetType(), "ErrorSeleccion", "alertify.alert('Error', 'Seleccione el recurso a eliminar', 'onok');", true);
            }
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            if (gvRecursosNoAsignados.SelectedDataKey != null)
            {
                int idReq = Convert.ToInt32(gvRecursosNoAsignados.SelectedDataKey.Value.ToString());
                requerimientosSinAsignar_Result requerimiento = hdk_ControlRequerimientos.obtenerRequerimiento(idReq, null);
                if (requerimiento.tipo.Equals("Cuantificable"))
                {
                    try
                    {
                        int cantidad = Convert.ToInt32(txtCantidad.Text);
                        this.insertarRequerimiento(cantidad);
                    }
                    catch
                    {
                        ScriptManager.RegisterStartupScript(this.UpdateBtnAñadir, GetType(), "ErrorAñadir", "alertify.error('Cantidad inválida');", true);
                    }

                }
                else
                {
                    this.insertarRequerimiento(null);
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateBtnAñadir, GetType(), "ErrorSeleccion", "alertify.alert('Error', 'Seleccione el recurso a añadir', 'onok');", true);
            }
        }

        protected void insertarRequerimiento(int? cant)
        {
            int cantidad;
            if (cant == null)
                cantidad = 1;
            else
                cantidad = cant.Value;
            if (hdk_ControlAsigReq.insertar(Convert.ToInt32(idEventoSeleccionado.Value), Convert.ToInt32(gvRecursosNoAsignados.SelectedDataKey.Value.ToString()), cantidad))
            {
                ScriptManager.RegisterStartupScript(this.UpdateBtnAñadir, GetType(), "AñadirCantidad", "alertify.success('Se añadió el recurso al evento');", true);
                this.cargarTablasRequerimientos();
                txtCantidad.Text = "";
                gvRecursosNoAsignados.SelectedIndex = -1;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateBtnAñadir, GetType(), "ErrorAñadir", "alertify.error('No se pudo añadir el requerimiento al evento');", true);
            }
        }

        protected void btnGrabarRecursos_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrWhiteSpace(txtObservaciones.Text))
            {
                if (hdk_ControlEventos.editarObservaciones(Convert.ToInt32(idEventoSeleccionado.Value), txtObservaciones.Text))
                {
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarRecursos, GetType(), "SalirVentana", "mostrarModal('ModalRecursos','hide');", true);
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarRecursos, GetType(), "GrabarObservaciones", "alertify.alert('Correcto', 'Evento guardado correctamente', 'onok');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarRecursos, GetType(), "ErrorObservaciones", "alertify.alert('Error', 'Error al grabar el evento')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateGrabarRecursos, GetType(), "ErrorObservaciones", "alertify.alert('Error', 'Llene el campo de observaciones')", true);
            }
        }

        protected void gvRecursosAsignados_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idReq = Convert.ToInt32(gvRecursosAsignados.SelectedDataKey.Value.ToString());
            tblrequerimientoaevento requerimiento = hdk_ControlAsigReq.obtenerRequerimientoAsignado(idReq, Convert.ToInt32(idEventoSeleccionado.Value));
            txtCantidadAs.Text = requerimiento.cantidad.ToString();
        }

        protected void gvRecursosNoAsignados_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idReq = Convert.ToInt32(gvRecursosNoAsignados.SelectedDataKey.Value.ToString());
            requerimientosSinAsignar_Result requerimiento = hdk_ControlRequerimientos.obtenerRequerimiento(idReq, null);
            txtCantidad.Text = "1";
            if (requerimiento.tipo.Equals("Cuantificable"))
            {
                txtCantidad.Enabled = true;
            }
            else
            {
                txtCantidad.Enabled = false;
            }
        }

        protected void gvEventos_Cerrados_RowDataBound(object sender, GridViewRowEventArgs e)
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

            }
        }

        protected void btnEncuesta_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            TableCell celda = (TableCell)imgBtn.Parent;
            GridViewRow renglon = (GridViewRow)celda.Parent;
            gvEventos_Cerrados.SelectedIndex = renglon.RowIndex;
            int idEvento = Convert.ToInt32(gvEventos_Cerrados.SelectedDataKey.Value.ToString());
            VistaEventosCerrado eventoCerrado = hdk_ControlEventos.cargarEventoCerrado(idEvento);
            idCalidad.Value = eventoCerrado.idCalidad_Servicio.ToString();
            txtSolicitante.Text = eventoCerrado.solicitante;
            if (eventoCerrado.statusCal_Servicio)
            {
                this.cargarTablaEncuesta(eventoCerrado.idCalidad_Servicio);
                txtPromedio.Text = eventoCerrado.promedioCalidad.ToString();
                this.cambiarImagenEncuesta(eventoCerrado.promedioCalidad.Value);
                txtObEncuestas.Text = eventoCerrado.observacionesServicio;
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

            ScriptManager.RegisterStartupScript(this.UpGvEventosCerrados, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('show');", true);
        }

        protected void cbRespuesta_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cambiarImagenEncuesta(promedioEncuesta());
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
                        if (hdk_ControlEncuestas.insertarRespuesta(Convert.ToInt32(idCalidad.Value), Convert.ToInt32(gvEncuestas.DataKeys[row.DataItemIndex].Value), Convert.ToInt32(cbRespuesta.SelectedValue)))
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
                    if (hdk_ControlEncuestas.guardarCambiosEncuesta(Convert.ToInt32(idCalidad.Value), txtObEncuestas.Text, float.Parse(txtPromedio.Text, System.Globalization.CultureInfo.InvariantCulture)))
                    {
                        ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('hide');", true);
                        this.cargarTablasEventos();
                        ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "EncuestaGuarda", "alertify.success('Se registro la encuesta');", true);  
                    }else{
                        ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "EncuestNoGuardada", "alertify.error('No se pudo registrar la encuesta');", true);
                    }
                }
            }

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

        protected void cbCuantificable_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cargarTablasRequerimientos();
        }

        protected void generarPrivilegios()
        {
            if (hdk_ControlUsuario.obtenerUsuarioDeSession(this.Page).tipoUsuario == 1)
            {
                menuCatalogos.Visible = false;
                menuControl.Visible = false;
            }
        }
    }
    
}
