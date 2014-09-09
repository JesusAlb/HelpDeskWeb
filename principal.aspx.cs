using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelpDeskWeb.ControlBD.Catalogo;
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.Modelo;

namespace HelpDeskWeb
{
    public partial class principal : System.Web.UI.Page
    {
        ViewUsuario usuarioConectado;

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioConectado = (ViewUsuario)(Session["DatosUsuario"]);
            generarPrivilegios();
            identificacion();
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

        protected void identificacion()
        {
            lbelUsuario.Text =" " + usuarioConectado.nomUsuario;
            lbelNomUsuario.Text = usuarioConectado.nomCompleto;
            lbelTipoUsuario.Text = usuarioConectado.tipoUsuarioString;
        }
    }
}