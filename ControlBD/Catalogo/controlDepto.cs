
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
    public class controlDepto
    {

       public static IList<vt_departamentos> obtenerDataSource(string filtro, string coordinacion)
        {
            try
            {
                return dbhelp.modelo.vt_departamentos.Where(x => x.nombre.Contains(filtro) && x.nom_coordinacion.Contains(coordinacion)).OrderBy(a=>a.nombre).ToList();
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
                var ItemARemover = dbhelp.modelo.tbldepartamento.SingleOrDefault(x => x.id == id);
                if (ItemARemover != null)
                {
                    dbhelp.modelo.tbldepartamento.Remove(ItemARemover);
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
                var nuevoDepto = new tbldepartamento { nombre = nombre, fk_idcoordinacion = idCoordinacion };
                if (nuevoDepto != null)
                {
                    dbhelp.modelo.tbldepartamento.Add(nuevoDepto);
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
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }

        }

       public static bool modificar(int id, string nombre, int idCoordinacion)
        {
            try
            {
                var ItemAmodificar = dbhelp.modelo.tbldepartamento.SingleOrDefault(x => x.id == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nombre = nombre;
                    ItemAmodificar.fk_idcoordinacion = idCoordinacion;
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
                dbhelp.UndoAll(dbhelp.modelo);
                return false;
            }
        }

       public static tbldepartamento obtenerDepto(int id)
        {
            try
            {
                return dbhelp.modelo.tbldepartamento.SingleOrDefault(x => x.id == id);

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
                    return dbhelp.modelo.tbldepartamento.Where(a => a.fk_idcoordinacion == idCoordinacion).OrderBy(a=>a.nombre).ToList();
                }
                else
                {
                    return dbhelp.modelo.tbldepartamento.OrderBy(a => a.nombre).ToList();
                }
            } catch{
                return null;
            }
            
            
        }  
    }
}
