using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HelpDeskWeb.Reportes.ModeloReportes
{
    public class vt_usuario
    {
        public int id { get; set; }
        public string nombre_usuario { get; set; }
        public string nom_completo { get; set; }
        public string password { get; set; }
        public string nom_tipo { get; set; }
        public string extension_telefonica { get; set; }
        public string nom_depto { get; set; }
        public string nom_coordinacion { get; set; }
        public string nom_area { get; set; }
        public string nom_puesto { get; set; }
        public int fk_idtipo { get; set; }
        public string correo { get; set; }
        public string nom_institucion { get; set; }
    }
}