﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Windows;
using HelpDeskWeb.Modelo;
using HelpDeskWeb.Control.Acceso;

namespace HelpDeskWeb.Datos
{
    

    public class hdk_ControlCoordinacion
    {
        hdk_ControlAcceso dbHelp;
        
        public hdk_ControlCoordinacion(hdk_ControlAcceso ca)
        {
            dbHelp = ca;
            
        }

        public IList cargarTabla(string filtro)
        {
            try
            {
                return dbHelp.DB.tblcoordinacions.Where(a => a.nomCoordinacion.Contains(filtro)).ToList();
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
                var ItemARemover = dbHelp.DB.tblcoordinacions.SingleOrDefault(x => x.idCoordinacion == id);
                if (ItemARemover != null)
                {
                    dbHelp.DB.tblcoordinacions.Remove(ItemARemover);
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
                }               
                return true;
            }
            catch
            {            
                return false;
            }
        }

        public bool insertar(string nombre)
        {
            try
            {
                var cord = new tblcoordinacion { nomCoordinacion = nombre };
                if (cord != null)
                {
                    dbHelp.DB.tblcoordinacions.Attach(cord);
                    dbHelp.DB.tblcoordinacions.Add(cord);
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
                }
                return true;
            }
            catch
            {            
                return false;
            }   
        }

        public bool modificar(int id, string nombre)
        {
            try
            {
                var ItemAmodificar = dbHelp.DB.tblcoordinacions.SingleOrDefault(x => x.idCoordinacion == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomCoordinacion = nombre;
                    dbHelp.DB.SaveChanges();
                    dbHelp.actualizarModelo();
                    
                }
                return true;
            }
            catch
            {            
                return false;
            }
        }
    }
}
