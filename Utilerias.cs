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
    public class Utilerias : System.Web.UI.Page
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
                          pagina.Response.Redirect("~/index.aspx");
                      }
                      else
                      {
                          if (tipoActual != 2)
                          {
                              tipoActual = controlUsuario.obtenerUsuarioDeSession(pagina).fk_idtipo;
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

        public static bool validarFechas(TextBox[] textboxs)
        {
            foreach (TextBox txt in textboxs)
            {
                if (convertirFecha(txt.Text) == null)
                {
                    return false;
                }
            }

            return true;
        }

        public static DateTime? convertirFecha(string fecha)
        {
            try
            {
                return Convert.ToDateTime(fecha);
            }
            catch
            {
                return null;
            }
        }

        public static DateTime[] convertirRango(DateTime? inferior, DateTime? superior){
            DateTime[] rango = new DateTime[2];
            if(inferior == null){
                rango[0] = new DateTime(1753, 1, 1);
            }
            else
            {
                rango[0] = inferior.Value;
            }
            if (superior == null)
            {
                rango[1] = new DateTime(DateTime.Today.Year + 3, DateTime.Today.Month, DateTime.Today.Day);
            }
            else
            {
                rango[1] = inferior.Value;
            }
            return rango;
        }

        public static bool fechaReal(string fecha, bool inferior)
        {
            DateTime valorFecha = Convert.ToDateTime(fecha);
            if (inferior)
            {
                if (valorFecha <= DateTime.Now)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                if (valorFecha >= DateTime.Now)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }

}