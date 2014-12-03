using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows;
using System.Globalization;
using System.Threading;
using System.IO;
using HelpDeskWeb.EntityFrameWork;
using System.Web.UI;

namespace HelpDeskWeb.ControlBD.Acceso
{
  public class controlAcceso : System.Web.UI.Page
    {

        public static int encontrarUsuario(String nombre, string password, Page pagina){
            try
            {
                var UsuarioItem = dbhelp.modelo.vt_usuarios.Where(x => x.nombre_usuario == nombre && x.password == password).SingleOrDefault();
                if (UsuarioItem != null)
                {
                    pagina.Session["DatosUsuario"] = UsuarioItem;
                    return UsuarioItem.fk_idtipo;
                }
                else
                {
                    return -1;
                }
            }
            catch 
           {
               return -2;
           }

        }

        public static void actualizarUsuario_de_Session(Page pagina, vt_usuarios usuario)
        {
            try
            {
                pagina.Session["DatosUsuario"] = dbhelp.modelo.vt_usuarios.AsNoTracking().SingleOrDefault(a=>a.id == usuario.id);
            }
            catch
            {

            }
        }
    }
}
