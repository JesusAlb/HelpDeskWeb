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
    class hdk_ControlTipoEquipo
    {

        public static IList cargarTabla(string filtro)
        {
            try
            {
                return dbhelp.modelo.tbltipoequipoes.Where(a => a.nomTipoEquipo.Contains(filtro)).ToList();
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
                var tipoEquipos = new tbltipoequipo { nomTipoEquipo = nombre, siEquipo = cpu, siDiscoDuro = dd, siRed = red, siMonitor = monitor, siMouse = mouse, siTeclado = teclado, siRAM = ram, siProcesador = procesador };
                if (tipoEquipos != null)
                {
                    dbhelp.modelo.tbltipoequipoes.Attach(tipoEquipos);
                    dbhelp.modelo.tbltipoequipoes.Add(tipoEquipos);
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
                var ItemAmodificar = dbhelp.modelo.tbltipoequipoes.SingleOrDefault(x => x.idTipoEquipo == idTipoEq);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomTipoEquipo = nombre;
                    ItemAmodificar.siEquipo = cpu;
                    ItemAmodificar.siDiscoDuro = dd;
                    ItemAmodificar.siMonitor = monitor;
                    ItemAmodificar.siMouse = mouse;
                    ItemAmodificar.siTeclado = teclado;
                    ItemAmodificar.siRed = red;
                    ItemAmodificar.siRAM = ram;
                    ItemAmodificar.siProcesador = procesador;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static IList cargarCombo(int tipo)
        {
            try
            {
                return dbhelp.modelo.tbltipoequipoes.ToList();
            }
            catch
            {
                return null;
            }
        }

        public static tbltipoequipo obtenerEquipo(int index)
        {
            try
            {
                return dbhelp.modelo.tbltipoequipoes.SingleOrDefault(a => a.idTipoEquipo == index);
            }
            catch
            {
                return null;
            }
        }
    }
}
