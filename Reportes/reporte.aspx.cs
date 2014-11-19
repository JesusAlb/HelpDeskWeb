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
            lbelUsuario.Text = controlUsuario.obtenerUsuarioDeSession(this).nombre_usuario;
            this.cargarEventos();
            if (this.Page.IsPostBack)
            {
                if (Request["__EVENTTARGET"] == "txtFiltroAbierto")
                {
                    this.cargarEventos();
                }
            }
        }

        protected void cargarEventos()
        {
            gvEventos.DataSource = controlReportes.dataSourceEventosConRequerimientos(txtFiltroAbierto.Text);
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

            switch (reporte)
            {
                case 0: { 
                //incidentes completos
                            vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReporteIncidentes.rdlc";
                            //ReportDataSource datasource = new ReportDataSource("DataSetIncidentes", controlReportesIncidentes.)
                        }
                    break;

                case 1:
                    { //eventos completos

                    }
                    break;

                case 2: 
                   {//requerimientos por evento
                        if (gvEventos.SelectedDataKey != null)
                        {
                            vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReporteRequerimientos.rdlc";
                            ReportDataSource datasource = new ReportDataSource("DataSetRecursosPorEvento", controlReportes.dataSourceRecursosPorEventos(Convert.ToInt32(gvEventos.SelectedDataKey.Value)));
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
                        ReportDataSource datasource = new ReportDataSource("DataSetEventosPorUsuario", controlReportes.dataSourceEventosPorUsuario());
                        vt_reporte.LocalReport.DataSources.Add(datasource);
                        ReportDataSource datasource2 = new ReportDataSource("DataSetEventosPorMes", controlReportes.dataSourceEventosPorMes());
                        vt_reporte.LocalReport.DataSources.Add(datasource2);
                        ReportDataSource datasource3 = new ReportDataSource("DataSetRecursosMasUsados", controlReportes.dataSourceRecursosMasUsados());
                        vt_reporte.LocalReport.DataSources.Add(datasource3);
                    }break;


                case 5:
                    {//calidad de eventos

                    }break;

                case 6:
                    {//estadisticas de incidentes

                    }break;

                case 7:
                    {//calidad en incidentes

                    }break;

                default:
                    break;
            }
        }

        protected void cargarComboBoxObjeto(int tipo){
            cbObjeto.Items.Add("Incidentes completos");
            cbObjeto.Items.Add("Eventos completos");
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
            hdk_utilerias.setRowCreated(sender, e, this);
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

        protected void inhabilitarControles(bool Estatus, bool FiltroAbierto, bool rengoFechas)
        {
            cbEstatus.Enabled = Estatus;
            txtFiltroAbierto.Enabled = FiltroAbierto;
            panelRangoFechas.Enabled = rengoFechas;
        }
        
    }
}