
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
        public static int obtener_idUsuario_sinAsignar(){
            try
            {
                return dbhelp.modelo.tblusuario.Where(a => a.nombre_usuario.Equals("S/A")).SingleOrDefault().id;
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
                return dbhelp.modelo.tblusuario.Where(a => a.id == id).SingleOrDefault();
            }
            catch 
            {
                return null;
            }
        }

        public static bool verificar_usuario_en_uso(string nombreNuevo, string nombreAnterior)
        {
            if (!nombreNuevo.Equals(nombreAnterior))
            {
                var item = dbhelp.modelo.vt_usuarios.Where(x => x.nombre_usuario == nombreNuevo).SingleOrDefault();

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
                    return dbhelp.modelo.vt_usuarios.Where(a => a.tipo == 0).ToList();
                }
                else if (tipo == 1)
                {
                    return dbhelp.modelo.vt_usuarios.Where(a => a.tipo == 1 && !a.nombre_usuario.Equals("S/A")).ToList();
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
                var query = dbhelp.modelo.vt_usuarios.Where(a => ((a.nom_completo.Contains(filtro) || a.nombre_usuario.Contains(filtro) ||
                                                               a.nom_coordinacion.Contains(filtro) || a.nom_depto.Contains(filtro) ||
                                                               a.nom_puesto.Contains(filtro) || a.nom_area.Contains(filtro) || a.nom_institucion.Contains(filtro)
                                                               || a.tipo_usuario_string.Contains(filtro) || a.correo.Contains(filtro)) && !a.nombre_usuario.Equals("S/A")));
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
                var itemRemover = dbhelp.modelo.tblusuario.Single(x => x.id == id);
                if (itemRemover != null)
                {
                    dbhelp.modelo.tblusuario.Remove(itemRemover);
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
            if (!verificar_usuario_en_uso(usuarioNuevo, nombreAnterior))
            {
                try
                {
                    var ItemAmodificar = dbhelp.modelo.tblusuario.SingleOrDefault(x => x.id == id);
                    if (ItemAmodificar != null)
                    {
                        ItemAmodificar.nombre_usuario = usuarioNuevo;
                        ItemAmodificar.nombre = nombre;
                        ItemAmodificar.apellidos = apellido;
                        ItemAmodificar.password = password;
                        ItemAmodificar.tipo = tipo;
                        ItemAmodificar.extension_telefonica = extel;
                        ItemAmodificar.correo = email;
                        ItemAmodificar.fk_iddepto = depto;
                        ItemAmodificar.fk_idarea = area;
                        ItemAmodificar.fk_idpuesto = puesto;
                        ItemAmodificar.fk_idinstitucion = institucion;
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
                    dbhelp.UndoAll(dbhelp.modelo);
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
            if (!verificar_usuario_en_uso(usuarioNuevo, usuarioViejo))
            {
                try
                {
                    var user = new tblusuario
                    {
                        nombre_usuario = usuarioNuevo,
                        nombre = nombre,
                        apellidos = apellido,
                        tipo = tipo,
                        fk_iddepto = depto,
                        extension_telefonica = extel,
                        correo = email,
                        password = password,
                        fk_idarea = area,
                        fk_idpuesto = puesto,
                        fk_idinstitucion = institucion
                    };
                    if (user != null)
                    {
                        dbhelp.modelo.tblusuario.Attach(user);
                        dbhelp.modelo.tblusuario.Add(user);
                        dbhelp.modelo.SaveChanges();
                    }
                    return 1;
                }
                catch
                {
                    dbhelp.UndoAll(dbhelp.modelo);
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
