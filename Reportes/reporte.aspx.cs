using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlBD.Solicitudes;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Reportes
{
    public partial class reporte : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            hdk_utilerias.checarSession(this,true, 2, 2);
            this.generarPrivilegios();
            lbelUsuario.Text = controlUsuario.obtenerUsuarioDeSession(this).username;
            this.cargarEventos();
        }

        protected void cargarEventos()
        {
            int tipo =  controlUsuario.obtenerUsuarioDeSession(this).tipoUsuario;
            int idUsuario = controlUsuario.obtenerUsuarioDeSession(this).idUsuario;
            gvEventos.DataSource = controlEventos.obtenerEventoConRequerimientos(tipo, idUsuario);
            gvEventos.DataBind();
        }

        protected void btnGenerarReporte_Click(object sender, EventArgs e)
        {
            vt_reporte.Reset();
            vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReportEquipos.rdlc";
            ReportDataSource datasource = new ReportDataSource("DataSetEquipos", controlEquipos.dataSource(""));
            vt_reporte.LocalReport.DataSources.Add(datasource);
            vt_reporte.LocalReport.Refresh();
            datosBusqueda.CssClass = "panel-collapse collapse";
            panelReporte.Visible = true;
        }

        protected void llenarCbObjeto(bool completo){
            if (completo)
            {
                cbObjeto.Items.Clear();
                cbObjeto.Items.Add("Incidentes");
                cbObjeto.Items.Add("Eventos");
                cbObjeto.Items.Add("Recursos a eventos");
                cbObjeto.Items.Add("Responsables de equipos");
            }
            else
            {
                cbObjeto.Items.Clear();
                cbObjeto.Items.Add("Incidentes");
                cbObjeto.Items.Add("Eventos");
                this.configurarFiltroIdStatus(0);
            }
        }

        protected void configurarFiltroIdStatus(int index)
        {
            if (index == 0 || index == 1)
            {
                cbEstatus.Visible = true;
            }
            else
            {
                cbEstatus.Visible = false;
                if (index == 2)
                {
                    gvEventos.Visible = true;
                }
            }
        }

        protected void cbObjeto_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.configurarFiltroIdStatus((sender as DropDownList).SelectedIndex);
        }

        protected void rbCalidad_CheckedChanged(object sender, EventArgs e)
        {
            rbGrafico.Enabled = true;
            rbTabular.Enabled = false;
            this.llenarCbObjeto(false);
            if (rbTabular.Checked)
            {
                rbTabular.Checked = false;
            }
        }

        protected void rbRegistros_CheckedChanged(object sender, EventArgs e)
        {
            rbGrafico.Enabled = true;
            rbTabular.Enabled = true;
            this.llenarCbObjeto(true);
        }

        protected void rbGrafico_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void rbTabular_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void generarPrivilegios()
        {
            if (controlUsuario.obtenerUsuarioDeSession(this.Page).tipoUsuario == 1)
            {
                menuCatalogos.Visible = false;
                menuControl.Visible = false;
            }
        }

        protected void gvEventos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias.setRowCreated(sender, e, this);
        }
    }
}