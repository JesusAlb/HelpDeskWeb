
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
    public class accionesDepto
    {

       public static IList<vt_departamentos> obtenerDataSource(string filtro, string coordinacion)
        {
            try
            {
                return dbhelp.modelo.vt_departamentos.Where(x => x.nomDepto.Contains(filtro) && x.nomCoordinacion.Contains(coordinacion)).OrderBy(a=>a.nomDepto).ToList();
            }
            catch
            {                
                return null;
            }
            
        }

       public static bool borrar(int id)
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

       public static bool insertar(string nombre, int idCoordinacion)
        {
            try
            {
                var nuevoDepto = new tbldepartamento { nomDepto = nombre, coordinacion = idCoordinacion };
                if (nuevoDepto != null)
                {
                    dbhelp.modelo.tbldepartamentos.Add(nuevoDepto);
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

       public static bool modificar(int id, string nombre, int idCoordinacion)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbldepartamentos.SingleOrDefault(x => x.idDepto == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomDepto = nombre;
                    ItemAmodificar.coordinacion = idCoordinacion;
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

       public static IList<tbldepartamento> obtenerDataSourceComboBox(int idCoordinacion)
        {
            try
            {
                if (idCoordinacion != -1)
                {
                    return dbhelp.modelo.tbldepartamentos.Where(a => a.coordinacion == idCoordinacion).OrderBy(a=>a.nomDepto).ToList();
                }
                else
                {
                    return dbhelp.modelo.tbldepartamentos.OrderBy(a => a.nomDepto).ToList();
                }
            } catch{
                return null;
            }
            
            
        }  
    }
}
