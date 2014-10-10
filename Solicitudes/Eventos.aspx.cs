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
        private hdk_ControlAcceso Control;
        private hdk_ControlEventos controlEventos;
        private hdk_ControlRequerimientos controlRequerimientos;
        private hdk_ControlUsuario controlUsuario;
        private hdk_utilerias utilerias;
        private ViewUsuario usuarioConectado;
        private hdk_ControlLugar controlLugar;
        private hdk_ControlAsigReq controlRecursosAsignados;
        private tblevento registroEvento;
        private hdk_ControlEncuestas controlEncuestas;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DatosUsuario"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            usuarioConectado = ((ViewUsuario)(Session["DatosUsuario"]));
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlRecursosAsignados = new hdk_ControlAsigReq(Control);
            controlRequerimientos = new hdk_ControlRequerimientos(Control);
            controlEventos = new hdk_ControlEventos(Control);
            controlUsuario = new hdk_ControlUsuario(Control);
            controlLugar = new hdk_ControlLugar(Control);
            controlEncuestas = new hdk_ControlEncuestas(Control);
            txtFechaInicial.Text = new DateTime(DateTime.Today.Year - 1, DateTime.Today.Month, DateTime.Today.Day).ToString("yyyy-MM-dd");
            txtFechaFinal.Text = new DateTime(DateTime.Today.Year + 1, DateTime.Today.Month, DateTime.Today.Day).ToString("yyyy-MM-dd");
            tabEnProceso.Attributes.Add("onclick", "activaTab('1')");
            lbelUsuario.Text = usuarioConectado.nomUsuario;
            if (!IsPostBack)
            {
                this.cargarTablasEventos();
            }

            if (Page.IsPostBack)
            {
                if (Request["__EVENTTARGET"] == "tabAbierta")
                {
                    this.limpiarSeleccion();
                    Session["tab"] = Convert.ToInt32(this.Request.Params.Get("__EVENTARGUMENT"));
                }
                this.cargarTablasEventos();
            }
            this.tblReqAsH1.Width = Unit.Percentage(gvRecursosAsignados.Columns[0].ItemStyle.Width.Value * 0.95);   
        }

        protected void cargarCombosSoporte()
        {
            cbSeguimiento.DataSource = cbSoporte.DataSource = controlUsuario.cargarComboUsuarios(0);
            cbSoporte.DataBind();
            cbSeguimiento.DataBind();
        }

        protected void limpiarSeleccion()
        {
            Session["itemSeleccionado"] = null;
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
                if (usuarioConectado.tipoUsuario == 0)
                {
                    (objeto[x] as GridView).DataSource = controlEventos.cargarTablasSoporte(x, txtFiltro.Text, Convert.ToDateTime(txtFechaInicial.Text), Convert.ToDateTime(txtFechaFinal.Text));
                }
                else
                {
                    (objeto[x] as GridView).DataSource = controlEventos.cargarTablasSolicitante(usuarioConectado.idUsuario, x, txtFiltro.Text, Convert.ToDateTime(txtFechaInicial.Text), Convert.ToDateTime(txtFechaFinal.Text));
                }
                (objeto[x] as GridView).DataBind();
            }

        }

        protected void cargarTablasRequerimientos()
        {
            gvRecursosNoAsignados.DataSource = controlRequerimientos.cargarTabla(txtFiltroReq.Text, cbCuantificable.Text, Convert.ToInt32(Session["itemSeleccionado"]));
            gvRecursosNoAsignados.DataBind();
            gvRecursosAsignados.DataSource = controlRecursosAsignados.cargarTablaReqAsig(Convert.ToInt32(Session["itemSeleccionado"]));
            gvRecursosAsignados.DataBind();
                 
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

        protected void cargarComboLugares()
        {
            cbLugares.DataSource = controlLugar.cargarCombo();
            cbLugares.DataBind();
        }

        protected void gvEventos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["itemSeleccionado"] = (sender as GridView).SelectedDataKey.Value.ToString();
        }

        protected void gvEventos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            utilerias = new hdk_utilerias();
            utilerias.setRowCreated(sender, e);
        }

        protected void btnRecursos_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["tab"]) <2 /*|| usuarioConectado.tipoUsuario == 1*/)
            {
                if (Session["itemSeleccionado"] != null)
                {
                    registroEvento = controlEventos.cargarEvento(Convert.ToInt32(Session["itemSeleccionado"]));
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
                utilerias.limpiarControles(new Object[] { txtTituloNuevo, txtHoraInicial, txtHoraFinal, txtFecha, txtAcomodo, txtAsistencia, txtDescripcion, cbLugares, cbTipo });
                Session["Accion"] = 0;
                ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnNuevoActivado", "$('#ModalNuevo').modal('show');", true);
           // }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["tab"]) < 2 /*|| usuarioConectado.tipoUsuario == 1*/)
            {
                if (Session["itemSeleccionado"] != null)
                {
                    this.cargarComboLugares();
                    lbelTituloModal.Text = "Modificar eventos";
                    registroEvento = controlEventos.cargarEvento(Convert.ToInt32(Session["itemSeleccionado"]));
                    txtTituloNuevo.Text = registroEvento.titulo;
                    txtAcomodo.Text = registroEvento.acomodo;
                    txtAsistencia.Text = registroEvento.asistencia_aprox.Value.ToString();
                    txtDescripcion.Text = registroEvento.descripcion;
                    cbLugares.SelectedValue = registroEvento.lugar.ToString();
                    txtFecha.Text = registroEvento.FechaInicio.Value.Date.ToString("yyyy-MM-dd");
                    txtHoraFinal.Text = registroEvento.horaFn.Value.TimeOfDay.ToString();
                    txtHoraInicial.Text = registroEvento.horaIn.Value.TimeOfDay.ToString();
                    Session["Accion"] = 1;
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnEditarActivado", "$('#ModalNuevo').modal('show');", true);
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (utilerias.verificarCamposVacios(new TextBox[]{txtTituloNuevo, txtAcomodo, txtAsistencia, txtDescripcion, txtFecha, txtHoraInicial, txtHoraFinal}))
            {
                if (Convert.ToInt32(Session["Accion"]) == 0)
                {
                    if (controlEventos.insertarEvento(usuarioConectado.idUsuario, txtTituloNuevo.Text, Convert.ToInt32(cbLugares.SelectedValue), txtAcomodo.Text, cbTipo.Text, Convert.ToDateTime(txtFecha.Text), Convert.ToInt32(txtAsistencia.Text), Convert.ToDateTime(txtHoraFinal.Text), Convert.ToDateTime(txtHoraFinal.Text), txtDescripcion.Text))
                    {
                        this.cargarTablasEventos();
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "SalirVentana", "$('#ModalNuevo').modal('hide');", true);
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "AsignacionCorrecta", "alertify.alert('Correcto', 'Evento creado correctamente', 'onok');", true);
                    }
                }
                else
                {
                    if (controlEventos.editarEvento(Convert.ToInt32(Session["itemSeleccionado"]), txtTituloNuevo.Text, Convert.ToInt32(cbLugares.SelectedValue), txtAcomodo.Text, cbTipo.Text, Convert.ToDateTime(txtFecha.Text), Convert.ToInt32(txtAsistencia.Text), Convert.ToDateTime(txtHoraInicial.Text), Convert.ToDateTime(txtHoraFinal.Text), txtDescripcion.Text))
                    {
                        this.cargarTablasEventos();
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "SalirVentana", "$('#ModalNuevo').modal('hide');", true);
                        ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "AsignacionCorrecta", "alertify.alert('Correcto', 'Evento editado exitosamente', 'onok');", true);
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
            if (Convert.ToInt32(Session["tab"]) < 2 /*|| usuarioConectado.tipoUsuario == 1*/)
            {
                if (Session["itemSeleccionado"] != null)
                {
                    this.cargarCombosSoporte();
                    registroEvento = controlEventos.cargarEvento(Convert.ToInt32(Session["itemSeleccionado"]));
                    cbSeguimiento.SelectedValue = registroEvento.apoyo.ToString();
                    cbSoporte.SelectedValue = registroEvento.responsable.ToString();
                    ScriptManager.RegisterStartupScript(this.UpdateBtns, GetType(), "btnAsignarActivado", "$('#ModalAsignar').modal('show');", true);
                }
            }
        }

        protected void Page_Unload(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["itemSeleccionado"] = null;
            }
        }

        protected void btnGrabarAsignacion_Click(object sender, EventArgs e)
        {
            if (!cbSoporte.SelectedItem.Text.Equals("S/A"))
            {
                if (controlEventos.asignarResponsable(Convert.ToInt32(Session["itemSeleccionado"]), Convert.ToInt32(cbSoporte.SelectedValue), Convert.ToInt32(cbSeguimiento.SelectedValue)))
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
            if (Session["itemSeleccionado"] != null && Convert.ToInt32(Session["tab"]) < 2)
            {
                if (controlEventos.cambiarStatus(Convert.ToInt32(Session["itemSeleccionado"]), 3))
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
            if(Convert.ToInt32(Session["tab"]) == 1 && Session["itemSeleccionado"] != null){
                if (controlEventos.cambiarStatus(Convert.ToInt32(Session["itemSeleccionado"]), 2))
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
                if(controlRecursosAsignados.borrar(Convert.ToInt32(Session["itemSeleccionado"]),Convert.ToInt32(gvRecursosAsignados.SelectedDataKey.Value.ToString()))){
                    this.cargarTablasRequerimientos();
                    ScriptManager.RegisterStartupScript(this.UpdateBtnAñadir, GetType(), "AñadirCantidad", "alertify.success('Se eliminó el recurso al evento');", true);
                    txtCantidadAs.Text = "";
                    gvRecursosAsignados.SelectedIndex = -1;
                }else{
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
                requerimientosSinAsignar_Result requerimiento = controlRequerimientos.obtenerRequerimiento(idReq, null);
                if (requerimiento.tipo.Equals("Cuantificable"))
                {
                   try{
                        int cantidad = Convert.ToInt32(txtCantidad.Text);
                        this.insertarRequerimiento(cantidad);
                   }catch{
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
            if (controlRecursosAsignados.insertar(Convert.ToInt32(Session["itemSeleccionado"]), Convert.ToInt32(gvRecursosNoAsignados.SelectedDataKey.Value.ToString()), cantidad))
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
                if (controlEventos.editarObservaciones(Convert.ToInt32(Session["itemSeleccionado"]), txtObservaciones.Text))
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
            tblrequerimientoaevento requerimiento = controlRecursosAsignados.obtenerRequerimientoAsignado(idReq, Convert.ToInt32(Session["itemSeleccionado"]));
            txtCantidadAs.Text = requerimiento.cantidad.ToString();
        }

        protected void gvRecursosNoAsignados_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idReq = Convert.ToInt32(gvRecursosNoAsignados.SelectedDataKey.Value.ToString());
            requerimientosSinAsignar_Result requerimiento = controlRequerimientos.obtenerRequerimiento(idReq, null);
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

        protected void gvEventos_Cerrados_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["itemSeleccionado"] = (sender as GridView).SelectedDataKey.Value.ToString();
        }

        protected void gvEventos_Cerrados_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton myImageButton = e.Row.FindControl("btnEncuesta") as ImageButton;
                if (myImageButton != null)
                {
                    if (Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "statusCal_Servicio")))
                    {
                        myImageButton.ImageUrl = "../Imagenes/siEncuesta0.png";
                    }
                    else
                    {
                        myImageButton.ImageUrl = "../Imagenes/noEncuesta0.png";
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
            VistaEventosCerrado eventoCerrado = controlEventos.cargarEventoCerrado(idEvento);
            txtSolicitante.Text = eventoCerrado.solicitante;
            if (eventoCerrado.statusCal_Servicio)
            {
                this.cargarTablaEncuesta(eventoCerrado.idCalidad_Servicio);
                txtPromedio.Text = eventoCerrado.promedioCalidad.ToString();
                this.cambiarImagenEncuesta(eventoCerrado.promedioCalidad.Value);
                txtObEncuestas.Text = eventoCerrado.observacionesServicio;
                btnGrabarEncuesta.Text = "Aceptar";             
            }
            else
            {
                this.cargarTablaEncuesta(null);
            }
            
            ScriptManager.RegisterStartupScript(this.UpGvEventosCerrados, GetType(), "btnEncuestas", "$('#ModalEncuesta').modal('show');", true);
        }

        protected void cbRespuesta_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cambiarImagenEncuesta(promedioEncuesta());     
        }

        protected double promedioEncuesta(){
            double suma = 0;
             foreach(GridViewRow row in gvEncuestas.Rows) {
                if(row.RowType == DataControlRowType.DataRow) {
                    DropDownList cbRespuesta = row.FindControl("cbRespuesta") as DropDownList;
                    suma = suma + Convert.ToInt16(cbRespuesta.Text);
                }
            }
            return suma/Convert.ToDouble(gvEncuestas.Rows.Count);
        }

        protected void cambiarImagenEncuesta(double promedio)
        {      
            txtPromedio.Text = promedio.ToString();

            if(promedio <= 2.5){
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel0.png";
            }else if(promedio > 2.5 && promedio <= 4){
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel1.png";
            }else if(promedio > 4 && promedio <= 5.5){
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel2.png";
            }else if(promedio > 5.5 && promedio <=7){
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel3.png";
            }else if(promedio > 7 && promedio <=8.5){
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel4.png";
            }else if(promedio > 8.5 && promedio <=10){
                imgSatisfaccion.ImageUrl = "~/Imagenes/iconos/nivel5.png";
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

            }
        }

    }
    
}
