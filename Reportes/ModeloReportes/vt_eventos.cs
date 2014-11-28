using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HelpDeskWeb.Reportes.ModeloReportes
{
    public class vt_eventos
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string solicitante { get; set; }
        public DateTime fecha_realizacion { get; set; }
        public DateTime fecha_solicitud { get; set; }
        public DateTime? hora_inicial { get; set; }
        public DateTime? hora_final { get; set; }
        public DateTime? fecha_cierre { get; set; }
        public string soporte { get; set; }
        public string apoyo { get; set; }
        public string estatus { get; set; }
    }
}