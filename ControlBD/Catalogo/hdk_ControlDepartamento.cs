
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
        hdk_ControlAcceso dbHelp;

        public hdk_ControlDepartamento(hdk_ControlAcceso ca)
        {
            dbHelp = ca;
        }


       public IList cargarTabla(string filtro, string cord)
        {
            try
            {
                var query = dbHelp.DB.ViewDepartamentos.Where(x => x.nomDepto.Contains(filtro) && x.nomCoordinacion.Contains(cord));

                return query.ToList();
            }
            catch
            {                
                return null;
            }
            
        }

       public bool borrarRegistro(int id)
        {
            try
            {
                var ItemARemover = dbHelp.DB.tbldepartamentos.SingleOrDefault(x => x.idDepto == id);
                if (ItemARemover != null)
                {
                    dbHelp.DB.tbldepartamentos.Remove(ItemARemover);
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
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

       public bool insertar(string nombre, int idCord)
        {
            try
            {
                var cord = new tbldepartamento { nomDepto = nombre, coordinacion = idCord };
                if (cord != null)
                {
                    dbHelp.DB.tbldepartamentos.Attach(cord);
                    dbHelp.DB.tbldepartamentos.Add(cord);
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
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

       public bool modificar(int id, string nombre, int cord)
        {
            try
            {
                var ItemAmodificar = dbHelp.DB.tbldepartamentos.SingleOrDefault(x => x.idDepto == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomDepto = nombre;
                    ItemAmodificar.coordinacion = cord;
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
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

       public IList cargarComboCord(bool filtro)
        {
            try
            {
                var items = dbHelp.DB.tblcoordinacions.OrderBy(a => a.idCoordinacion).ToList();
                if (filtro)
                {
                    items.Insert(0, new tblcoordinacion { idCoordinacion = 0, nomCoordinacion = "" });  
                }
                return items;
            }catch{
                return null;
            }
        }

        public tbldepartamento obtenerDepto(int id)
        {
            try
            {
                return dbHelp.DB.tbldepartamentos.SingleOrDefault(x => x.idDepto == id);

            }
            catch
            {               
                return null;
            }

        }

        public IList cargarComboDep(int cord)
        {
            try
            {
                if (cord != -1)
                {
                    return dbHelp.DB.tbldepartamentos.Where(a => a.coordinacion == cord).ToList();
                }
                else
                {
                    return dbHelp.DB.tbldepartamentos.ToList();
                }
            } catch{
                return null;
            }
            
            
        }  
    }
}
