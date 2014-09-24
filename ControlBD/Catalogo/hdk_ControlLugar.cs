using HelpDeskWeb.ControlBD;
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
    class hdk_ControlLugar
    {
        hdk_ControlAcceso dbHelp;

        public hdk_ControlLugar(hdk_ControlAcceso ca)
        {
            dbHelp = ca;
        }

        public IList cargarTabla(string filtro)
        {
            try
            {
                return dbHelp.DB.tbllugars.Where(a => a.nomLugar.Contains(filtro)).ToList();
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
                return dbHelp.DB.tbllugars.OrderBy(a => a.idLugar).ToList();
            }
            catch
            {
                return null;
            }

        }

        public bool insertar(string lugar){
            try
            {
                tbllugar Lugar = new tbllugar { nomLugar = lugar };
                if (Lugar != null)
                {
                    dbHelp.DB.tbllugars.Attach(Lugar);
                    dbHelp.DB.tbllugars.Add(Lugar);
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

                var ItemAmodificar = dbHelp.DB.tbllugars.SingleOrDefault(x => x.idLugar == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.nomLugar = nombre;
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

        public tbllugar obtenerLugar(int id)
        {
            try
            {
                return dbHelp.DB.tbllugars.SingleOrDefault(a => a.idLugar == id);
            }
            catch
            {
                return null;
            }
        }
    }
}
