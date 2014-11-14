
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Windows;


namespace HelpDeskWeb.ControlBD.Catalogo
{
    class controlUsuario
    {  
        public static int obtener_IdUsuario_sin_asignar(){
            try
            {
                return dbhelp.modelo.tblusuarios.Where(a => a.username.Equals("S/A")).SingleOrDefault().idUsuario;
            }
            catch
            {
                return 0;
            }
        }

        public static tblusuario obtenerUsuario(int id)
        {
            try
            {
                return dbhelp.modelo.tblusuarios.Where(a => a.idUsuario == id).SingleOrDefault();
            }
            catch 
            {
                return null;
            }
        }

        public static bool verificar_si_existe_Usuario(string nombreNuevo, string nombreAnterior)
        {
            if (!nombreNuevo.Equals(nombreAnterior))
            {
                var item = dbhelp.modelo.vt_usuarios.Where(x => x.username == nombreNuevo).SingleOrDefault();

                if (item != null)
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
                return false;
            }
        }

        public static IList<vt_usuarios> dataSourceComboBox(int tipo)
        {
            try{
                if (tipo == 0)
                {
                    return dbhelp.modelo.vt_usuarios.Where(a => a.tipoUsuario == 0).ToList();
                }
                else if (tipo == 1)
                {
                    return dbhelp.modelo.vt_usuarios.Where(a => a.tipoUsuario == 1 && !a.username.Equals("S/A")).ToList();
                }
                else 
                {
                    return obtenerDataSource("");
                }

            }
            catch
            {
                return null;
            }
        }

        public static IList<vt_usuarios> obtenerDataSource(string filtro)
        {
            try
            {
                var query = dbhelp.modelo.vt_usuarios.Where(a => ((a.nomCompleto.Contains(filtro) || a.username.Contains(filtro) ||
                                                               a.nomCoordinacion.Contains(filtro) || a.nomDepto.Contains(filtro) ||
                                                               a.nomPuesto.Contains(filtro) || a.nomArea.Contains(filtro) || a.nomInstitucion.Contains(filtro)
                                                               || a.tipoUsuarioString.Contains(filtro) || a.correo.Contains(filtro)) && !a.username.Equals("S/A")));
                return query.ToList();
            }
            catch
            {
                return null;
            }
        }

        public static bool borrar(int id)
        {
            try
            {
                var itemRemover = dbhelp.modelo.tblusuarios.Single(x => x.idUsuario == id);
                if (itemRemover != null)
                {
                    dbhelp.modelo.tblusuarios.Remove(itemRemover);
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static int modificar(int id, string usuarioNuevo, string nombreAnterior, string nombre, string apellido, int tipo, int depto, string extel, string email, string password, int area, int puesto, int institucion)
        {
            if (!verificar_si_existe_Usuario(usuarioNuevo, nombreAnterior))
            {
                try
                {
                    var ItemAmodificar = dbhelp.modelo.tblusuarios.SingleOrDefault(x => x.idUsuario == id);
                    if (ItemAmodificar != null)
                    {
                        ItemAmodificar.username = usuarioNuevo;
                        ItemAmodificar.nombre = nombre;
                        ItemAmodificar.apellidos = apellido;
                        ItemAmodificar.password = password;
                        ItemAmodificar.tipoUsuario = tipo;
                        ItemAmodificar.exTel = extel;
                        ItemAmodificar.correo = email;
                        ItemAmodificar.depto = depto;
                        ItemAmodificar.area = area;
                        ItemAmodificar.puesto = puesto;
                        ItemAmodificar.institucion = institucion;
                        dbhelp.modelo.SaveChanges();
                        return 1;
                    }
                    else
                    {
                        return 0;
                    }
                }
                catch
                {
                    return 0;
                }
            }
            else
            {
                return -1;
            }
          }

        public static int insertar(string usuarioNuevo, string usuarioViejo, string nombre, string apellido, int tipo, int depto, string extel, string email, string password, int area, int puesto, int institucion)
        {
            if (!verificar_si_existe_Usuario(usuarioNuevo, usuarioViejo))
            {
                try
                {
                    var user = new tblusuario
                    {
                        username = usuarioNuevo,
                        nombre = nombre,
                        apellidos = apellido,
                        tipoUsuario = tipo,
                        depto = depto,
                        exTel = extel,
                        correo = email,
                        password = password,
                        area = area,
                        puesto = puesto,
                        institucion = institucion
                    };
                    if (user != null)
                    {
                        dbhelp.modelo.tblusuarios.Attach(user);
                        dbhelp.modelo.tblusuarios.Add(user);
                        dbhelp.modelo.SaveChanges();
                    }
                    return 1;
                }
                catch
                {
                    return 0;
                }
            }
            else
            {
                return -1;
            }

        }

        public static vt_usuarios obtenerUsuarioDeSession(Page pagina)
        {
            try{
                return (vt_usuarios)(pagina.Session["DatosUsuario"]);
            }catch{
                return null;
            }
        }
    }
}
