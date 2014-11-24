
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
                return dbhelp.modelo.tblpuesto.Where(a => a.nombre.Contains(filtro)).OrderBy(a => a.nombre).ToList();
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
                var puesto = new tblpuesto { nombre = nombre };
                if (puesto != null)
                {
                    dbhelp.modelo.tblpuesto.Attach(puesto);
                    dbhelp.modelo.tblpuesto.Add(puesto);
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static bool modificar(int id, string nombre)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblpuesto.SingleOrDefault(x => x.id == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nombre = nombre;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

        public static tblpuesto obtenerPuesto(int id)
        {
            try
            {
                return dbhelp.modelo.tblpuesto.SingleOrDefault(a => a.id == id);
            }
            catch
            {
                return null;
            }
        }
    }
}
