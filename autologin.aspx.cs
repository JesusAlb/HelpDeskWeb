using HelpDeskWeb.ControlBD.Acceso;
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
    public partial class autologin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null && Request.QueryString["peticion"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                string peticion = Request.QueryString["peticion"];
                tblusuario usuario = controlUsuario.obtenerUsuario(id);
                if (usuario != null)
                {
                    if (usuario.fk_idtipo == 0)
                    {
                        if (controlEquipos.obtenerIPorResponsable(usuario.id) == this.GetIP() || this.GetIP() == "::1")
                        {
                            int resultado = controlAcceso.encontrarUsuario(usuario.nombre_usuario, usuario.password, this.Page);
                            if (resultado == 0)
                            {
                                if (peticion.Equals("0"))
                                    Response.Redirect("Solicitudes/Incidentes.aspx");
                                else
                                    Response.Redirect("Solicitudes/Eventos.aspx");
                            }
                        }
                        else
                        {
                            Response.Redirect("index.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect("index.aspx");
                    }
                }
                else
                {
                    Response.Redirect("index.aspx");
                }
            }
            else
            {
                Response.Redirect("index.aspx");
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