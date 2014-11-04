using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb
{
    public partial class paginaMaestra : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (hdk_ControlUsuario.obtenerUsuarioDeSession(this.Page).tipoUsuario == 0)
            {
                linkInicio.NavigateUrl = linkPrincipal.NavigateUrl = "~/soporte.aspx";
            }
            else
            {
                linkInicio.NavigateUrl = linkPrincipal.NavigateUrl = "~/solicitante.aspx";
            }
            lbelUsuario.Text = hdk_ControlUsuario.obtenerUsuarioDeSession(this.Page).username;
            generarPrivilegios();
        }

        protected void generarPrivilegios()
        {
            if (hdk_ControlUsuario.obtenerUsuarioDeSession(this.Page).tipoUsuario == 1)
            {
                menuCatalogos.Visible = false;
                menuControl.Visible = false;
            }
        }

    }
}