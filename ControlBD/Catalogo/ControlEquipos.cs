
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
    class controlEquipos
    {

        public static IList<vt_reporte_equipos> dataSource(string filtro)
        {
            try
            {
               return dbhelp.modelo.vt_reporte_equipos.Where(a => a.nomCompleto.Contains(filtro) || a.nomMarcaEquipo.Contains(filtro) ||
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

        public static bool insertar(int idResponsable, string discoDuro, string direccionIp, string direccionMac, int idMarcaEquipo, int marcaMonitor, int marcaMouse, int marcaTeclado, string ram, string procesador, string serieEquipo, string serieMonitor, string serieMouse, string serieTeclado, int idTipoEquipo)
        {
            try
            {
                var equipo = new tblresponsablequipo { discoDuro = discoDuro, ip = direccionIp, mac = direccionMac, marcaEquipo = idMarcaEquipo, marcaMonitor = marcaMonitor,
                                                        marcaMouse = marcaMouse, marcaTeclado = marcaTeclado,
                                                        memoriaRam = ram, procesador = procesador, responsable = idResponsable, serieEquipo = serieEquipo,
                                                        serieMonitor = serieMonitor, serieMouse = serieMouse,  
                                                        serieTeclado =serieTeclado, tipoEquipo = idTipoEquipo };
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

        public static bool modificar(int idEquipoAsignado, int idResponsable, string discoDuro, string direccionIp, string direccionMac, int idMarcaEquipo, int marcaMonitor, int marcaMouse, int marcaTeclado, string ram, string procesador, string serieEquipo, string serieMonitor, string serieMouse, string serieTeclado, int idTipoEquipo)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblresponsablequipoes.SingleOrDefault(x => x.idResponEq == idEquipoAsignado);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.discoDuro = discoDuro;
                    ItemAmodificar.ip = direccionIp;
                    ItemAmodificar.mac = direccionMac;
                    ItemAmodificar.marcaEquipo = idMarcaEquipo;
                    ItemAmodificar.marcaMonitor = marcaMonitor;
                    ItemAmodificar.marcaMouse = marcaMouse;
                    ItemAmodificar.marcaTeclado = marcaTeclado;
                    ItemAmodificar.memoriaRam = ram;
                    ItemAmodificar.procesador = procesador;
                    ItemAmodificar.responsable = idResponsable;
                    ItemAmodificar.serieEquipo = serieEquipo;
                    ItemAmodificar.serieMonitor = serieMonitor;
                    ItemAmodificar.serieMouse = serieMouse;
                    ItemAmodificar.serieTeclado = serieTeclado;
                    ItemAmodificar.tipoEquipo = idTipoEquipo;
                    dbhelp.modelo.SaveChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static tblresponsablequipo obtenerRegistro(int id)
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
