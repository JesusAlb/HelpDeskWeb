using AjaxControlToolkit;
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlAltas;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Catalogos
{
    public partial class catSolicitudes : System.Web.UI.Page
    {
        private hdk_ControlAcceso Control;
        private hdk_ControlLugar controlLugar;
        private hdk_ControlRequerimientos controlRequerimientos;
        private hdk_ControlTipoIncidencia controlTipoIncidencia;
        hdk_utilerias utilerias;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DatosUsuario"] == null)
            {
                Response.Redirect("../index.aspx");
            }
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).nomUsuario;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlTipoIncidencia = new hdk_ControlTipoIncidencia(Control);
            controlRequerimientos = new hdk_ControlRequerimientos(Control);
            utilerias = new hdk_utilerias();
            controlLugar = new hdk_ControlLugar(Control);
            if (!IsPostBack)
            {
                this.cargarTablaTipoIncidente();
            }
           
        }

        protected void cargarTablaTipoIncidente()
        {
            gvTipoIncidentes.DataSource = controlTipoIncidencia.cargarTabla(txtFiltroTipoIncidentes.Text);
            gvTipoIncidentes.DataBind();
        }

        protected void cargarTablaLugares()
        {
          //  gvLugares.DataSource = controlLugar.cargarTabla(txtFiltroLugares.Text);
         //   gvLugares.DataBind();
        }

        protected void cargarTablaRequerimientos()
        {
            //  gvRequerimientos.DataSource = controlLugar.cargarTabla(txtFiltroLugares.Text);
            //   gvRequerimientos.DataBind();
        }

        protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {

            utilerias.setRowCreated(sender, e);
        }

        protected void btnGrabarMarca_Click(object sender, EventArgs e)
        {

        }

    /*    protected void cargarTablas()
        {
            if (tabItemIndex == 0)
            {
                BoundField bf = new BoundField();
                bf.HeaderText = "Tipo de incidentes";
                bf.DataField = "nomTipoIncidente";
                gvSolicitudes.Columns.Add(bf);
                gvSolicitudes.Columns.RemoveAt(0);
                string[] keys = { "idTipoIncidente" };
                gvSolicitudes.DataKeyNames = keys;
                filtroExtra.Visible = false;
                panelExtraDatos.Visible = false;
                gvSolicitudes.DataSource = controlTipoIncidencia.cargarTabla(txtFiltroSol.Text);
                gvSolicitudes.DataBind();
            }
            else if(tabItemIndex == 1)
            {
                BoundField bf = new BoundField();
                bf.HeaderText = "Lugares";
                bf.DataField = "nomLugar";
                gvSolicitudes.Columns.Add(bf);
                gvSolicitudes.Columns.RemoveAt(0);
                string[] keys = { "idLugar" };
                gvSolicitudes.DataKeyNames = keys;
                filtroExtra.Visible = false;
                panelExtraDatos.Visible = false;
                gvSolicitudes.DataSource = controlLugar.cargarTabla(txtFiltroSol.Text);               
                gvSolicitudes.DataBind();
            }
            else if(tabItemIndex == 2)
            {
                BoundField bf = new BoundField();
                bf.HeaderText = "Requerimientos";
                bf.DataField = "nomRequerimiento";
                gvSolicitudes.Columns.Add(bf);
                gvSolicitudes.Columns.RemoveAt(0);
                string[] keys = { "idRequerimientos" };
                gvSolicitudes.DataKeyNames = keys;
                filtroExtra.Visible = true;
                panelExtraDatos.Visible = true;
                gvSolicitudes.DataSource = controlRequerimientos.cargarTabla(txtFiltroSol.Text, listTipo.SelectedValue, null);
                gvSolicitudes.DataBind();
            }
        }

        protected void btnLugares_Click(object sender, EventArgs e)
        {
            btnTipoIncidentes.CssClass = "btn btn-default";
            btnLugares.CssClass = "btn btn-primary active";
            btnRequerimientos.CssClass = "btn btn-default";            
            lbelAccion.Text = "Alta de lugares";
            tabItemIndex = 1;
            this.cargarTablas();
        }

        protected void btnRequerimientos_Click(object sender, EventArgs e)
        {
            btnTipoIncidentes.CssClass = "btn btn-default";
            btnLugares.CssClass = "btn btn-default";
            btnRequerimientos.CssClass = "btn btn-primary active";
            lbelAccion.Text = "Alta de requerimientos";
            tabItemIndex = 2;
            this.cargarTablas();
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            this.cargarTablas();
            txtFiltroSol.Focus();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            txtNomSol.Text = "";
            btnGrabarTipo.Text = "Grabar";
            gvSolicitudes.SelectedIndex = -1;
            if (tabItemIndex == 0)
            {
                lbelAccion.Text = "Alta de tipo de incidentes";
            }
            else if(tabItemIndex == 1)
            {
                lbelAccion.Text = "Alta de lugares";
            }
            else if(tabItemIndex == 2)
            {
                lbelAccion.Text = "Alta de requerimientos";
            }
        }

        protected void gvSolicitudes_SelectedIndexChanged(object sender, EventArgs e)
        {
                btnGrabarTipo.Text = "Modificar";
                int elementoSolicitud = Convert.ToInt32(gvSolicitudes.SelectedDataKey.Value.ToString());

                if (tabItemIndex == 0)
                {
                    lbelAccion.Text = "Modificación de tipo de incidentes";
                    tbltipoincidencia tipoIncidencia = controlTipoIncidencia.obtenerTipoIncidencia(elementoSolicitud);
                    txtNomSol.Text = tipoIncidencia.nomTipoIncidente;
                }
                else if(tabItemIndex == 1)
                {
                    lbelAccion.Text = "Modificación de lugares";
                    tbllugar lugar = controlLugar.obtenerLugar(elementoSolicitud);
                    txtNomSol.Text = lugar.nomLugar;
                }
                else if(tabItemIndex == 2)
                {
                    lbelAccion.Text = "Modificación de requerimientos";
                    requerimientosSinAsignar_Result requerimiento = controlRequerimientos.obtenerRequerimiento(elementoSolicitud, null);
                    txtNomSol.Text = requerimiento.nomRequerimiento;
                    rbTipoRequerimientos.SelectedValue = requerimiento.tipo;                 
                }
                
            }
        

        protected void btnGrabarTipo_Click(object sender, EventArgs e)
        {
            bool insert = false;
            int idElemento = Convert.ToInt32(gvSolicitudes.SelectedDataKey.Value.ToString());

            if (tabItemIndex == 0)
            {
                if (btnGrabarTipo.Text.Equals("Grabar"))
                {
                    if (controlTipoIncidencia.insertar(txtNomSol.Text))
                    {
                        insert = true;
                    }
                }
                else
                {
                    if (controlTipoIncidencia.modificar(idElemento, txtNomSol.Text))
                    {
                        insert = true;
                    }
                }

            }
            else if(tabItemIndex == 1)
            {
                if (btnGrabarTipo.Text.Equals("Grabar"))
                {
                    if (controlLugar.insertar(txtNomSol.Text))
                    {
                        insert = true;
                    }
                }
                else
                {
                    if (controlLugar.modificar(idElemento, txtNomSol.Text))
                    {
                        insert = true;
                    }
                }
            }
            else
            {
                if (btnGrabarTipo.Text.Equals("Grabar"))
                {
                    if (controlRequerimientos.insertar(txtNomSol.Text, rbTipoRequerimientos.SelectedValue.ToString()))
                    {
                        insert = true;
                    }
                }
                else
                {
                    if (controlRequerimientos.modificar(idElemento, txtNomSol.Text, rbTipoRequerimientos.SelectedValue.ToString()))
                    {
                        insert = true;
                    }
                }
            }

            if (insert)
            {
                txtNomSol.Text = "";
                rbTipoRequerimientos.SelectedIndex = -1;
                cargarTablas();
                gvSolicitudes.SelectedIndex = -1;
            }
        }

        protected void gvSolicitudes_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='none';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.ToolTip = "Click para seleccionar el renglon";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvSolicitudes, "Select$" + e.Row.RowIndex);
            }
        }

        protected void btnTipoIncidentes_Click(object sender, EventArgs e)
        {
            btnTipoIncidentes.CssClass = "btn btn-primary active";
            btnLugares.CssClass = "btn btn-default";
            btnRequerimientos.CssClass = "btn btn-default";
            lbelAccion.Text = "Alta de tipos de incidentes";
            tabItemIndex = 0;
            this.cargarTablas();
        }

        protected void listTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarTablas();
        }

        protected void btnFiltroSol_Click(object sender, EventArgs e)
        {
            cargarTablas();
        }*/
    }
}