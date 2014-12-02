
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

        public static IList<vt_reporte_equipos> obtenerDataSource(string filtro)
        {
            try
            {
               return dbhelp.modelo.vt_reporte_equipos.Where(a => a.nom_completo.Contains(filtro) || a.nom_marca_equipo.Contains(filtro) ||
                                                a.nom_marca_monitor.Contains(filtro) || a.nom_marca_mouse.Contains(filtro) ||
                                                a.nom_marca_teclado.Contains(filtro) || a.nom_tipo_equipo.Contains(filtro) ||
                                                a.procesador.Contains(filtro) || a.serie_equipo.Contains(filtro) ||
                                                a.serie_monitor.Contains(filtro) || a.serie_mouse.Contains(filtro) ||
                                                a.serie_teclado.Contains(filtro) || a.memoria_ram.Contains(filtro) ||
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
                var equipo = new tblequipoasignado
                {
                    disco_duro = discoDuro,
                    ip = direccionIp,
                    mac = direccionMac,
                    fk_idmarca_equipo = idMarcaEquipo,
                    fk_idmarca_monitor = marcaMonitor,
                    fk_idmarca_mouse = marcaMouse, 
                    fk_idmarca_teclado = marcaTeclado,
                    ram = ram, procesador = procesador, 
                    fk_idusuario_responsable = idResponsable, 
                    serie_equipo = serieEquipo,
                    serie_monitor = serieMonitor, 
                    serie_mouse = serieMouse,  
                    serie_teclado =serieTeclado, 
                    fk_tipoequipo = idTipoEquipo };
                if (equipo != null)
                {
                    dbhelp.modelo.tblequipoasignado.Attach(equipo);
                    dbhelp.modelo.tblequipoasignado.Add(equipo);
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

        public static bool modificar(int idEquipoAsignado, int idResponsable, string discoDuro, string direccionIp, string direccionMac, int idMarcaEquipo, int marcaMonitor, int marcaMouse, int marcaTeclado, string ram, string procesador, string serieEquipo, string serieMonitor, string serieMouse, string serieTeclado, int idTipoEquipo)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tblequipoasignado.SingleOrDefault(x => x.id == idEquipoAsignado);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.disco_duro = discoDuro;
                    ItemAmodificar.ip = direccionIp;
                    ItemAmodificar.mac = direccionMac;
                    ItemAmodificar.fk_idmarca_equipo = idMarcaEquipo;
                    ItemAmodificar.fk_idmarca_monitor = marcaMonitor;
                    ItemAmodificar.fk_idmarca_mouse = marcaMouse;
                    ItemAmodificar.fk_idmarca_teclado = marcaTeclado;
                    ItemAmodificar.ram = ram;
                    ItemAmodificar.procesador = procesador;
                    ItemAmodificar.fk_idusuario_responsable = idResponsable;
                    ItemAmodificar.serie_equipo = serieEquipo;
                    ItemAmodificar.serie_monitor = serieMonitor;
                    ItemAmodificar.serie_mouse = serieMouse;
                    ItemAmodificar.serie_teclado = serieTeclado;
                    ItemAmodificar.fk_tipoequipo = idTipoEquipo;
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

        public static tblequipoasignado obtenerEquipo(int id)
        {
            try
            {
                return dbhelp.modelo.tblequipoasignado.SingleOrDefault(a => a.id == id);
            }
            catch
            {
                return null;
            }
        }

        public static string obtenerIPorResponsable(int idusuario)
        {
            try
            {
                var equipo = dbhelp.modelo.tblequipoasignado.SingleOrDefault(a => a.fk_idusuario_responsable == idusuario).ip;
                if (equipo != null)
                {
                    return equipo;
                }
                else 
                {
                    return null;
                }
            }
            catch
            {
                return null;
            }
        }
    }
}
