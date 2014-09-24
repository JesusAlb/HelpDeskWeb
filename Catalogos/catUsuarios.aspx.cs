using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlAltas;
using HelpDeskWeb.Datos;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb.Catalogos
{
    public partial class Usuarios : System.Web.UI.Page
    {

        private hdk_ControlAcceso Control;
        private hdk_ControlCoordinacion controlCoordinacion;
        private hdk_ControlDepartamento controlDepto;
        private hdk_ControlArea controlArea;
        private hdk_ControlPuesto controlPuesto;
        private int tabItemIndex;
        private string[] datosGrid;

        protected void Page_Load(object sender, EventArgs e)
        {
            lbelUsuario.Text = " " + ((ViewUsuario)(Session["DatosUsuario"])).nomUsuario;
            Control = (hdk_ControlAcceso)Session["Conexion"];
            controlCoordinacion = new hdk_ControlCoordinacion(Control);
            controlDepto = new hdk_ControlDepartamento(Control);
            controlArea = new hdk_ControlArea(Control);
            controlPuesto = new hdk_ControlPuesto(Control);
            
            if (IsPostBack)
            {
                if (gvUsuarios.DataKeyNames[0].Equals("idCoordinacion"))
                {
                    tabItemIndex = 0;
                }
                else if (gvUsuarios.DataKeyNames[0].Equals("idDepto"))
                {
                    tabItemIndex = 1;
                }
                else if (gvUsuarios.DataKeyNames[0].Equals("idArea"))
                {
                    tabItemIndex = 2;
                }
                else if (gvUsuarios.DataKeyNames[0].Equals("idPuesto"))
                {
                    tabItemIndex = 3;
                }
            }
            else
            {
                cargarCombos();
                cargarTablas();
            }
            
        }

        protected void datosParaGrid()
        {
            switch(tabItemIndex){
                case 0:{
                   datosGrid = new string[] {"Coordinaciones", "nomCoordinacion", "idCoordinacion"};
                    break;
                }
                case 1:{
                    datosGrid = new string[] {"Departamentos", "nomDepto", "idDepto" };
                    break;
                }
                case 2:{
                    datosGrid = new string[] { "Areas", "nomArea", "idArea" };
                    break;
                } 
                case 3:{
                    datosGrid = new string[] { "Puestos", "nomPuesto", "idPuesto" };
                    break;
                }
            }           
        }

        protected void cargarCombos()
        {
            cbCoordinaciones.DataSource = controlDepto.cargarComboCord(false);
            cbCoordinaciones.DataBind();
            listCoords.DataSource = controlDepto.cargarComboCord(true);
            listCoords.DataBind();
        }

        protected void cargarTablas()
        {
            datosParaGrid();
            BoundField bf = new BoundField();
            bf.HeaderText = datosGrid[0];
            bf.DataField = datosGrid[1];
            gvUsuarios.Columns.Add(bf);
            gvUsuarios.Columns.RemoveAt(0);
            string[] keys = { datosGrid[2] };
            gvUsuarios.DataKeyNames = keys;
            if (tabItemIndex == 1)
            {
                panelExtraDatos.Visible = filtroExtra.Visible = true;
                gvUsuarios.DataSource = controlDepto.cargarTabla(txtFiltroUs.Text, listCoords.Text);
            }
            else
            {
                panelExtraDatos.Visible = filtroExtra.Visible = false;
                if (tabItemIndex == 0)
                {
                    gvUsuarios.DataSource = controlCoordinacion.cargarTabla(txtFiltroUs.Text);
                    
                }
                else if (tabItemIndex == 2)
                {
                    gvUsuarios.DataSource = controlArea.cargarTabla(txtFiltroUs.Text);
                    cargarCombos();
                }
                else if(tabItemIndex == 3){
                    gvUsuarios.DataSource = controlPuesto.cargarTabla(txtFiltroUs.Text);
                }
            }
            gvUsuarios.DataBind();
        }

        protected void btnCoordinaciones_Click(object sender, EventArgs e)
        {
            btnCoordinaciones.CssClass = "btn btn-primary active";
            btnDepartamentos.CssClass = "btn btn-default";
            btnArea.CssClass = "btn btn-default";
            btnPuestos.CssClass = "btn btn-default";
            lbelAccion.Text = "Alta de coordinaciones";
            tabItemIndex = 0;
            this.cargarTablas();
        }

        protected void btnDepartamentos_Click(object sender, EventArgs e)
        {
            btnCoordinaciones.CssClass = "btn btn-default";
            btnDepartamentos.CssClass = "btn btn-primary active";
            btnArea.CssClass = "btn btn-default";
            btnPuestos.CssClass = "btn btn-default";
            lbelAccion.Text = "Alta de departamentos";
            tabItemIndex = 1;
            this.cargarTablas();
        }

        protected void btnPuestos_Click(object sender, EventArgs e)
        {
            btnCoordinaciones.CssClass = "btn btn-default";
            btnDepartamentos.CssClass = "btn btn-default";
            btnArea.CssClass = "btn btn-default";
            btnPuestos.CssClass = "btn btn-primary active";
            lbelAccion.Text = "Alta de puestos";
            tabItemIndex = 3;
            this.cargarTablas();
        }

        protected void filtrarDatos(object sender, EventArgs e)
        {
            this.cargarTablas();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            txtNomUs.Text = "";
            btnGrabarUs.Text = "Grabar";
            gvUsuarios.SelectedIndex = -1;
            if (tabItemIndex == 0)
            {
                lbelAccion.Text = "Alta de coordinaciones";
            }
            else if (tabItemIndex == 1)
            {
                lbelAccion.Text = "Alta de departamentos";
            }
            else if (tabItemIndex == 2)
            {
                lbelAccion.Text = "Alta de áreas";
            }
            else if (tabItemIndex == 3)
            {
                lbelAccion.Text = "Alta de puestos";
            }
        }

        protected void gvUsuarios_RowCreated(object sender, GridViewRowEventArgs e)
        {
            hdk_utilerias herramienta = new hdk_utilerias();
            herramienta.setRowCreated(sender, e);

        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                btnGrabarUs.Text = "Modificar";
                int elementoSolicitud = Convert.ToInt32(gvUsuarios.SelectedDataKey.Value.ToString());

                if (tabItemIndex == 0)
                {
                    tblcoordinacion coordinacion = controlCoordinacion.obtenerCoordinacion(elementoSolicitud);
                    txtNomUs.Text = coordinacion.nomCoordinacion;
                    lbelAccion.Text = "Modificación de coordinaciones";
                }
                else if (tabItemIndex == 1)
                {
                    tbldepartamento depto = controlDepto.obtenerDepto(elementoSolicitud);
                    txtNomUs.Text = depto.nomDepto;
                    cbCoordinaciones.SelectedValue = depto.coordinacion.ToString();
                    lbelAccion.Text = "Modificación de departamentos";
                }
                else if (tabItemIndex == 2)
                {
                    tblarea area = controlArea.obtenerArea(elementoSolicitud);
                    txtNomUs.Text = area.nomArea;
                    lbelAccion.Text = "Modificación de áreas";
                }
                else if (tabItemIndex == 3)
                {
                    tblpuesto puesto = controlPuesto.obtenerPuesto(elementoSolicitud);
                    txtNomUs.Text = puesto.nomPuesto;
                    lbelAccion.Text = "Modificación de puestos";
                }

            }
            catch
            {

            }
            
        }

        protected void btnGrabarUs_Click(object sender, EventArgs e)
        {
            bool insert = false;
            int idElemento = Convert.ToInt32(gvUsuarios.SelectedDataKey.Value.ToString());

            if (tabItemIndex == 0)
            {
                if (btnGrabarUs.Text.Equals("Grabar"))
                {
                    if (controlCoordinacion.insertar(txtNomUs.Text))
                    {
                        insert = true;
                    }
                }
                else
                {
                    if (controlCoordinacion.modificar(idElemento,txtNomUs.Text))
                    {
                        insert = true;
                    }
                }

            }
            else if (tabItemIndex == 1)
            {
                if (btnGrabarUs.Text.Equals("Grabar"))
                {
                    if (controlDepto.insertar(txtNomUs.Text, Convert.ToInt32(cbCoordinaciones.SelectedValue)))
                    {
                        insert = true;
                    }
                }
                else
                {
                    if (controlDepto.modificar(idElemento, txtNomUs.Text, Convert.ToInt32(cbCoordinaciones.SelectedValue)))
                    {
                        insert = true;
                    }
                }
            }
            else if(tabItemIndex == 2)
            {
                if (btnGrabarUs.Text.Equals("Grabar"))
                {
                    if (controlArea.insertar(txtNomUs.Text))
                    {
                        insert = true;
                    }
                }
                else
                {
                    if (controlArea.modificar(idElemento, txtNomUs.Text))
                    {
                        insert = true;
                    }
                }
            }
            else if(tabItemIndex == 3){

                if (btnGrabarUs.Text.Equals("Grabar"))
                {
                    if (controlPuesto.insertar(txtNomUs.Text))
                    {
                        insert = true;
                    }
                }
                else
                {
                    if (controlPuesto.modificar(idElemento, txtNomUs.Text))
                    {
                        insert = true;
                    }
                }
            }
            
            if (insert)
            {
                txtNomUs.Text = "";
                cbCoordinaciones.SelectedIndex = -1;
                cargarTablas();
                gvUsuarios.SelectedIndex = -1;
            }
        }

        protected void btnArea_Click(object sender, EventArgs e)
        {
            btnCoordinaciones.CssClass = "btn btn-default";
            btnDepartamentos.CssClass = "btn btn-default";
            btnArea.CssClass = "btn btn-primary active";
            btnPuestos.CssClass = "btn btn-default";
            lbelAccion.Text = "Alta de Areas";
            tabItemIndex = 2;
            this.cargarTablas();
        }
    }
}