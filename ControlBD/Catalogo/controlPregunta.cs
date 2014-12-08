
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
    class controlPregunta
    {

        public static IList<tblpregunta> obtenerDataSource(string pregunta)
        {
            try
            {
                return dbhelp.modelo.tblpregunta.Where(a => a.pregunta.Contains(pregunta)).OrderBy(a => a.id).ToList();
            }
            catch 
            {              
                return null;
            }
        }

        public static bool insertar(string pregunta)
        {
            try
            {
                var item = new tblpregunta { pregunta = pregunta };
                if (item != null)
                {
                    dbhelp.modelo.tblpregunta.Attach(item);
                    dbhelp.modelo.tblpregunta.Add(item);
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

        public static bool modificar(int id, string pregunta)
        {
            try
            {

                var ItemAmodificar = dbhelp.modelo.tblpregunta.SingleOrDefault(x => x.id == id);
                if (ItemAmodificar != null)
                {
                    ItemAmodificar.pregunta = pregunta;
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

        public static tblpregunta obtenerPregunta(int id)
        {
            try
            {
                return dbhelp.modelo.tblpregunta.SingleOrDefault(a => a.id == id);
            }
            catch
            {
                return null;
            }
        }

    }
}
