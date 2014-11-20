using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlBD.Solicitudes;
using HelpDeskWeb.ControlBD.Solicitudes.Incidentes;
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
            Utilerias.checarSession(this,true, 2, 2);
            this.generarPrivilegios();
            lbelUsuario.Text = controlUsuario.obtenerUsuarioDeSession(this).nombre_usuario;
            this.cargarEventos();    

            if (Page.IsPostBack)
            {
                if (Request["__EVENTTARGET"] == "txtFiltroAbierto")
                {
                    this.cargarEventos();
                }
            }
        }

        protected void cargarEventos()
        {
            gvEventos.DataSource = controlReportesEventos.dataSourceEventosConRequerimientos(txtFiltroAbierto.Text);
            gvEventos.DataBind();
        }

        protected void btnGenerarReporte_Click(object sender, EventArgs e)
        {

            vt_reporte.Reset();
            this.generarReporte(cbObjeto.SelectedIndex);
            vt_reporte.LocalReport.Refresh();
            datosBusqueda.CssClass = "panel-collapse collapse";
            panelReporte.Visible = true;
        }

        protected void generarReporte(int reporte)
        {
            bool generar = true;
            dbhelp.modelo.tblservicio.ToList();

            switch (reporte)
            {
                case 0: { 
                //incidentes completos
                            int? idsolicitante = null;
                            vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReportIncidentes.rdlc";    
                            if(controlUsuario.obtenerUsuarioDeSession(this).tipo == 1){
                                idsolicitante = controlUsuario.obtenerUsuarioDeSession(this).id;
                            }
                            ReportDataSource datasource = new ReportDataSource("DataSetIncidentes", controlReportesIncidentes.dataSourceIncidentes(idsolicitante, "", cbEstatus.SelectedItem.Text, txtFiltroAbierto.Text, Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                            vt_reporte.LocalReport.DataSources.Add(datasource);
                        }
                    break;

                case 1:
                    { //eventos completos
                        int? idsolicitante = null;
                        vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReportEventos.rdlc";
                        if (controlUsuario.obtenerUsuarioDeSession(this).tipo == 1)
                        {
                            idsolicitante = controlUsuario.obtenerUsuarioDeSession(this).id;
                        }
                        ReportDataSource datasource = new ReportDataSource("DataSetEventos", controlReportesEventos.dataSourceEventos(idsolicitante, "", cbEstatus.SelectedItem.Text, txtFiltroAbierto.Text, Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                        vt_reporte.LocalReport.DataSources.Add(datasource);
                    }
                    break;

                case 2: 
                   {//requerimientos por evento
                        if (gvEventos.SelectedDataKey != null)
                        {
                            vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReporteRequerimientos.rdlc";
                            ReportDataSource datasource = new ReportDataSource("DataSetRecursosPorEvento", controlReportesEventos.dataSourceRecursosPorEventos(Convert.ToInt32(gvEventos.SelectedDataKey.Value)));
                            vt_reporte.LocalReport.DataSources.Add(datasource);

                        }
                    }break;

                case 3:
                    {//Responsables de equipos
                        vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReportEquipos.rdlc";
                        ReportDataSource datasource = new ReportDataSource("DataSetEquipos", controlReportesEquipos.dataSourceReporteEquipos(txtFiltroAbierto.Text));
                        vt_reporte.LocalReport.DataSources.Add(datasource);
                    }break;

                case 4:
                    {//Estadisticas de eventos
                        vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReporteEstadisticoEventos.rdlc";
                        ReportDataSource datasource = new ReportDataSource("DataSetEventosPorUsuario", controlReportesEventos.dataSourceEventosPorUsuario(Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                        vt_reporte.LocalReport.DataSources.Add(datasource);
                        ReportDataSource datasource2 = new ReportDataSource("DataSetEventosPorMes", controlReportesEventos.dataSourceEventosPorTiempo(Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                        vt_reporte.LocalReport.DataSources.Add(datasource2);
                        ReportDataSource datasource3 = new ReportDataSource("DataSetRecursosMasUsados", controlReportesEventos.dataSourceRecursosMasUsados(Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                        vt_reporte.LocalReport.DataSources.Add(datasource3);
                    }break;


                case 5:
                    {//calidad de eventos
                        vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReporteCalidadEventos.rdlc";
                        ReportDataSource datasource = new ReportDataSource("promedioCalidadUsuario", controlReportesEventos.dataSourceCalidadPorUsuario(Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                        vt_reporte.LocalReport.DataSources.Add(datasource);
                        ReportDataSource datasource2 = new ReportDataSource("promedioCalidadMes", controlReportesEventos.dataSourceCalidadPorTiempo(Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                        vt_reporte.LocalReport.DataSources.Add(datasource2);
                    }break;

                case 6:
                    {//estadisticas de incidentes
                        vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReporteEstadisticoIncidentes.rdlc";
                        ReportDataSource datasource = new ReportDataSource("DataSetNumInTipo", controlReportesIncidentes.dataSourceIncidentesPorTipo(Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                        vt_reporte.LocalReport.DataSources.Add(datasource);
                        ReportDataSource datasource2 = new ReportDataSource("DataSetNumInUsuario", controlReportesIncidentes.dataSourceIncidentesPorUsuario(Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                        vt_reporte.LocalReport.DataSources.Add(datasource2);
                        ReportDataSource datasource3 = new ReportDataSource("DataSetNumInMes", controlReportesIncidentes.dataSourceIncidentesPorMes(Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                        vt_reporte.LocalReport.DataSources.Add(datasource3);
                        ReportDataSource datasource4 = new ReportDataSource("DataSetNumInDepto", controlReportesIncidentes.dataSourceIncidentesPorDepartamento(Utilerias.convertirFecha(txtFechaInicial.Text), Utilerias.convertirFecha(txtFechaFinal.Text)));
                        vt_reporte.LocalReport.DataSources.Add(datasource4);
                    }break;

                case 7:
                    {//calidad en incidentes

                    }break;

                default:
                    break;
            }

            if (generar)
            {
                vt_reporte.LocalReport.Refresh();
                datosBusqueda.CssClass = "panel-collapse collapse";
                panelReporte.Visible = true;
            }
        }

        protected void cargarComboBoxObjeto(int tipo){
            if (cbObjeto.Items.Count == 0)
            {
                cbObjeto.Items.Add("Incidentes");
                cbObjeto.Items.Add("Eventos");
                cbObjeto.Items.Add("Requerimientos para evento");
                if (tipo == 0)
                {
                    cbObjeto.Items.Add("Responsables de equipos");
                    cbObjeto.Items.Add("Estadisticas de eventos");
                    cbObjeto.Items.Add("Calidad en eventos");
                    cbObjeto.Items.Add("Estadísticas de incidentes");
                    cbObjeto.Items.Add("Calidad en incidentes");
                }
            }
        }

        protected void cbObjeto_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.manipulaciónDeControles((sender as DropDownList).SelectedIndex);
        }

        protected void generarPrivilegios()
        {
            int tipo = controlUsuario.obtenerUsuarioDeSession(this.Page).tipo;
            cargarComboBoxObjeto(tipo);
            if (tipo == 1)
            {
                menuCatalogos.Visible = false;
                menuControl.Visible = false;

            }
        }

        protected void gvEventos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            Utilerias.setRowCreated(sender, e, this);
        }

        protected void manipulaciónDeControles(int index)
        {
            if (index == 2)
            {
                this.inhabilitarControles(false, true, true);
                panelGrid.Visible = true;
            }
            else
            {
                panelGrid.Visible = false;

                if (index <= 1)
                {
                    this.inhabilitarControles(true, true, true);
                }
                else if(index == 3)
                {
                    this.inhabilitarControles(false, true, false);
                }
                else 
                {
                    this.inhabilitarControles(false, false, true);
                }

            }

        }

        protected void inhabilitarControles(bool Estatus, bool FiltroAbierto, bool rangoFechas)
        {
            cbEstatus.Enabled = Estatus;
            txtFiltroAbierto.Enabled = FiltroAbierto;
            if (rangoFechas)
            {
                panelRangoFechas.Enabled = rangoFechas;
                txtFechaInicial.Text = new DateTime(DateTime.Today.Year - 1, DateTime.Today.Month, DateTime.Today.Day).ToString("yyyy-MM-dd");
                txtFechaFinal.Text = new DateTime(DateTime.Today.Year + 1, DateTime.Today.Month, DateTime.Today.Day).ToString("yyyy-MM-dd");      
            }
        }
        
    }
}