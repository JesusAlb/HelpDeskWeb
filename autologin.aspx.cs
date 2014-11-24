using HelpDeskWeb.ControlBD.Acceso;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb
{
    public partial class autologin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["usuario"] != null && Request.QueryString["password"] != null)
            {
                string peticion = Request.QueryString["peticion"];
                int resultado = controlAcceso.encontrarUsuario(Request.QueryString["usuario"], Request.QueryString["password"], this.Page);
                if (resultado == 0)
                {
                    if (peticion.Equals("0"))
                        Response.Redirect("Solicitudes/Incidentes.aspx");
                    else
                        Response.Redirect("Solicitudes/Eventos.aspx");
                }
            }
        }

        protected String GetIP()
        {
            string ipString;
            if (string.IsNullOrEmpty(Request.ServerVariables["HTTP_X_FORWARDED_FOR"]))
            {
                ipString = Request.ServerVariables["REMOTE_ADDR"];
            }
            else
            {
                ipString = Request.ServerVariables["HTTP_X_FORWARDED_FOR"].Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries).FirstOrDefault();
            }
            return ipString;
        }

    }
}