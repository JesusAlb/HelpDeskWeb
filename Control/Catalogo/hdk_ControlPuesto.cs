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
    class hdk_ControlPuesto
    {
        hdk_ControlAcceso dbHelp;

        public hdk_ControlPuesto(hdk_ControlAcceso ca)
        {
            dbHelp = ca;
        }

        public IList cargarTabla(string filtro)
        {
            try
            {
                return dbHelp.DB.tblpuestoes.Where(a => a.nomPuesto.Contains(filtro)).ToList();
            }
            catch
            {
                return null;
            }
        }

        public IList cargarCombo()
        {
            try
            {
                return dbHelp.DB.tblpuestoes.OrderBy(a => a.idPuesto).ToList();
            }
            catch
            {
                return null;
            }
        }

        public bool insertar(string nombre)
        {
            try
            {
                var puesto = new tblpuesto { nomPuesto = nombre };
                if (puesto != null)
                {
                    dbHelp.DB.tblpuestoes.Attach(puesto);
                    dbHelp.DB.tblpuestoes.Add(puesto);
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

        public bool modificar(int id, string nombre)
        {
            try
            {
                var ItemAmodificar = dbHelp.DB.tblpuestoes.SingleOrDefault(x => x.idPuesto == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomPuesto = nombre;
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
