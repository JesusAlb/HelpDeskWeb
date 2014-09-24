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
        private hdk_utilerias utilerias;
        private ViewUsuario usuarioConectado;
        private hdk_ControlLugar controlLugar;
        private hdk_ControlAsigReq controlRecursosAsignados;
        private int tab;

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioConectado = ((ViewUsuario)(Session["DatosUsuario"]));
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlRecursosAsignados = new hdk_ControlAsigReq(Control);
            controlRequerimientos = new hdk_ControlRequerimientos(Control);
            controlEventos = new hdk_ControlEventos(Control);
            controlLugar = new hdk_ControlLugar(Control);
            txtFechaInicial.Text = "2013-01-01";
            txtFechaFinal.Text = DateTime.Today.ToString("yyyy-MM-dd");
            tabEnProceso.Attributes.Add("onclick", "activaTab('1')");

            if (!IsPostBack)
            {
                this.cargarTablas();
            }

            if (Page.IsPostBack)
            {
                if (Request["__EVENTTARGET"] == "tabAbierta")
                {
                    tab = Convert.ToInt32(this.Request.Params.Get("__EVENTARGUMENT"));
                    btnEditar.OnClientClick = null;
                    btnAsignar.OnClientClick = null;
                    btnRecursos.OnClientClick = null;
                }
            }
        }

        protected void cargarTablas()
        {
            this.cargarTablasConjunto(new Object[] {gvEventos_Abiertos, gvEventos_EnProceso, gvEventos_Cerrados, gvEventos_Cancelados});
        }

        protected void cargarTablasConjunto(object[] objeto)
        {
            for(int x = 0; x < objeto.Length; x++){
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

        protected void definirPrivilegios()
        {
            switch (tab)
            {
                case 0:
                    {
                        btnEditar.OnClientClick = "mostrarModal('ModalNuevo')";
                        btnAsignar.OnClientClick = "mostrarModal('ModalAsignar')";
                        btnRecursos.OnClientClick = "mostrarModal('ModalRecursos')";
                        break;
                    }
                case 1:
                    {
                        btnEditar.OnClientClick = "mostrarModal('ModalNuevo')";
                        btnAsignar.OnClientClick = "mostrarModal('ModalAsignar')";
                        btnRecursos.OnClientClick = "mostrarModal('ModalRecursos')";
                        break;
                    }
                case 2:
                    {
                        btnEditar.OnClientClick =null;
                        btnAsignar.OnClientClick =null;
                        btnRecursos.OnClientClick = null ;
                        break;
                    }
                case 3:
                    {
                        btnEditar.OnClientClick = null;
                        btnAsignar.OnClientClick = null;
                        btnRecursos.OnClientClick = null;
                        break;
                    }
            }
        }

        protected void gvEventos_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.definirPrivilegios();
            Session["itemSeleccionado"] = (sender as GridView).SelectedDataKey.Value.ToString();
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
            utilerias.limpiarControles(new Object[]{txtTituloNuevo, txtHoraInicial, txtHoraFinal, txtFecha, txtAcomodo, txtAsistencia, txtDescripcion, cbLugares, cbTipo});
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (Session["itemSeleccionado"] != null)
            {
                this.cargarComboLugares();
                lbelTituloModal.Text = "Modificar eventos";
                int idEvento = Convert.ToInt32(Session["itemSeleccionado"]);
                tblevento evento = controlEventos.cargarEvento(idEvento);
                txtTituloNuevo.Text = evento.titulo;
                txtAcomodo.Text = evento.acomodo;
                txtAsistencia.Text = evento.asistencia_aprox.Value.ToString(); ;
                txtDescripcion.Text = evento.descripcion;
                cbLugares.SelectedValue = evento.lugar.ToString();
                txtFecha.Text = evento.FechaInicio.Value.Date.ToString("yyyy-MM-dd");
                txtHoraFinal.Text = evento.horaFn.Value.TimeOfDay.ToString();
                txtHoraInicial.Text = evento.horaIn.Value.TimeOfDay.ToString();
            }
        }

        void Page_Unload(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["itemSeleccionado"] = null;
            }
        }

    }
}