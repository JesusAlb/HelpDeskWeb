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
    
    public partial class tblcalidadservicio
    {
        public tblcalidadservicio()
        {
            this.tblrespuesta = new HashSet<tblrespuesta>();
        }
    
        public int id { get; set; }
        public string observaciones { get; set; }
        public bool estatus { get; set; }
        public double promedio { get; set; }
        public int fk_idservicio { get; set; }
    
        public virtual ICollection<tblrespuesta> tblrespuesta { get; set; }
        public virtual tblservicio tblservicio { get; set; }
    }
}
