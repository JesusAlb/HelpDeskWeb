
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;


namespace HelpDeskWeb.ControlBD.Catalogo
{
    class hdk_ControlUsuario
    {
        private hdk_ControlAcceso dbHelp;
        
        public hdk_ControlUsuario(hdk_ControlAcceso ca)
        {
            dbHelp = ca;
        }

        public int obtenerIdUsuario_SinAsignar(){
            try
            {
                return dbHelp.DB.tblusuarios.Where(a => a.username.Equals("S/A")).SingleOrDefault().idUsuario;
            }
            catch
            {
                return 0;
            }
        }

        public tblusuario obtenerUsuario(int id)
        {
            try
            {
                return dbHelp.DB.tblusuarios.Where(a => a.idUsuario == id).SingleOrDefault();
            }
            catch 
            {
                return null;
            }
        }

        public bool verificarSiExisteUsuario(string nomUsuario)
        {
            var item = dbHelp.DB.tblusuarios.SingleOrDefault(a => a.username.Equals(nomUsuario));
            if (item != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public IList cargarComboUsuarios(int tip)
        {
            try{
                if (tip == 0)
                {
                    return this.dbHelp.DB.ViewUsuarios.Where(a => a.tipoUsuario == 0).ToList();
                }
                else if (tip == 1)
                {
                    return this.dbHelp.DB.ViewUsuarios.Where(a => a.tipoUsuario == 1 && !a.username.Equals("S/A")).ToList();
                }
                else 
                {
                    return cargarTabla("");
                }

            }
            catch
            {
                return null;
            }
        }

        public IList cargarComboInstitucion()
        {
            try
            {
                return dbHelp.DB.tblinstitucions.Where(a => a.status == true).ToList();

            }catch{
                return null;
            }
        }

        public IList cargarTabla(string filtro)
        {
            try
            {
                var query = dbHelp.DB.ViewUsuarios.Where(a => ((a.nomCompleto.Contains(filtro) || a.username.Contains(filtro) ||
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

        public bool borrarRegistro(int id)
        {
            try
            {
                var itemRemover = dbHelp.DB.tblusuarios.Single(x => x.idUsuario == id);
                if (itemRemover != null)
                {
                    dbHelp.DB.tblusuarios.Remove(itemRemover);
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public int modificar(int id, string us, string nom, string ape, int niv, int dep, string ex, string correo, string con, int are, int pues, int inst)
        {
            if (!this.verificarSiExisteUsuario(us))
            {
                try
                {
                    var ItemAmodificar = dbHelp.DB.tblusuarios.SingleOrDefault(x => x.idUsuario == id);
                    if (ItemAmodificar != null)
                    {
                        ItemAmodificar.username = us;
                        ItemAmodificar.nombre = nom;
                        ItemAmodificar.apellidos = ape;
                        ItemAmodificar.password = con;
                        ItemAmodificar.tipoUsuario = niv;
                        ItemAmodificar.exTel = ex;
                        ItemAmodificar.correo = correo;
                        ItemAmodificar.depto = dep;
                        ItemAmodificar.area = are;
                        ItemAmodificar.puesto = pues;
                        ItemAmodificar.institucion = inst;
                        dbHelp.DB.SaveChanges();
                        dbHelp.actualizarModelo();
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

        public int insertar(string us, string nom, string ape, int niv, int dep, string ex, string email, string con, int are, int pues, int inst)
        {
            if (!this.verificarSiExisteUsuario(us))
            {
                try
                {
                    var user = new tblusuario
                    {
                        username = us,
                        nombre = nom,
                        apellidos = ape,
                        tipoUsuario = niv,
                        depto = dep,
                        exTel = ex,
                        correo = email,
                        password = con,
                        area = are,
                        puesto = pues,
                        institucion = inst
                    };
                    if (user != null)
                    {
                        dbHelp.DB.tblusuarios.Attach(user);
                        dbHelp.DB.tblusuarios.Add(user);
                        dbHelp.DB.SaveChanges();
                        dbHelp.actualizarModelo();
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

    }
}
