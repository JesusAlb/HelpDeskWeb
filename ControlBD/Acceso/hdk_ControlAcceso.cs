using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows;
using System.Globalization;
using System.Threading;
using System.IO;
using HelpDeskWeb.EntityFrameWork;

namespace HelpDeskWeb.ControlBD.Acceso
{
  public class hdk_ControlAcceso : System.Web.UI.Page
    {
        private dbhelpdeskEntities db;
        private ViewUsuario Item;


        public hdk_ControlAcceso()
        {
            this.actualizarModelo();
        }

        public void actualizarModelo()
        {
            try
            {
                DB = new dbhelpdeskEntities();
            }
            catch  
            {
                DB=null;
            }
        } 

        public dbhelpdeskEntities DB
        {
            get { return db; }
            set { db = value; }
        }

        public ViewUsuario item
      {
          get { return Item; }
          set { Item = value; }
      }

        public bool encontrarUsuario(String nombre, string password){
            bool regreso = true;
            try
            {
                var UsuarioItem = DB.ViewUsuarios.Where(x => x.username == nombre && x.password == password).SingleOrDefault();
                if (UsuarioItem != null)
                {
                    
                    Session["DatosUsuario"] = UsuarioItem;
                    Session["Conexion"] = this;
                }
                else
                {               
                    regreso = false;
                }
            }
            catch 
           {             
                regreso = false;
           }

          return regreso;
        }

    }
}
