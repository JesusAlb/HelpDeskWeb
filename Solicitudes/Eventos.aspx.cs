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
            Utilerias.checarSession(this, true, 2, 2);
            lbelUsuario.Text = controlUsuario.obtenerUsuarioDeSession(this).nombre_usuario;
            if (!IsPostBack)
            {
                this.generarPrivilegios();
                this.cargarTablasEventos();
                this.cargarCombos();
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
                if (controlUsuario.obtenerUsuarioDeSession(this).fk_idtipo == 0)
                {
                    (objeto[x] as GridView).DataSource = controlEventos.obtenerDataSourceSoporte(x, txtFiltro.Text, Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text));
                }
                else
                {
                    (objeto[x] as GridView).DataSource = controlEventos.obtenerDataSourceSolicitante(controlUsuario.obtenerUsuarioDeSession(this).id, x, txtFiltro.Text, Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text));
                }
                (objeto[x] as GridView).DataBind();
            }
        }

        protected void cargarTablasRequerimientos()
        {
            gvRecursosNoAsignados.DataSource = controlRequerimientos.obtenerDataSource(txtFiltroReq.Text, cbCuantificable.Text, Convert.ToInt32(idEventoSeleccionado.Value));
            gvRecursosNoAsignados.DataBind();
            gvRecursosAsignados.DataSource = controlRecursosAsignados.obtenerDataSource(Convert.ToInt32(idEventoSeleccionado.Value));
            gvRecursosAsignados.DataBind();
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

        protected void cargarCombos()
        {
            cbSeguimiento2.DataSource = cbSoporte2.DataSource = cbSeguimiento.DataSource = cbSoporte.DataSource = controlUsuario.dataSourceComboBox(0);
            cbSoporte.DataBind();
            cbSeguimiento.DataBind();
            cbSeguimiento2.DataBind();
            cbSoporte2.DataBind();
            cbSolicitante.DataSource = controlUsuario.dataSourceComboBox(1);
            cbSolicitante.DataBind();
            cbLugares.DataSource = controlLugar.obtenerDataSource("");
            cbLugares.DataBind();
            cbAcomodo.DataSource = controlAcomodo.obtenerDataSource("");
            cbAcomodo.DataBind();
            cbTipo.DataSource = controlEventos.obtenerDataSourceTipoEventos();
            cbTipo.DataBind();
        }

        protected void gvEventos_SelectedIndexChanged(object sender, EventArgs e)
        {
            idEventoSeleccionado.Value = (sender as GridView).SelectedDataKey.Value.ToString();
        }

        protected void gvEventos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            Utilerias.setRowCreated(sender, e, this.Page);
        }

        protected void btnRecursos_Click(object sender, EventArgs e)
        {
                if (Convert.ToInt32(tabItemSeleccionado.Value) < 2)
                {
                    if (!String.IsNullOrWhiteSpace(idEventoSeleccionado.Value))
                    {
                        this.prepararModalRecursos(Convert.ToInt32(idEventoSeleccionado.Value),this.UpdateBtns);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "restriccion", "alertify.error('Seleccione un evento abierto o en proceso')", true);
                }
        }

        protected void prepararModalRecursos(int idEvento, UpdatePanel iniciador)
        {
            registroEvento = controlEventos.obtenerEvento(idEvento);
            idEventoSeleccionado.Value = idEvento.ToString();
            txtTitulo.Text = registroEvento.nombre;
            txtObservaciones.Text = registroEvento.observacion;
            this.cargarTablasRequerimientos();
            ScriptManager.RegisterStartupScript(iniciador, GetType(), "btnRecursosActivado", "$('#ModalRecursos').modal('show');", true);
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            lbelTituloModal.Text = "Alta de eventos";
            Utilerias.limpiarControles(this.panelModalNuevo.Controls);
            accion.Value = "nuevo";

            if (controlUsuario.obtenerUsuarioDeSession(this).fk_idtipo == 0)
            {
                if (tabItemSeleccionado.Value.Equals("2"))
                {
                    this.configurarModal("Alta de eventos cerrados", true, true);
                }
                else
                {
                    this.configurarModal("Alta de eventos", true, false);
                }
                ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnNuevoActivado", "$('#ModalNuevo').modal('show');", true);
            }
            else
            {
                if (controlEncuestas.obtenerNumeroDeEncuestasSinResponderEnEventos(controlUsuario.obtenerUsuarioDeSession(this).id) == 0)
                {
                    this.configurarModal("Alta de eventos", false, false);
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnNuevoActivado", "$('#ModalNuevo').modal('show');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "mensajeNoEncuesta", "alertify.alert('Para dar de alta un evento, debes contestar la encuesta')", true);
                }
            }


        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
                if (Convert.ToInt32(tabItemSeleccionado.Value) < 2 && !String.IsNullOrWhiteSpace(idEventoSeleccionado.Value))
                {

                    this.configurarModal("Modificar eventos", false, false);
                    registroEvento = controlEventos.obtenerEvento(Convert.ToInt32(idEventoSeleccionado.Value));
                    txtTituloNuevo.Text = registroEvento.nombre;
                    cbAcomodo.SelectedValue = registroEvento.fk_idacomodo.ToString();
                    cbTipo.SelectedValue = registroEvento.fk_idtipo.ToString();
                    txtAsistencia.Text = registroEvento.asistencia.ToString();
                    txtDescripcion.Text = registroEvento.tblservicio.descripcion;
                    cbLugares.SelectedValue = registroEvento.fk_idlugar.ToString();
                    txtFecha.Text = registroEvento.fecha_realizacion.Date.ToString("yyyy-MM-dd");
                    txtHoraFinal.Text = registroEvento.tblservicio.hora_final.Value.TimeOfDay.ToString();
                    txtHoraInicial.Text = registroEvento.tblservicio.hora_inicial.Value.TimeOfDay.ToString();
                    accion.Value = "editar";
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnEditarActivado", "$('#ModalNuevo').modal('show');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "restriccion", "alertify.error('Seleccione un evento abierto o en proceso')", true);
                }                        
        }

        protected void configurarModal(string titulo, bool panelSol, bool panelcierre)
        {
            lbelTituloModal.Text = titulo;
            panelSolicitante.Visible = panelSol;
            panelFechas.Visible = panelcierre;
            panelAsignarSoporte.Visible = panelcierre;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            bool camposNoVacios = Utilerias.verificarCamposVacios(new string[] { txtTituloNuevo.Text, cbAcomodo.Text, txtAsistencia.Text, txtDescripcion.Text, txtFecha.Text, txtHoraInicial.Text, txtHoraFinal.Text });
            bool usuariosValidos = true;
            bool FechasValidas;
            bool horasValidas = ((Utilerias.convertirFecha(txtHoraInicial.Text).Value.AddMinutes(9)) < Utilerias.convertirFecha(txtHoraFinal.Text));
            bool FechaPeticion = true;
            int solicitante = (controlUsuario.obtenerUsuarioDeSession(this).fk_idtipo == 0) ? Convert.ToInt32(cbSolicitante.SelectedValue) : controlUsuario.obtenerUsuarioDeSession(this).id;

            if (panelFechas.Visible)
            {
                usuariosValidos = Utilerias.verificarCombosUsuarios(new string[] { cbSolicitante.SelectedItem.Text, cbSoporte2.SelectedItem.Text, cbSeguimiento2.SelectedItem.Text });
                 FechasValidas = Utilerias.validarFechas(new TextBox[] { txtFecha, txtFechaCierre, txtFechaSolicitud, txtHoraFinal, txtHoraInicial });
                 if (FechasValidas)
                 {
                     FechasValidas = (Utilerias.fechaReal(txtFechaCierre.Text, true) && Utilerias.fechaReal(txtFecha.Text + " "+  txtHoraInicial.Text, true));
                     FechasValidas = ((Convert.ToDateTime(txtFechaSolicitud.Text) <= Convert.ToDateTime(txtFecha.Text)) && (Convert.ToDateTime(txtFechaCierre.Text) >= Convert.ToDateTime(txtFecha.Text)));
                 }
                 FechaPeticion = (Utilerias.convertirFecha(txtFechaSolicitud.Text) <= Utilerias.convertirFecha(txtFechaCierre.Text));
            }
            else if (panelSolicitante.Visible && !panelFechas.Visible)
            {
                usuariosValidos = Utilerias.verificarCombosUsuarios(new string[] { cbSolicitante.SelectedItem.Text });
                FechasValidas = Utilerias.validarFechas(new TextBox[] { txtFecha, txtHoraFinal, txtHoraInicial });
                if (FechasValidas)
                {
                    FechasValidas = Utilerias.fechaReal(txtFecha.Text +" "+ txtHoraInicial.Text, false);
                }
            }
            else
            {
                FechasValidas = Utilerias.validarFechas(new TextBox[] { txtFecha, txtHoraFinal, txtHoraInicial });
                if (FechasValidas)
                {
                    FechasValidas = Utilerias.fechaReal(txtFecha.Text +" "+ txtHoraInicial.Text, false);
                }
            }


            if (camposNoVacios)
            {
                if (FechasValidas)
                {
                    if (horasValidas)
                    {
                        if (accion.Value.Equals("nuevo"))
                        {
                            if(!tabItemSeleccionado.Value.Equals("2") || controlUsuario.obtenerUsuarioDeSession(this).fk_idtipo == 1){
                                if (controlEventos.insertar(solicitante, txtTituloNuevo.Text, Convert.ToInt32(cbLugares.SelectedValue), Convert.ToInt32(cbAcomodo.SelectedValue), Convert.ToInt16(cbTipo.SelectedValue), Convert.ToDateTime(txtFecha.Text), Convert.ToInt32(txtAsistencia.Text), Convert.ToDateTime(txtHoraInicial.Text), Convert.ToDateTime(txtHoraFinal.Text), txtDescripcion.Text))
                                {
                                    this.cargarTablasEventos();
                                    ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "SalirVentana", "$('#ModalNuevo').modal('hide');", true);
                                    ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "nuevoEvento", "alertify.success('Evento creado correctamente');", true);
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "nuevoEventoIncorrecto", "alertify.error('Error al crear el evento');", true);
                                }
                            }
                            else
                            {
                                if (usuariosValidos)
                                {
                                    if (FechaPeticion)
                                    {
                                        if (controlEventos.insertarCompleto(solicitante, Convert.ToInt32(cbSoporte2.SelectedValue), Convert.ToInt32(cbSeguimiento2.SelectedValue), txtTituloNuevo.Text, Convert.ToInt32(cbLugares.SelectedValue), Convert.ToInt32(cbAcomodo.SelectedValue), Convert.ToInt16(cbTipo.SelectedValue), Convert.ToDateTime(txtFecha.Text), Convert.ToInt32(txtAsistencia.Text), Convert.ToDateTime(txtHoraInicial.Text), Convert.ToDateTime(txtHoraFinal.Text), txtDescripcion.Text, Convert.ToDateTime(txtFechaSolicitud.Text), Convert.ToDateTime(txtFechaCierre.Text)))
                                        {
                                            this.cargarTablasEventos();
                                            ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "SalirVentana", "$('#ModalNuevo').modal('hide');", true);
                                            ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "nuevoEvento", "alertify.success('Evento creado correctamente');", true);
                                            this.prepararModalRecursos(controlEventos.obtenerUltimoEvento(), UpdateGrabar);
                                        }
                                        else
                                        {
                                            ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "nuevoEventoIncorrecto", "alertify.error('Error al crear el evento');", true);
                                        }
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "EdicionIncorrecta", "alertify.error('Fecha de solicitud mayor a la de cierre');", true);
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "EdicionIncorrecta", "alertify.error('Usuarios de soporte no asignados');", true);
                                }
                            }
                        }
                        else
                        {
                                if (controlEventos.modificar(Convert.ToInt32(idEventoSeleccionado.Value), txtTituloNuevo.Text, Convert.ToInt32(cbLugares.SelectedValue), Convert.ToInt32(cbAcomodo.SelectedValue), Convert.ToInt16(cbTipo.SelectedValue), Convert.ToDateTime(txtFecha.Text), Convert.ToInt32(txtAsistencia.Text), Convert.ToDateTime(txtHoraInicial.Text), Convert.ToDateTime(txtHoraFinal.Text), txtDescripcion.Text))
                                {
                                    this.cargarTablasEventos();
                                    ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "SalirVentana", "$('#ModalNuevo').modal('hide');", true);
                                    ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "EdicionCorrecta", "alertify.success('Evento editado exitosamente');", true);
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "EdicionIncorrecta", "alertify.error('Error al editar el evento');", true);
                                }
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "CamposVacios", "alertify.error('La hora final debe ser mínimo 10 minutos mayor a la hora inicial');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "CamposVacios", "alertify.error('Fecha y/o tiempos inválidos');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "CamposVacios", "alertify.error('Llene todos los campos');", true);
            }

        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            if (controlUsuario.obtenerUsuarioDeSession(this).fk_idtipo == 0)
            {
                if (Convert.ToInt32(tabItemSeleccionado.Value) < 2 && !String.IsNullOrWhiteSpace(idEventoSeleccionado.Value))
                {
                        registroEvento = controlEventos.obtenerEvento(Convert.ToInt32(idEventoSeleccionado.Value));
                        cbSeguimiento.SelectedValue = registroEvento.tblservicio.fk_idusuario_apoyo.ToString();
                        cbSoporte.SelectedValue = registroEvento.tblservicio.fk_idusuario_soporte.ToString();
                        ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnAsignarActivado", "$('#ModalAsignar').modal('show');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "restriccion", "alertify.error('Seleccione un evento abierto o en proceso')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "restriccion", "alertify.error('Acción solamente para usuarios de soporte')", true);
            }
        }

        protected void btnGrabarAsignacion_Click(object sender, EventArgs e)
        {
            if (Utilerias.verificarCombosUsuarios(new string[] { cbSoporte.SelectedItem.Text, cbSeguimiento.SelectedItem.Text }))
                {
                    if (controlEventos.asignarSoporte(Convert.ToInt32(idEventoSeleccionado.Value), Convert.ToInt32(cbSoporte.SelectedValue), Convert.ToInt32(cbSeguimiento.SelectedValue)))
                    {
                        gvEventos_EnProceso.DataSource = null;
                        gvEventos_EnProceso.DataBind();
                        this.cargarTablasEventos();
                        ScriptManager.RegisterStartupScript(this.UpdateSoporte, this.GetType(), "SalirVentanaSoporte", "$('#ModalAsignar').modal('hide');", true);
                        ScriptManager.RegisterStartupScript(this.UpdateSoporte, this.GetType(), "AsignacionCorrecta", "alertify.success('Soporte asignado correctamente');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateSoporte, this.GetType(), "ErrorSoporte", "alertify.error('Existen usuarios sin asignar');", true);
                }
   
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (controlUsuario.obtenerUsuarioDeSession(this).fk_idtipo == 1)
            {
                if (!String.IsNullOrWhiteSpace(idEventoSeleccionado.Value) && Convert.ToInt32(tabItemSeleccionado.Value) < 2)
                {
                    if (controlServicios.modificarEstatus(controlEventos.obtenerEvento(Convert.ToInt32(idEventoSeleccionado.Value)).fk_idservicio, 3))
                    {
                        this.cargarTablasEventos();
                        ScriptManager.RegisterStartupScript(this.UpdateBtns, this.GetType(), "EventoCancelado", "alertify.success('Evento cancelado correctamente');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.UpdateBtns, this.GetType(), "ErrorServidor", "alertify.error('Error en el servidor');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, this.GetType(), "ErrorNoId", "alertify.error('Seleccione un evento abierto o en proceso');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateBtns, this.GetType(), "restricción", "alertify.error('Acción solamente para solicitantes');", true);
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            if (controlUsuario.obtenerUsuarioDeSession(this).fk_idtipo == 0)
            {
                if (Convert.ToInt32(tabItemSeleccionado.Value) == 1 && !String.IsNullOrWhiteSpace(idEventoSeleccionado.Value))
                {
                    if (controlEventos.cerrarEvento(Convert.ToInt32(idEventoSeleccionado.Value)))
                    {
                        this.cargarTablasEventos();
                        ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "CerrarEvento", "alertify.success('Evento cerrado exitosamente');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "ErrorCerrarEvento", "alertify.error('Error al cerrar el evento');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "ItemSinSeleccionar", "alertify.error('Si desea cerrar un evento, seleccione el evento en proceso');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateBtns, this.GetType(), "restricción", "alertify.error('Acción solamente para usuarios de soporte');", true);
            }
        }

        protected void btnQuitar_Click(object sender, EventArgs e)
        {
            if (gvRecursosAsignados.SelectedDataKey != null)
            {
                string mensaje = null;
                int cantidadResultante = this.restarRequerimientoAsignado();

                if (cantidadResultante <= 0) {
                    if (controlRecursosAsignados.borrar(Convert.ToInt32(idEventoSeleccionado.Value), Convert.ToInt32(gvRecursosAsignados.SelectedDataKey.Value.ToString())))
                        mensaje = "Se eliminó el recurso del evento";
                    else
                        mensaje = "Error al eliminar el recurso";
                }
                else
                {
                    if (controlRecursosAsignados.editar(Convert.ToInt32(idEventoSeleccionado.Value), Convert.ToInt32(gvRecursosAsignados.SelectedDataKey.Value.ToString()), cantidadResultante))
                        mensaje = "Se actualizó el recurso del evento";
                    else
                        mensaje = "Error al actualizar el recurso";
                }
                if(mensaje != null){
                    this.cargarTablasRequerimientos();
                    ScriptManager.RegisterStartupScript(this.UpdateBtnQuitar, GetType(), "AñadirCantidad", "alertify.success('"+mensaje+"');", true);
                    txtCantidadAs.Text = "";
                    gvRecursosAsignados.SelectedIndex = -1;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateBtnQuitar, GetType(), "ErrorSeleccion", "alertify.error('Seleccione el recurso a eliminar');", true);
            }
        }

        protected int restarRequerimientoAsignado()
        {
            int idRequerimiento = Convert.ToInt32(gvRecursosAsignados.SelectedDataKey.Value);
            int cantidadInicial = controlRecursosAsignados.obtenerRequerimientoAsignado(idRequerimiento, Convert.ToInt32(idEventoSeleccionado.Value)).cantidad.Value;
            return (cantidadInicial - Convert.ToInt32(txtCantidadAs.Text));
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            if (gvRecursosNoAsignados.SelectedDataKey != null)
            {
                int idReq = Convert.ToInt32(gvRecursosNoAsignados.SelectedDataKey.Value.ToString());
                tblrecurso requerimiento = controlRequerimientos.obtenerRequerimiento(idReq, null);
                if (requerimiento.cuantificable)
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
                ScriptManager.RegisterStartupScript(this.UpdateBtnAñadir, GetType(), "ErrorSeleccion", "alertify.error('Seleccione el recurso a añadir');", true);
            }
        }

        protected void insertarRequerimiento(int? cant)
        {
            int cantidad;
            if (cant == null)
                cantidad = 1;
            else
                cantidad = cant.Value;
            if (controlRecursosAsignados.insertar(Convert.ToInt32(idEventoSeleccionado.Value), Convert.ToInt32(gvRecursosNoAsignados.SelectedDataKey.Value.ToString()), cantidad))
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
                if (controlEventos.modificarObservacion(Convert.ToInt32(idEventoSeleccionado.Value), txtObservaciones.Text))
                {
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarRecursos, GetType(), "SalirVentana", "$('#ModalRecursos').modal('hide');", true);
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarRecursos, GetType(), "GrabarObservaciones", "alertify.success('Evento guardado correctamente');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdateGrabarRecursos, GetType(), "ErrorObservaciones", "alertify.error('Error al grabar el evento')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdateGrabarRecursos, GetType(), "ErrorObservaciones", "alertify.error('Llene el campo de observaciones')", true);
            }
        }

        protected void gvRecursosAsignados_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idReq = Convert.ToInt32(gvRecursosAsignados.SelectedDataKey.Value.ToString());
            tblrecursoasignado requerimiento = controlRecursosAsignados.obtenerRequerimientoAsignado(idReq, Convert.ToInt32(idEventoSeleccionado.Value));
            txtCantidadAs.Text = requerimiento.cantidad.ToString();
            txtCantidadAs.Focus();
        }

        protected void gvRecursosNoAsignados_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idReq = Convert.ToInt32(gvRecursosNoAsignados.SelectedDataKey.Value.ToString());
            tblrecurso requerimiento = controlRequerimientos.obtenerRequerimiento(idReq, null);
            txtCantidad.Text = "1";
            if (requerimiento.cuantificable)
            {
                txtCantidad.Enabled = true;
            }
            else
            {
                txtCantidad.Enabled = false;
            }
            txtCantidad.Focus();
        }

        protected void gvEventos_Cerrados_RowDataBound(object sender, GridViewRowEventArgs e)
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

            }
        }

        protected void btnEncuesta_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            TableCell celda = (TableCell)imgBtn.Parent;
            GridViewRow renglon = (GridViewRow)celda.Parent;
            gvEventos_Cerrados.SelectedIndex = renglon.RowIndex;
            int idEvento = Convert.ToInt32(gvEventos_Cerrados.SelectedDataKey.Value.ToString());
            tblevento evento = controlEventos.obtenerEvento(idEvento);
            tblcalidadservicio calidad = controlEncuestas.obtenerCalidadServicio(evento.fk_idservicio);
            idCalidad.Value = calidad.id.ToString();
            txtSolicitante.Text = evento.tblservicio.tblusuario.nombre + evento.tblservicio.tblusuario.apellidos;
            if (calidad.estatus)
            {
                this.cargarTablaEncuesta(calidad.id);
                txtPromedio.Text = calidad.promedio.ToString();
                this.cambiarImagenEncuesta(calidad.promedio);
                txtObEncuestas.Text = calidad.observaciones;
                txtObEncuestas.Enabled = false;
                btnGrabarEncuesta.Text = "Aceptar";
                ScriptManager.RegisterStartupScript(this.UpGvEventosCerrados, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('show');", true);
            }
            else if (calidad.estatus == false && controlUsuario.obtenerUsuarioDeSession(this).fk_idtipo == 1)
            {
                this.cargarTablaEncuesta(null);
                txtObEncuestas.Enabled = true;
                txtObEncuestas.Text = "";
                txtPromedio.Text = "1";
                btnGrabarEncuesta.Text = "Grabar";
                ScriptManager.RegisterStartupScript(this.UpGvEventosCerrados, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('show');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpGvEventosCerrados, this.GetType(), "restriccion", "alertify.error('Encuesta no realizada');", true);
            }
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

        protected void btnGrabarEncuesta_Click(object sender, EventArgs e)
        {
            if (btnGrabarEncuesta.Text.Equals("Aceptar"))
            {
                ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('hide');", true);
            }
            else
            {
                if (!String.IsNullOrWhiteSpace(txtObEncuestas.Text))
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
                            this.cargarTablasEventos();
                            ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "EncuestaGuarda", "alertify.success('Se registró la encuesta');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "EncuestNoGuardada", "alertify.error('No se pudo registrar la encuesta');", true);
                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.upGrabarEncuesta, GetType(), "EncuestNoGuardada", "alertify.error('Agregue la observación del servicio');", true);
                }
            }                
        }

        protected void cbCuantificable_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cargarTablasRequerimientos();
        }

        protected void generarPrivilegios()
        {
            if (controlUsuario.obtenerUsuarioDeSession(this).fk_idtipo == 1)
            {
                menuCatalogos.Visible = false;
                menuControl.Visible = false;
            }
        }

    }
    
}
