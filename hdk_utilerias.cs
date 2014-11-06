using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelpDeskWeb
{
    public class hdk_utilerias : System.Web.UI.Page
    {
        public static void setRowCreated(object sender, GridViewRowEventArgs e, Page pagina)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='none';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.Attributes["onclick"] = pagina.ClientScript.GetPostBackClientHyperlink((sender as GridView), "Select$" + e.Row.RowIndex);
            }
        }

        public static void limpiarControles(ControlCollection controles)
        {
            foreach (Control control in controles)
            {
                if (control is TextBox)
                {
                    (control as TextBox).Text = "";
                }
                else if (control is DropDownList)
                {
                    (control as DropDownList).SelectedIndex = -1;
                }

                limpiarControles(control.Controls);
            }
        }

        public static bool verificarCamposVacios(string[] controles)
        {
            foreach (string texto in controles)
            {
                    if (String.IsNullOrWhiteSpace(texto))
                    {
                        return false;
                    }            
             }

            return true;
        }

        public static bool verificarCombosUsuarios(string[] cbusuario)
        {
            foreach (string usuario in cbusuario)
            {
                if (usuario == "Sin asignar")
                {
                    return false;
                }
            }
            return true;
        }



        public static void checarSession(Page pagina, bool despues, int tipoObligatorio, int tipoActual)
        {
                if (despues)
                  {
                      if (pagina.Session["DatosUsuario"] == null)
                      {
                          pagina.Response.Redirect("~/login.aspx");
                      }
                      else
                      {
                          if (tipoActual != 2)
                          {
                              tipoActual = ((ViewUsuario)pagina.Session["DatosUsuario"]).tipoUsuario;
                          }

                          if (tipoObligatorio != tipoActual)
                          {
                              if (tipoActual == 0)
                              {
                                  pagina.Response.Redirect("~/soporte.aspx");
                              }
                              else if(tipoActual == 1)
                              {
                                  pagina.Response.Redirect("~/solicitante.aspx");
                              }
                          }
                      }
                  }
                  else
                  {
                     if (pagina.Session["DatosUsuario"] != null)
                      {
                          pagina.Response.Redirect("~/soporte.aspx");
                      }              
                  }
        }
    }

}