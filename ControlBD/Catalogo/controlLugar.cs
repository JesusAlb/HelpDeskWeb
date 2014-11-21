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
    class controlLugar
    {

        public static IList<tbllugar> obtenerDataSource(string filtro)
        {
            try
            {
                return dbhelp.modelo.tbllugar.Where(a => a.nombre.Contains(filtro)).OrderBy(a => a.nombre).ToList();
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
                tbllugar Lugar = new tbllugar { nombre = nombre };
                if (Lugar != null)
                {
                    dbhelp.modelo.tbllugar.Attach(Lugar);
                    dbhelp.modelo.tbllugar.Add(Lugar);
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

                var ItemAmodificar = dbhelp.modelo.tbllugar.SingleOrDefault(x => x.id == id);
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

        public static tbllugar obtenerLugar(int id)
        {
            try
            {
                return dbhelp.modelo.tbllugar.SingleOrDefault(a => a.id == id);
            }
            catch
            {
                return null;
            }
        }
    }
}
