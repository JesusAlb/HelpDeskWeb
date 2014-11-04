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
    class hdk_ControlEquipos
    {

        public static IList cargarTabla(string filtro)
        {
            try
            {
               return dbhelp.modelo.VistaEquipoReportes.Where(a => a.nomCompleto.Contains(filtro) || a.nomMarcaEquipo.Contains(filtro) ||
                                                a.nomMarcaMonitor.Contains(filtro) || a.nomMarcaMouse.Contains(filtro) ||
                                                a.nomMarcaTeclado.Contains(filtro) || a.nomTipoEquipo.Contains(filtro) ||
                                                a.procesador.Contains(filtro) || a.serieEquipo.Contains(filtro) ||
                                                a.serieMonitor.Contains(filtro) || a.serieMouse.Contains(filtro) ||
                                                a.serieTeclado.Contains(filtro) || a.memoriaRam.Contains(filtro) ||
                                                a.ip.Contains(filtro) || a.mac.Contains(filtro)).ToList();
            }
            catch
            {
                return null;
            }
        }

        public static bool insertar(int res, string dd, string Ip, string Mac, int mEquipo, int mMonitor, int mMouse, int mTeclado, string ram, string proces, string sEquipo, string sMonitor, string sMouse, string sTeclado, int tEquipo)
        {
            try
            {
                var equipo = new tblresponsablequipo { discoDuro = dd, ip = Ip, mac = Mac, marcaEquipo = mEquipo, marcaMonitor = mMonitor,
                                                        marcaMouse = mMouse, marcaTeclado = mTeclado,
                                                        memoriaRam = ram, procesador = proces, responsable = res, serieEquipo = sEquipo,
                                                        serieMonitor = sMonitor, serieMouse = sMouse,  
                                                        serieTeclado =sTeclado, tipoEquipo = tEquipo };
                if (equipo != null)
                {
                    dbhelp.modelo.tblresponsablequipoes.Attach(equipo);
                    dbhelp.modelo.tblresponsablequipoes.Add(equipo);
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch 
            {
                return false;
            }
        }

        public static bool modificar(int equipo, int res, string dd, string Ip, string Mac, int mEquipo, int mMonitor, int mMouse, int mTeclado, string ram, string proces, string sEquipo, string sMonitor, string sMouse, string sTeclado, int tEquipo)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblresponsablequipoes.SingleOrDefault(x => x.idResponEq == equipo);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.discoDuro = dd;
                    ItemAmodificar.ip = Ip;
                    ItemAmodificar.mac = Mac;
                    ItemAmodificar.marcaEquipo = mEquipo;
                    ItemAmodificar.marcaMonitor = mMonitor;
                    ItemAmodificar.marcaMouse = mMouse;
                    ItemAmodificar.marcaTeclado = mTeclado;
                    ItemAmodificar.memoriaRam = ram;
                    ItemAmodificar.procesador = proces;
                    ItemAmodificar.responsable = res;
                    ItemAmodificar.serieEquipo = sEquipo;
                    ItemAmodificar.serieMonitor = sMonitor;
                    ItemAmodificar.serieMouse = sMouse;
                    ItemAmodificar.serieTeclado = sTeclado;
                    ItemAmodificar.tipoEquipo = tEquipo;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static tblresponsablequipo obtenerEquipo(int id)
        {
            try
            {
                return dbhelp.modelo.tblresponsablequipoes.SingleOrDefault(a => a.idResponEq == id);
            }
            catch
            {
                return null;
            }
        }
    }
}
