
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
    class controlMarca
    {

        public static IList<tblmarca> obtenerDataSource(string filtro)
        {
            try
            {
                return dbhelp.modelo.tblmarca.Where(a => a.nombre.Contains(filtro) && !a.nombre.Equals("N/A")).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static int obtenerMarcaNoAplica()
        {
            try
            {
                return dbhelp.modelo.tblmarca.Where(a => a.nombre.Equals("N/A")).SingleOrDefault().id;
            }
            catch
            {
                return -1;
            }
        }

        public static IList<tblmarca> obtenerDataSourceComboBox(int tipo)
        {
            try
            {
                if (tipo == 0)
                {
                    return dbhelp.modelo.tblmarca.ToList();
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

        public static bool insertar(string nombre)
        {
            try
            {
                var marcaAñadida = new tblmarca { nombre = nombre };
                if (marcaAñadida!= null)
                {
                    dbhelp.modelo.tblmarca.Attach(marcaAñadida);
                    dbhelp.modelo.tblmarca.Add(marcaAñadida);
                    dbhelp.modelo.SaveChanges();                  
                }
                return true;
            }
            catch
            {
                dbhelp.modelo.Dispose();
                return false;
            }
        }

        public static bool modificar(int id, string nombre)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblmarca.SingleOrDefault(x => x.id == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nombre = nombre;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                dbhelp.modelo.Dispose();
                return false;
            }
        }

        public static tblmarca obtenerMarca(int id)
        {
            try
            {
                return dbhelp.modelo.tblmarca.SingleOrDefault(a => a.id == id);

            }catch
            {
                return null;
            }
        }

    }
}
