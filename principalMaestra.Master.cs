﻿using HelpDeskWeb.ControlBD.Catalogo;
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
            if (controlUsuario.obtenerUsuarioDeSession(this.Page).fk_idtipo == 0)
            {
                linkInicio.NavigateUrl = linkPrincipal.NavigateUrl = "~/soporte.aspx";
            }
            else
            {
                linkInicio.NavigateUrl = linkPrincipal.NavigateUrl = "~/solicitante.aspx";
            }
            lbelUsuario.Text = controlUsuario.obtenerUsuarioDeSession(this.Page).nombre_usuario;
            generarPrivilegios();
        }

        protected void generarPrivilegios()
        {
            if (controlUsuario.obtenerUsuarioDeSession(this.Page).fk_idtipo == 1)
            {
                menuCatalogos.Visible = false;
                menuControl.Visible = false;
            }
        }

    }
}