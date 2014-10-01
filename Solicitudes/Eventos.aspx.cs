using HelpDeskWeb.ControlAltas;
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlBD.Solicitudes;
using HelpDeskWeb.EntityFrameWork;
using System;
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
            txtFechaInicial.Text = new DateTime(DateTime.Today.Year - 1, DateTime.Today.Month, DateTime.Today.Day).ToString("yyyy-MM-dd");
            txtFechaFinal.Text = new DateTime(DateTime.Today.Year + 1, DateTime.Today.Month, DateTime.Today.Day).ToString("yyyy-MM-dd");
            tabEnProceso.Attributes.Add("onclick", "activaTab('1')");

            if (!IsPostBack)
            {
                this.cargarTablas();
            }

            if (Page.IsPostBack)
            {
                if (Request["__EVENTTARGET"] == "tabAbierta")
                {
                    this.limpiarSeleccion();
                    Session["tab"] = Convert.ToInt32(this.Request.Params.Get("__EVENTARGUMENT"));
                    utilerias.modificarOnClientClick(new LinkButton[] { btnEditar, btnAsignar, btnRecursos }, new string[] { null, null, null });
                }
            }
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

        protected void cargarTablas()
        {
            this.cargarTablasConjunto(new Object[] { gvEventos_Abiertos, gvEventos_EnProceso, gvEventos_Cerrados, gvEventos_Cancelados });
        }

        protected void cargarTablasConjunto(object[] objeto)
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

        protected void cargarComboLugares()
        {
            cbLugares.DataSource = controlLugar.cargarCombo();
            cbLugares.DataBind();
        }

        protected void definirPrivilegios(int tab)
        {
            switch (tab)
            {
                case 0:
                    {
                        utilerias.modificarOnClientClick(new LinkButton[] { btnEditar, btnAsignar, btnRecursos }, new string[] { "mostrarModal('ModalNuevo','show')", "mostrarModal('ModalAsignar','show')", "mostrarModal('ModalRecursos','show')" });
                        break;
                    }
                case 1:
                    {
                        utilerias.modificarOnClientClick(new LinkButton[] { btnEditar, btnAsignar, btnRecursos }, new string[] { "mostrarModal('ModalNuevo','show')", "mostrarModal('ModalAsignar','show')", "mostrarModal('ModalRecursos','show')" });
                        break;
                    }
                case 2:
                    {
                        utilerias.modificarOnClientClick(new LinkButton[] { btnEditar, btnAsignar, btnRecursos }, new string[] { null, null, null });
                        break;
                    }
                case 3:
                    {
                        utilerias.modificarOnClientClick(new LinkButton[] { btnEditar, btnAsignar, btnRecursos }, new string[] { null, null, null });
                        break;
                    }
            }

        }

        protected void gvEventos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["itemSeleccionado"] = (sender as GridView).SelectedDataKey.Value.ToString();
            this.definirPrivilegios(Convert.ToInt32(Session["tab"]));
        }

        protected void gvEventos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            utilerias = new hdk_utilerias();
            utilerias.setRowCreated(sender, e);
        }

        protected void btnRecursos_Click(object sender, EventArgs e)
        {
            if (Session["itemSeleccionado"] != null)
            {
                registroEvento = controlEventos.cargarEvento(Convert.ToInt32(Session["itemSeleccionado"]));
                txtTitulo.Text = registroEvento.titulo;
                gvRecursosNoAsignados.DataSource = controlRequerimientos.cargarTabla("", "", Convert.ToInt32(Session["itemSeleccionado"]));
                gvRecursosNoAsignados.DataBind();
                gvRecursosAsignados.DataSource = controlRecursosAsignados.cargarTablaReqAsig(Convert.ToInt32(Session["itemSeleccionado"]));
                gvRecursosAsignados.DataBind();
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.cargarComboLugares();
            lbelTituloModal.Text = "Alta de eventos";
            utilerias.limpiarControles(new Object[] { txtTituloNuevo, txtHoraInicial, txtHoraFinal, txtFecha, txtAcomodo, txtAsistencia, txtDescripcion, cbLugares, cbTipo });
            Session["Accion"] = 0;
        }

        protected void btnEditar_Click(object sender, EventArgs e)
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
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["Accion"]) == 0)
            {
                if (controlEventos.insertarEvento(usuarioConectado.idUsuario, txtTituloNuevo.Text, Convert.ToInt32(cbLugares.SelectedValue), txtAcomodo.Text, cbTipo.Text, Convert.ToDateTime(txtFecha.Text), Convert.ToInt32(txtAsistencia.Text), Convert.ToDateTime(txtHoraFinal.Text), Convert.ToDateTime(txtHoraFinal.Text), txtDescripcion.Text))
                {
                    this.cargarTablas();
                    ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "SalirVentana", "mostrarModal('ModalNuevo','hide');", true);
                }
            }
            else
            {
                if (controlEventos.editarEvento(Convert.ToInt32(Session["itemSeleccionado"]), txtTituloNuevo.Text, Convert.ToInt32(cbLugares.SelectedValue), txtAcomodo.Text, cbTipo.Text, Convert.ToDateTime(txtFecha.Text), Convert.ToInt32(txtAsistencia.Text), Convert.ToDateTime(txtHoraInicial.Text), Convert.ToDateTime(txtHoraFinal.Text), txtDescripcion.Text))
                {
                    this.cargarTablas();
                    ScriptManager.RegisterStartupScript(this.UpdateGrabar, this.GetType(), "SalirVentana", "mostrarModal('ModalNuevo','hide');", true);
                }
            }

        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            if (Session["itemSeleccionado"] != null && Convert.ToInt32(Session["tab"]) < 2)
            {
                this.cargarCombosSoporte();
                registroEvento = controlEventos.cargarEvento(Convert.ToInt32(Session["itemSeleccionado"]));
                cbSeguimiento.SelectedValue = registroEvento.apoyo.ToString();
                cbSoporte.SelectedValue = registroEvento.responsable.ToString();
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
                    this.cargarTablas();
                    ScriptManager.RegisterStartupScript(this.UpdateSoporte, this.GetType(), "SalirVentanaSoporte", "mostrarModal('ModalAsignar','hide');", true);
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
                    this.cargarTablas();
                    ScriptManager.RegisterStartupScript(this.update1, this.GetType(), "EventoCancelado", "alertify.alert('Correcto', 'Evento cancelado correctamente', 'onok');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.update1, this.GetType(), "ErrorServidor", "alertify.alert('Error', 'Error en el servidor', 'onok');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.update1, this.GetType(), "ErrorNoId", "alertify.alert('Error', 'Seleccione un evento abierto o en proceso', 'onok');", true);
            }

        }
    }
}