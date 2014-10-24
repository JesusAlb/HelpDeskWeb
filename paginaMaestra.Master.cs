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
        private ViewUsuario usuarioConectado;

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioConectado = (ViewUsuario)(Session["DatosUsuario"]);
            lbelUsuario.Text = usuarioConectado.nomUsuario;
            generarPrivilegios();
        }

        protected void generarPrivilegios()
        {
            if (usuarioConectado.tipoUsuario == 0)
            {

            }
            else
            {
                menuCatalogos.Visible = false;
                menuControl.Visible = false;
            }
        }

    }
}