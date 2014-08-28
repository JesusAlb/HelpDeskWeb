
using HelpDeskWeb.Control.Acceso;
using HelpDeskWeb.Modelo;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace HelpDeskWeb.Control.Catalogo
{
    class hdk_ControlMarca
    {
        hdk_ControlAcceso dbHelp;

        public hdk_ControlMarca(hdk_ControlAcceso ca)
        {
            dbHelp = ca;
        }

        public IList cargarTabla(string ma)
        {
            try
            {
                return dbHelp.DB.tblmarcas.Where(a => a.nomMarca.Contains(ma) && !a.nomMarca.Equals("N/A")).ToList();
            }
            catch
            {
                return null;
            }
        }

        public int obtenerMarcaNoAplica()
        {
            try
            {
                return dbHelp.DB.tblmarcas.Where(a => a.nomMarca.Equals("N/A")).SingleOrDefault().idMarca;
            }
            catch
            {
                return -1;
            }
        }

        public IList cargarCombo(int tipo)
        {
            try
            {
                if (tipo == 0)
                {
                    return dbHelp.DB.tblmarcas.ToList();
                }
                else
                {
                    return this.cargarTabla("");
                }
            }
            catch
            {
                return null;
            }

        }

        public bool insertar(string ma)
        {
            try
            {
                var marca = new tblmarca { nomMarca = ma };
                if (marca!= null)
                {
                    dbHelp.DB.tblmarcas.Attach(marca);
                    dbHelp.DB.tblmarcas.Add(marca);
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

        public bool modificar(int idMa, string nomMa)
        {
            try
            {
                var ItemAmodificar = dbHelp.DB.tblmarcas.SingleOrDefault(x => x.idMarca == idMa);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomMarca = nomMa;
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
    }
}
