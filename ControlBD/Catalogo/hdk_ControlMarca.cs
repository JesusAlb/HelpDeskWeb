
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
    class hdk_ControlMarca
    {
        hdk_ControlAcceso dbHelp;

        public static IList cargarTabla(string ma)
        {
            try
            {
                return dbhelp.modelo.tblmarcas.Where(a => a.nomMarca.Contains(ma) && !a.nomMarca.Equals("N/A")).ToList();
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

        public static IList cargarCombo(int tipo)
        {
            try
            {
                if (tipo == 0)
                {
                    return dbhelp.modelo.tblmarcas.ToList();
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

        public static bool insertar(string ma)
        {
            try
            {
                var marca = new tblmarca { nomMarca = ma };
                if (marca!= null)
                {
                    dbhelp.modelo.tblmarcas.Attach(marca);
                    dbhelp.modelo.tblmarcas.Add(marca);
                    dbhelp.modelo.SaveChanges();                  
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool modificar(int idMa, string nomMa)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblmarcas.SingleOrDefault(x => x.idMarca == idMa);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomMarca = nomMa;
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
