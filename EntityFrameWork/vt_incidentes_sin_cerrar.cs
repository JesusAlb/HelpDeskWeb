//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HelpDeskWeb.EntityFrameWork
{
    using System;
    using System.Collections.Generic;
    
    public partial class vt_incidentes_sin_cerrar
    {
        public int id { get; set; }
        public string descripcion { get; set; }
        public string soporte { get; set; }
        public string apoyo { get; set; }
        public string tipo { get; set; }
        public string prioridad { get; set; }
        public string acciones { get; set; }
        public string solucion { get; set; }
        public System.DateTime fecha_solicitud { get; set; }
        public Nullable<System.DateTime> fecha_cierre { get; set; }
        public Nullable<System.DateTime> hora_inicial { get; set; }
        public Nullable<System.DateTime> hora_final { get; set; }
        public int estatus_incidente { get; set; }
        public string solicitante { get; set; }
        public int fk_idusuario_solicitante { get; set; }
    }
}
