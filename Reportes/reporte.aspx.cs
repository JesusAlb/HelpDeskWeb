using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
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
    public partial class WebForm1 : System.Web.UI.Page
    {
        hdk_ControlAcceso Control;
        hdk_ControlEquipos controlEquipos;

        protected void Page_Load(object sender, EventArgs e)
        {
            Control = new hdk_ControlAcceso();
            controlEquipos = new hdk_ControlEquipos(Control);
        }

        protected void btnGenerarReporte_Click(object sender, EventArgs e)
        {
            reporte.Reset();
            reporte.LocalReport.ReportEmbeddedResource = "HelpDeskWeb.Reportes.Documentos.ReportEquipos.rdlc";
            ReportDataSource datasource = new ReportDataSource("DataSetEquipos", controlEquipos.cargarTabla(""));
            reporte.LocalReport.DataSources.Add(datasource);
            reporte.LocalReport.Refresh();
            panelReporte.Visible = true;
        }

        protected void llenarCbObjeto(bool completo){
            if (completo)
            {
                cbObjeto.Items.Clear();
                cbObjeto.Items.Add("Incidentes");
                cbObjeto.Items.Add("Eventos");
                cbObjeto.Items.Add("Recursos a eventos");
                cbObjeto.Items.Add("Responsables de equipso");
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
                txtFiltroInt.Visible = false;
                cbEstatus.Visible = true;
            }
            else
            {
                txtFiltroInt.Visible = true;
                txtFiltroInt.Enabled = true;
                cbEstatus.Visible = false;
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
    }
}