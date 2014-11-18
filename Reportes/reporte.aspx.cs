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
            // vt_reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReportEquipos.rdlc";
            this.elegirReporte();
            vt_reporte.LocalReport.Refresh();
            datosBusqueda.CssClass = "panel-collapse collapse";
            panelReporte.Visible = true;
        }

        protected void elegirReporte()
        {
            switch (cbObjeto.SelectedIndex)
            {
                case 0:
                    {

                    }break;
                case 1:
                    {
                     /*   if (rbGrafico.Checked)
                        {
                            this.generarReporte("HelpDeskWeb.Reportes.Documentos.ReporteEstadisticoEventos.rdlc", "EventosEstadistica");
                        }
                        else if(rbTabular.Checked)
                        {
                            this.generarReporte("HelpDeskWeb.Reportes.Documentos.ReportEventos.rdlc", "EventosGeneral");
                        }*/
                    }break;
                case 2:
                    {
                        this.generarReporte("HelpDeskWeb.Reportes.Documentos.ReporteRequerimientos.rdlc", "RecursosPorEvento");
                    }break;
                case 3:
                    {
                        this.generarReporte("HelpDeskWeb.Reportes.Documentos.ReportEquipos.rdlc", "Equipos");
                    }break;
                default:
                    break;

            }
 
        }

        protected void generarReporte(string direccion, string reporte)
        {
            vt_reporte.LocalReport.ReportEmbeddedResource = direccion;

            switch (reporte)
            {
                case "Equipos":
                    {


                    }break;

                case "EventosEstadistica":
                    {
                        ReportDataSource datasource = new ReportDataSource("DataSetEventosPorUsuario", controlReportes.dataSourceEventosPorUsuario());
                        vt_reporte.LocalReport.DataSources.Add(datasource);
                        ReportDataSource datasource2 = new ReportDataSource("DataSetEventosPorMes", controlReportes.dataSourceEventosPorMes());
                        vt_reporte.LocalReport.DataSources.Add(datasource2);
                        ReportDataSource datasource3 = new ReportDataSource("DataSetRecursosMasUsados", controlReportes.dataSourceRecursosMasUsados());
                        vt_reporte.LocalReport.DataSources.Add(datasource3);
                    }break;

                case "RecursosPorEvento":
                    {
                        if (gvEventos.SelectedDataKey != null)
                        {
                            ReportDataSource datasource = new ReportDataSource("DataSetRecursosPorEvento", controlReportes.dataSourceRecursosPorEventos(Convert.ToInt32(gvEventos.SelectedDataKey.Value)));
                            vt_reporte.LocalReport.DataSources.Add(datasource);

                        }
                    }break;
                default:
                    break;
            }
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
            if (index == 2)
            {
                gvEventos.Visible = true;
            }
            else
            {
                if (index == 0 || index == 1)
                {
                    cbEstatus.Visible = true;
                }
                else
                {
                    cbEstatus.Visible = false;
                }
                gvEventos.Visible = false;
            }
        }

        protected void cbObjeto_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.configurarFiltroIdStatus((sender as DropDownList).SelectedIndex);
        }

        protected void rbRegistros_CheckedChanged(object sender, EventArgs e)
        {
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
            if (controlUsuario.obtenerUsuarioDeSession(this.Page).tipo == 1)
            {
                menuCatalogos.Visible = false;
                menuControl.Visible = false;
            }
        }

        protected void gvEventos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias.setRowCreated(sender, e, this);
        }

        protected void rbCalidad_CheckedChanged(object sender, EventArgs e)
        {

        }

    }
}