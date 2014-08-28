
using HelpDeskWeb.Control.Acceso;
using HelpDeskWeb.Modelo;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;


namespace HelpDeskWeb.Control.Catalogo
{
    class hdk_ControlArea
    {
        hdk_ControlAcceso dbHelp;

        public hdk_ControlArea(hdk_ControlAcceso ca)
        {
            dbHelp = ca;
        }

        public IList cargarTabla(string area)
        {
            try
            {
                return dbHelp.DB.tblareas.Where(a => a.nomArea.Contains(area)).ToList();
            }
            catch 
            {              
                return null;
            }
        }

        public IList cargarCombo()
        {
            try
            {
                return dbHelp.DB.tblareas.OrderBy(a => a.idArea).ToList();
            }
            catch 
            {
                return null;
            }
        }

        public bool insertar(string nombre)
        {
            try
            {
                var area = new tblarea { nomArea = nombre };
                if (area != null)
                {
                    dbHelp.DB.tblareas.Attach(area);
                    dbHelp.DB.tblareas.Add(area);
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

                var ItemAmodificar = dbHelp.DB.tblareas.SingleOrDefault(x => x.idArea == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomArea = nombre;
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
