//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HelpDeskWeb.Modelo
{
    using System;
    using System.Collections.Generic;
    
    public partial class ViewEventoConRequerimiento
    {
        public int evento { get; set; }
        public Nullable<int> cantidad { get; set; }
        public Nullable<int> asistencia_aprox { get; set; }
        public string tipo_evento { get; set; }
        public string acomodo { get; set; }
        public Nullable<System.DateTime> horaIn { get; set; }
        public Nullable<System.DateTime> horaFn { get; set; }
        public Nullable<System.DateTime> FechaInicio { get; set; }
        public string observaciones { get; set; }
        public string titulo { get; set; }
        public string nomLugar { get; set; }
        public string nomCoordinacion { get; set; }
        public string nomRequerimiento { get; set; }
        public int idRequerimientos { get; set; }
    }
}