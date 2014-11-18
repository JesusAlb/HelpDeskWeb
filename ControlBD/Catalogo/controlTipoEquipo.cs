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
    class controlTipoEquipo
    {

        public static IList<tbltipoequipo> obtenerDataSource(string filtro)
        {
            try
            {
                return dbhelp.modelo.tbltipoequipo.Where(a => a.nombre.Contains(filtro)).OrderBy(a=>a.nombre).ToList();
            }
            catch
            {             
                return null;
            }          
        }

        public static bool insertar(string nombre, bool cpu, bool dd, bool red, bool monitor, bool mouse, bool teclado, bool ram, bool procesador)
        {
            try
            {
                var tipoEquipos = new tbltipoequipo { nombre = nombre, equipo = cpu, disco_duro = dd, red = red, monitor = monitor, mouse = mouse, teclado = teclado, ram = ram, procesador = procesador };
                if (tipoEquipos != null)
                {
                    dbhelp.modelo.tbltipoequipo.Attach(tipoEquipos);
                    dbhelp.modelo.tbltipoequipo.Add(tipoEquipos);
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch 
            {
                return false;
            }
        }

        public static bool modificar(int idTipoEq, string nombre, bool cpu, bool dd, bool red, bool monitor, bool mouse, bool teclado, bool ram, bool procesador)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbltipoequipo.SingleOrDefault(x => x.id == idTipoEq);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nombre = nombre;
                    ItemAmodificar.equipo = cpu;
                    ItemAmodificar.disco_duro = dd;
                    ItemAmodificar.monitor = monitor;
                    ItemAmodificar.mouse = mouse;
                    ItemAmodificar.teclado = teclado;
                    ItemAmodificar.red = red;
                    ItemAmodificar.ram = ram;
                    ItemAmodificar.procesador = procesador;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static tbltipoequipo obtenerEquipo(int index)
        {
            try
            {
                return dbhelp.modelo.tbltipoequipo.SingleOrDefault(a => a.id == index);
            }
            catch
            {
                return null;
            }
        }
    }
}
