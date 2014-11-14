
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
    class controlPuesto
    {

        public static IList<tblpuesto> obtenerDataSource(string filtro)
        {
            try
            {
                return dbhelp.modelo.tblpuestoes.Where(a => a.nomPuesto.Contains(filtro)).OrderBy(a=>a.nomPuesto).ToList();
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
                var puesto = new tblpuesto { nomPuesto = nombre };
                if (puesto != null)
                {
                    dbhelp.modelo.tblpuestoes.Attach(puesto);
                    dbhelp.modelo.tblpuestoes.Add(puesto);
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool modificar(int id, string nombre)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblpuestoes.SingleOrDefault(x => x.idPuesto == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomPuesto = nombre;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static tblpuesto obtenerPuesto(int id)
        {
            try
            {
                return dbhelp.modelo.tblpuestoes.SingleOrDefault(a => a.idPuesto == id);
            }
            catch
            {
                return null;
            }
        }
    }
}
