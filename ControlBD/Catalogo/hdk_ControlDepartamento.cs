
using HelpDeskWeb.ControlBD.Acceso;
using HelpDeskWeb.EntityFrameWork;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace HelpDeskWeb.ControlAltas
{
    public class hdk_ControlDepartamento
    {

        public hdk_ControlDepartamento(hdk_ControlAcceso ca)
        {
        }


       public static IList cargarTabla(string filtro, string cord)
        {
            try
            {
                var query = dbhelp.modelo.ViewDepartamentos.Where(x => x.nomDepto.Contains(filtro) && x.nomCoordinacion.Contains(cord));

                return query.ToList();
            }
            catch
            {                
                return null;
            }
            
        }

       public static bool borrarRegistro(int id)
        {
            try
            {
                var ItemARemover = dbhelp.modelo.tbldepartamentos.SingleOrDefault(x => x.idDepto == id);
                if (ItemARemover != null)
                {
                    dbhelp.modelo.tbldepartamentos.Remove(ItemARemover);
                    dbhelp.modelo.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch 
            {                
                return false;
            }

        }

       public static bool insertar(string nombre, int idCord)
        {
            try
            {
                var cord = new tbldepartamento { nomDepto = nombre, coordinacion = idCord };
                if (cord != null)
                {
                    dbhelp.modelo.tbldepartamentos.Attach(cord);
                    dbhelp.modelo.tbldepartamentos.Add(cord);
                    dbhelp.modelo.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }
                
            }
            catch 
            {               
                return false;
            }

        }

       public static bool modificar(int id, string nombre, int cord)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbldepartamentos.SingleOrDefault(x => x.idDepto == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomDepto = nombre;
                    ItemAmodificar.coordinacion = cord;
                    dbhelp.modelo.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch 
            {
                return false;
            }
        }

       public static IList cargarComboCord(bool filtro)
        {
            try
            {
                var items = dbhelp.modelo.tblcoordinacions.OrderBy(a => a.idCoordinacion).ToList();
                if (filtro)
                {
                    items.Insert(0, new tblcoordinacion { idCoordinacion = 0, nomCoordinacion = "" });  
                }
                return items;
            }catch{
                return null;
            }
        }

       public static tbldepartamento obtenerDepto(int id)
        {
            try
            {
                return dbhelp.modelo.tbldepartamentos.SingleOrDefault(x => x.idDepto == id);

            }
            catch
            {               
                return null;
            }

        }

       public static IList cargarComboDep(int cord)
        {
            try
            {
                if (cord != -1)
                {
                    return dbhelp.modelo.tbldepartamentos.Where(a => a.coordinacion == cord).ToList();
                }
                else
                {
                    return dbhelp.modelo.tbldepartamentos.ToList();
                }
            } catch{
                return null;
            }
            
            
        }  
    }
}
