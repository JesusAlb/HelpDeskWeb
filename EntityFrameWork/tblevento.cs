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
    
    public partial class tblevento
    {
        public tblevento()
        {
            this.tblrecursoasignado = new HashSet<tblrecursoasignado>();
        }
    
        public int id { get; set; }
        public string nombre { get; set; }
        public int tipo { get; set; }
        public int fk_idlugar { get; set; }
        public int asistencia { get; set; }
        public string acomodo { get; set; }
        public System.DateTime fecha_realizacion { get; set; }
        public string observacion { get; set; }
        public int fk_idservicio { get; set; }
    
        public virtual ICollection<tblrecursoasignado> tblrecursoasignado { get; set; }
        public virtual tblservicio tblservicio { get; set; }
        public virtual tbllugar tbllugar { get; set; }
    }
}
