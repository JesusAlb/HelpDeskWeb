//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HelpDeskWeb.EntityFrameWork
{
    using System;
    using System.Collections.Generic;
    
    public partial class VistaIncidentesSinCerrar
    {
        public int numIncidente { get; set; }
        public string descripcion { get; set; }
        public string prioridad { get; set; }
        public string tipo { get; set; }
        public Nullable<System.DateTime> fecha_Sol { get; set; }
        public int status { get; set; }
        public Nullable<System.DateTime> horaIn { get; set; }
        public Nullable<System.DateTime> horaFn { get; set; }
        public Nullable<System.DateTime> fecha_Cierre { get; set; }
        public string acciones { get; set; }
        public string solucion { get; set; }
        public string solicitante { get; set; }
        public int idSolicitante { get; set; }
        public int idSoporte { get; set; }
        public string soporte { get; set; }
        public string seguimiento { get; set; }
        public int idSeguimiento { get; set; }
    }
}
