
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

        public static IList<tblmarca> obtenerDataSource(string marca)
        {
            try
            {
                return dbhelp.modelo.tblmarcas.Where(a => a.nomMarca.Contains(marca) && !a.nomMarca.Equals("N/A")).ToList();
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
                return dbhelp.modelo.tblmarcas.Where(a => a.nomMarca.Equals("N/A")).SingleOrDefault().idMarca;
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
                    return dbhelp.modelo.tblmarcas.ToList();
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

        public static bool insertar(string marca)
        {
            try
            {
                var marcaAñadida = new tblmarca { nomMarca = marca };
                if (marcaAñadida!= null)
                {
                    dbhelp.modelo.tblmarcas.Attach(marcaAñadida);
                    dbhelp.modelo.tblmarcas.Add(marcaAñadida);
                    dbhelp.modelo.SaveChanges();                  
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool modificar(int idMarca, string nomMarca)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblmarcas.SingleOrDefault(x => x.idMarca == idMarca);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomMarca = nomMarca;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static tblmarca obtenerMarca(int id)
        {
            try
            {
                return dbhelp.modelo.tblmarcas.SingleOrDefault(a => a.idMarca == id);

            }catch
            {
                return null;
            }
        }

    }
}
