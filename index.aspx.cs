using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelpDeskWeb.ControlBD.Acceso;
using System.Web.Security;

namespace HelpDeskWeb
{
    public partial class login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Utilerias.checarSession(this, false, 1, 0);
            controlAcceso.encontrarUsuario("", "", this);
        }

        protected void entrar_Click(object sender, EventArgs e)
        {    
            int usuario = controlAcceso.encontrarUsuario(txtUsuario.Text, txtPassword.Text, this.Page);
            if (usuario != -1)
            {
                if (usuario == 0)
                {
                    Response.Redirect("soporte.aspx");
                }
                else
                {
                    Response.Redirect("solicitante.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Update, this.GetType(), "UsuarioIncorrecto", "alertify.error('Usuario o contraseña inválidos');", true);
                txtUsuario.Text = "";
                txtPassword.Text = "";
            }
        }

    }
}