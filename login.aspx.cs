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
    public partial class index : System.Web.UI.Page
    {
        hdk_ControlAcceso Control;

        protected void Page_Load(object sender, EventArgs e)
        {
            Control = new hdk_ControlAcceso();
           // Control.DB.tblareas.SingleOrDefault(a => a.idArea == 1);
        }

        protected void entrar_Click(object sender, EventArgs e)
        {    
            int usuario = Control.encontrarUsuario(txtUsuario.Text, txtPassword.Text);
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
                ScriptManager.RegisterStartupScript(this.Update, this.GetType(), "UsuarioIncorrecto", "alertify.alert('Error', 'Usuario o contraseña inválidos', 'onok');", true);
                txtUsuario.Text = "";
                txtPassword.Text = "";
            }
        }

    }
}