using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelpDeskWeb.Control.Acceso;

namespace HelpDeskWeb
{
    public partial class index : System.Web.UI.Page
    {
        hdk_ControlAcceso Control;

        protected void Page_Load(object sender, EventArgs e)
        {
            Control = new hdk_ControlAcceso();
        }

        protected void entrar_Click(object sender, EventArgs e)
        {
            
            if (Control.encontrarUsuario(txtUsuario.Text, txtPassword.Text))
            {
                Response.Redirect("principal.aspx");
            }
            else
            {
                this.Page.Response.Write("<script language='JavaScript'>window.alert('Contraseña incorrecta');</script>");
                txtUsuario.Text = "";
                txtPassword.Text = "";
            }
        }

    }
}